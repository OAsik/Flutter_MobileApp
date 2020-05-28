import "dart:math";
import "../models/product.dart";
import "../models/userOder.dart";
import "package:flutter/material.dart";
import "../screens/productScreen.dart";
import "package:provider/provider.dart";
import "../models/subProductDetail.dart";
import "../providers/productProvider.dart";
import "../providers/userOderProvider.dart";
import "../providers/subProductProvider.dart";
import "../screens/subProductDetailScreen.dart";
import "../widgets/dismissibleBackgroundItem.dart";
import "../providers/subProductDetailProvider.dart";
import "../helpers/constants/applicationConstant.dart";

class UserOrderItem extends StatefulWidget {
  final UserOrder userOrderItem;
  final Size deviceSize;

  UserOrderItem(
    this.userOrderItem,
    this.deviceSize
  );

  _UserOrderItemState createState() => _UserOrderItemState();
}

class _UserOrderItemState extends State<UserOrderItem> {
  String _quantityMarker = "";
  bool _spaceMarker = false;
  String _productTitle = "";
  String _unitPriceLabel = "Unit price: ";
  String _subTotalLabel = "";
  int _maxQuantityLimit = 0;
  int _newQuantity = 0;
  UserOrder _updatedUserOrder;
  bool _initialLaunch = true;
  SubProductDetail _subProductDetail;
  Product _product;

  void didChangeDependencies() {
    if (_initialLaunch) {
      _newQuantity = widget.userOrderItem.productQuantity;
      _updatedUserOrder = widget.userOrderItem;

      if (widget.userOrderItem.productQuantity == 1) {
        _quantityMarker = "unit";
      }
      else {
        _quantityMarker = "units";
        _spaceMarker = true;
      }

      if (widget.userOrderItem.productId == "") {
        _subProductDetail = Provider.of<SubProductDetailProvider>(context, listen: false).getSingleSubProductDetailById(widget.userOrderItem.subProductDetailId);

        if (_subProductDetail.name.length > 15) {
          _productTitle = _subProductDetail.name.substring(0, 14) + "...";
        }
        else {
          _productTitle = _subProductDetail.name;
        }
        
        _unitPriceLabel += _subProductDetail.toString();

        setState(() {
          _subTotalLabel = (_newQuantity * _subProductDetail.price).toStringAsFixed(2);
        });

        _maxQuantityLimit = _subProductDetail.quantity;
      }
      else if (widget.userOrderItem.subProductDetailId == "") {
        _product = Provider.of<ProductProvider>(context, listen: false).getSingleProductById(widget.userOrderItem.productId);

        if (_product.name.length > 15) {
          _productTitle = _product.name.substring(0, 14) + "...";
        }
        else {
          _productTitle = _product.name;
        }

        _unitPriceLabel += _product.toString();        

        _subTotalLabel = (_newQuantity *  _product.price).toStringAsFixed(2);
      }
    }

    setState(() {
      _initialLaunch = false;
    });

    super.didChangeDependencies();
  }

