import "package:flutter/material.dart";
import "../helpers/constants/applicationConstant.dart";

class DismissibleBackgroundItem extends StatelessWidget {
  final String dismissType;
  final Size deviceSize;

  DismissibleBackgroundItem(
    this.dismissType,
    this.deviceSize
  );

  Widget build(BuildContext context) {
    if (dismissType == ApplicationConstant.dismissToRemoveFromFavorites) {
      return Container (
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(178, 0, 0, 0).withOpacity(1),
              Colors.black
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0, 1]
          )
        ),
        child: Icon(
          Icons.star_border,
          color: Theme.of(context).buttonColor.withOpacity(0.5),
          size: 40
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
          left: deviceSize.width * 0.025
        ),
        margin: EdgeInsets.symmetric(
          horizontal: deviceSize.width * 0.012,
          vertical: deviceSize.height * 0.008
        )
      );
    }
    else if (dismissType == ApplicationConstant.dismissToPlaceOrder) {
      return Container (
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(2, 178, 0, 0).withOpacity(1),
              Colors.black
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            stops: [0, 1]
          )
        ),
        child: Icon(
          Icons.shop,
          color: Theme.of(context).buttonColor.withOpacity(0.5),
          size: 40
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(
          right: deviceSize.width * 0.025
        ),
        margin: EdgeInsets.symmetric(
          horizontal: deviceSize.width * 0.012,
          vertical: deviceSize.height * 0.008
        )
      );
    }
    else if (dismissType == ApplicationConstant.dismissToRemoveFromCart) {
      return Container (
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(178, 0, 0, 0).withOpacity(1),
              Colors.black
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0, 1]
          )
        ),
        child: Icon(
          Icons.remove_shopping_cart,
          color: Theme.of(context).buttonColor.withOpacity(0.5),
          size: 28
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
          left: deviceSize.width * 0.025
        ),
        margin: EdgeInsets.only(
          left: deviceSize.width * 0.006,
          top: deviceSize.height * 0.003,
          bottom: deviceSize.height * 0.01
        )
      );
    }
    else {
      return Container();
    }
  }
}