import "../models/subProduct.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../screens/subProductTypeScreen.dart";

class SubProductItem extends StatelessWidget {
  Widget build(BuildContext context) {
    final subProduct = Provider.of<SubProduct>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              SubProductTypeScreen.routeName,
              arguments: {
                "subProductId": subProduct.id,
                "subProductName": subProduct.name
              }
            );
          },
          child: subProduct.picture
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            subProduct.name,
            textAlign: TextAlign.center
          )
        )
      )
    );
  }
}