import "dart:math";
import "../models/product.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/productProvider.dart";
import "../providers/userOderProvider.dart";
import "../providers/userFavoriteProvider.dart";
import "../widgets/dismissibleBackgroundItem.dart";
import "../helpers/constants/applicationConstant.dart";

class FavoriteItem extends StatelessWidget {
  final List<String> productIdList;
  final Size deviceSize;
  final String userId;
  final Function refreshState;

  FavoriteItem(
    this.productIdList,
    this.deviceSize,
    this.userId,
    this.refreshState
  );

  List<Widget> _favoriteContainer(List<Product> productList, BuildContext context) {
    List<Widget> _widgetList = List();

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

    productList.forEach((product) {
      _widgetList.add(
        Dismissible(
          key: ValueKey(product.id + Random().nextInt(100000).toString()),
          background: DismissibleBackgroundItem(
            ApplicationConstant.dismissToRemoveFromFavorites,
            deviceSize
          ),
          secondaryBackground: DismissibleBackgroundItem(
            ApplicationConstant.dismissToPlaceOrder,
            deviceSize
          ),
          child: Card(
            child: Container(
              color: Theme.of(context).primaryColorLight,
              child: ListTile(
                leading: Container(
                  width: deviceSize.height * 0.08,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: product.picture,
                  )
                ),
                title: Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).buttonColor.withOpacity(0.5)
                  )
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.euro_symbol,
                      color: Theme.of(context).buttonColor.withOpacity(0.5),
                      size: 14,
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.008,
                    ),
                    Text(
                      product.toString(), //product's .toString() method is overriden as to display product's price properly. Check product.dart under models folder --Özgür
                      style: TextStyle(
                        color: Theme.of(context).buttonColor.withOpacity(0.5)
                      )
                    )
                  ]
                ),
                trailing: Icon(
                  Icons.compare_arrows,
                  color: Theme.of(context).buttonColor.withOpacity(0.5)
                )
              )
            )
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              Provider.of<UserFavoriteProvider>(context, listen: false).deleteUserFavorite(userId, product.id);
            }
            else {
              _addCart(
                userId,
                product.id,
                product.price
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
                        userId,
                        product.id,
                        product.price
                      );
                    }
                  )
                )
              );

              refreshState();
            }
          },
        )
      );
    });

    return _widgetList;
  }

  Widget build(BuildContext context) {
    List<Product> productList = Provider.of<ProductProvider>(context, listen: false).getProductsById(productIdList);

    return Column(
      children: _favoriteContainer(productList, context),
    );
  }
}