  Future<bool> _openDialog(BuildContext context, String dialogTitle, String dialogContent, bool isDecisionRequired) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(dialogTitle),
        content: Text(dialogContent),
        actions: isDecisionRequired ?
        [
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop(true);
            },
            child: Text("Ok")
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop(false);
            },
            child: Text("Cancel")
          )
        ] :
        [
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Ok")
          )
        ]
      )
    );
  }

  Widget build(BuildContext context) {
    void _increaseQuantity(BuildContext context) {
      if (widget.userOrderItem.productId == "") {
        if (widget.userOrderItem.productQuantity < _maxQuantityLimit) {
          setState(() {
            if (_newQuantity == 1) {
              _quantityMarker = "units";

              _spaceMarker = true;
            }

            _newQuantity++;

            _subTotalLabel = (_newQuantity * _subProductDetail.price).toStringAsFixed(2);
          });

          _updatedUserOrder.productQuantity = _newQuantity;
          _updatedUserOrder.total = _newQuantity * _subProductDetail.price;
        }
        else {
          _openDialog(context, "Max. Stock Quantity Reached", "Unfortunatelly you cannot purchase more from this product for now.", false);
        }
      }
      else if (widget.userOrderItem.subProductDetailId == "") {
        setState(() {
          if (_newQuantity == 1) {
            _quantityMarker = "units";

            _spaceMarker = true;
          }

          _newQuantity++;

          _subTotalLabel = (_newQuantity *  _product.price).toStringAsFixed(2);
        });

        _updatedUserOrder.productQuantity = _newQuantity;
        _updatedUserOrder.total = _newQuantity * _product.price;
      }

      Provider.of<UserOrderProvider>(context, listen: false).updateUserOrder(widget.userOrderItem.id, _updatedUserOrder);
    }

    Future<void> _decreaseQuantity(BuildContext context) async {
      bool _deleteConfirmation = false;
      if (_newQuantity == 1) {
        _deleteConfirmation = await _openDialog(context, "Only 1 Unit Left From This Product", "Do you actually remove this product from your cart?", true);

        if (_deleteConfirmation) {
          Provider.of<UserOrderProvider>(context, listen: false).deleteUserOrder(widget.userOrderItem.id);
        }
      }
      else {
        if (widget.userOrderItem.productId == "") {
          setState(() {
            _newQuantity--;

            if (_newQuantity == 1) {
              _quantityMarker = "unit";

              _spaceMarker = false;
            }

            _subTotalLabel = (_newQuantity * _subProductDetail.price).toStringAsFixed(2);
          });

          _updatedUserOrder.productQuantity = _newQuantity;
          _updatedUserOrder.total = _newQuantity * _subProductDetail.price;
        }
        else if (widget.userOrderItem.subProductDetailId == "") {
          setState(() {
            _newQuantity--;

            if (_newQuantity == 1) {
              _quantityMarker = "unit";

              _spaceMarker = false;
            }

            _subTotalLabel = (_newQuantity *  _product.price).toStringAsFixed(2);
          });

          _updatedUserOrder.productQuantity = _newQuantity;
          _updatedUserOrder.total = _newQuantity * _product.price;
        }
      }

      if (!_deleteConfirmation) {
        Provider.of<UserOrderProvider>(context, listen: false).updateUserOrder(widget.userOrderItem.id, _updatedUserOrder);
      }
    }

    return Dismissible(
      key: ValueKey(widget.userOrderItem.productId == "" ? _subProductDetail.id + Random().nextInt(100000).toString() : _product.id + Random().nextInt(100000).toString()),
      background: DismissibleBackgroundItem(
        ApplicationConstant.dismissToRemoveFromCart,
        widget.deviceSize
      ),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (_) => _openDialog(context, "Removing Product", "Are you sure to remove this product from your cart", true),
      onDismissed: (_) {
        Provider.of<UserOrderProvider>(context, listen: false).deleteUserOrder(widget.userOrderItem.id);
      },
      child: GestureDetector(
        onTap: () {
          if (widget.userOrderItem.productId == "") {
            final _subProductName = Provider.of<SubProductProvider>(context, listen: false).getSingleSubProductById(_subProductDetail.subProductId).name;

            Navigator.of(context).pushNamed(
              SubProductDetailScreen.routeName,
              arguments: {
                "subProductDetailId": _subProductDetail.id,
                "subProductName": _subProductName
              }
            );
          }
          else if (widget.userOrderItem.subProductDetailId == "") {
            final _categoryId = Provider.of<ProductProvider>(context, listen: false).getSingleProductById(_product.id).categoryId;

            Navigator.of(context).pushNamed(
              ProductScreen.routeName,
              arguments: _categoryId
            );
          }
        },
        child: Container(
          margin: EdgeInsets.only(
            bottom: widget.deviceSize.height * 0.01
          ),
          //color: const Color.fromRGBO(43, 43, 43, 1),
          color: Theme.of(context).primaryColorLight,
          child: Row(
            children: [
              SizedBox(
                width: widget.deviceSize.width * 0.02
              ),
              Column(
                children: [
                  Text(
                    _newQuantity.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).buttonColor.withOpacity(0.5)
                    )
                  ),
                  Text(
                    _quantityMarker,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).buttonColor.withOpacity(0.5)
                    )
                  )
                ]
              ),
              SizedBox(
                width: _spaceMarker ? widget.deviceSize.width * 0.02 : widget.deviceSize.width * 0.035
              ),
              Column(
                children: [
                  Container(
                    height: widget.deviceSize.height * 0.038,
                    child: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Theme.of(context).buttonColor.withOpacity(0.5)
                      ),
                      onPressed: () {
                        _increaseQuantity(context);
                      }
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      color: Theme.of(context).buttonColor.withOpacity(0.5)
                    ),
                    onPressed: () {
                      _decreaseQuantity(context);
                    }
                  )
                ]
              ),
              SizedBox(
                width: _spaceMarker ? widget.deviceSize.width * 0.06 : widget.deviceSize.width * 0.065
              ),
              Container(
                width: widget.deviceSize.width * 0.42,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: widget.deviceSize.width * 0.42,
                      child: Text(
                        _productTitle,
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).buttonColor.withOpacity(0.5),
                          fontWeight: FontWeight.w800
                        )
                      )
                    ),
                    SizedBox(
                      height: widget.deviceSize.height * 0.008
                    ),
                    Row(
                      children: [
                        Text(
                          _unitPriceLabel,
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).buttonColor.withOpacity(0.5),
                            fontWeight: FontWeight.w800
                          )
                        ),
                        Icon(
                          Icons.euro_symbol,
                          color: Theme.of(context).buttonColor.withOpacity(0.5),
                          size: 13
                        )
                      ]
                    )
                  ]
                )
              ),
              SizedBox(
                width: widget.deviceSize.width * 0.02
              ),
              CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                radius: 28.0,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: FittedBox(
                    child: Text(
                      _subTotalLabel + " €",
                      style: TextStyle(
                        color: Theme.of(context).buttonColor
                      )
                    )
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}