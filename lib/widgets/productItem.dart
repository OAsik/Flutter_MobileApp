import "../models/product.dart";
import "package:flutter/material.dart";
import "../screens/subProductScreen.dart";

class ProductItem extends StatelessWidget {
  final List<Product> productList;
  final Size deviceSize;

  ProductItem({
    @required this.productList,
    @required this.deviceSize
  });

  List<Widget> _productContainer(BuildContext context) {
    List<Widget> _widgetList = List();

    productList.forEach((subProduct) {
      _widgetList.add(Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              children: [
                subProduct.picture,
                SizedBox(height: deviceSize.height * 0.018),
                Text(
                  subProduct.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).buttonColor.withOpacity(0.5)
                  )
                )
              ]
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: const Color.fromRGBO(196, 196, 196, 0.1),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      SubProductScreen.routeName,
                      arguments: {
                        "productId": subProduct.id,
                        "productName": subProduct.name
                      }
                    );
                  }
                )
              )
            )
          ]
        )
      ));
    });

    return _widgetList;
  }

  Widget build(BuildContext context) {
    return Row(
      children: _productContainer(context)
    );
  }
}