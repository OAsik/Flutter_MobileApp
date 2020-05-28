import "../screens/productScreen.dart";
import "package:flutter/material.dart";

class CategoryItem extends StatelessWidget {
  final Image categoryImage;
  final String categoryName;
  final Size deviceSize;
  final String categoryId;

  CategoryItem({
    @required this.categoryImage,
    @required this.categoryName,
    @required this.deviceSize,
    this.categoryId
  });

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).primaryColorLight,
          height: deviceSize.height * 0.205,
          child: Row(
            children: [
              SizedBox(
                width: deviceSize.width * 0.03
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: categoryImage,
              ),
              SizedBox(
                width: deviceSize.width * 0.1
              ),
              Text(
                categoryName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).buttonColor.withOpacity(0.5)
                )
              )
            ]
          )
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: const Color.fromRGBO(196, 196, 196, 0.1),
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductScreen.routeName,
                  arguments: categoryId
                );
              },
            )
          )
        )
      ]
    );
  }
}