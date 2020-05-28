import "../models/product.dart";
import "../models/subCategory.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/userOderProvider.dart";
import "../providers/userFavoriteProvider.dart";
import "../helpers/constants/applicationConstant.dart";

class TabBarViewInput extends StatefulWidget {
  final SubCategory subCategory;
  final List<Product> productList;
  final Size deviceSize;
  final String userId;

  TabBarViewInput(
    this.subCategory,
    this.productList,
    this.deviceSize,
    this.userId
  );

  _TabBarViewInputState createState() => _TabBarViewInputState();
}

class _TabBarViewInputState extends State<TabBarViewInput> {
  String _menuOption = "";

  Widget build(BuildContext context) {
    void _initialProcess(String subCategoryId, String productId) {
      bool result = Provider.of<UserFavoriteProvider>(context, listen: false).getSingleUserFavoriteById(widget.userId, productId);

      if (result) {
        Provider.of<UserFavoriteProvider>(context, listen: false).deleteUserFavorite(widget.userId, productId);

        _menuOption = ApplicationConstant.menuOptionAddFavorite;
      }
      else {
        Provider.of<UserFavoriteProvider>(context, listen: false).createUserFavorite(widget.userId, subCategoryId, productId);

        _menuOption = ApplicationConstant.menuOptionRemoveFavorite;
      }
    }

    void _addCart(String userId, String productId, double unitPrice) {
      Provider.of<UserOrderProvider>(context, listen: false).createUserOrder(
        userId,
        productId,
        "",
        unitPrice
      );
    }

    void _undoAddCart(String userId, String productId, double unitPrice) {
      Provider.of<UserOrderProvider>(context, listen: false).deleteSingleUserOrder(
        userId,
        productId,
        "",
        unitPrice
      );
    }

    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        children: [
          if (widget.productList.where((product) => product.subCategoryId == widget.subCategory.id).toList().length == 0)
          Center(
            child: Container(
              height: widget.deviceSize.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Products in This Category Yet",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).buttonColor.withOpacity(0.5)
                    )
                  )
                ]
              )
            )
          )
          else
          for (Product subCategoryProduct in widget.productList.where((product) => product.subCategoryId == widget.subCategory.id).toList())
          Card(
            child: Container(
              color: Theme.of(context).primaryColorLight,
              child: Row(
                children: [
                  PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Theme.of(context).buttonColor.withOpacity(0.5)
                    ),
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Consumer<UserFavoriteProvider>(
                          builder: (ctx, userFavoriteData, _) => userFavoriteData.getSingleUserFavoriteById(widget.userId, subCategoryProduct.id) ? Text(ApplicationConstant.menuOptionRemoveFavorite) : Text(ApplicationConstant.menuOptionAddFavorite)
                        ),
                        value: _menuOption
                      ),
                      PopupMenuItem(
                        child: Text("Place Order"),
                        value: ApplicationConstant.menuOptionPlaceOrder
                      )
                    ],
                    onSelected: (String menuOption) {
                      if (menuOption == ApplicationConstant.menuOptionPlaceOrder) {
                        _addCart(
                          widget.userId,
                          subCategoryProduct.id,
                          subCategoryProduct.price
                        );

                        Scaffold.of(context).hideCurrentSnackBar();

                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Item Added to Cart"),
                            duration: Duration(
                              milliseconds: 3000
                            ),
                            action: SnackBarAction(
                              label: "Undo",
                              onPressed: () {
                                _undoAddCart(
                                  widget.userId,
                                  subCategoryProduct.id,
                                  subCategoryProduct.price
                                );
                              }
                            )
                          )
                        );
                      }
                      else {
                        _initialProcess(
                          widget.subCategory.id,
                          subCategoryProduct.id
                        );
                      }
                    }
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: widget.deviceSize.height * 0.014
                        ),
                        width: widget.deviceSize.width * 0.25,
                        child: Text(
                          subCategoryProduct.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).buttonColor.withOpacity(0.5)
                          )
                        )
                      ),
                      Divider(), //Spacer() ?
                      Container(
                        margin: EdgeInsets.only(
                          bottom: widget.deviceSize.height * 0.014
                        ),
                        width: widget.deviceSize.width * 0.5,
                        child: Text(
                          subCategoryProduct.description,
                          style: TextStyle(
                            color: Theme.of(context).buttonColor.withOpacity(0.5)
                          )
                        )
                      )
                    ]
                  ),
                  SizedBox(width: widget.deviceSize.width * 0.022),
                  subCategoryProduct.picture
                ]
              )
            )
          )
        ]
      )
    );
  }
}