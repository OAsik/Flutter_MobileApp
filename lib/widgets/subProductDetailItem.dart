import "package:flutter/material.dart";
import "../models/subProductDetail.dart";

class SubProductDetailItem extends StatelessWidget {
  final Size deviceSize;
  final SubProductDetail subProductDetail;

  SubProductDetailItem(
    this.deviceSize,
    this.subProductDetail
  );

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (subProductDetail.quantity == 0)
            Text(
              "Out of stock",
              style: TextStyle(
                color: Theme.of(context).buttonColor.withOpacity(0.5),
                fontSize: 18
              )
            )
            else if (subProductDetail.quantity < 4)
            Text(
              "Only ${subProductDetail.quantity} left in stock - Hurry up!",
              style: TextStyle(
                color: Theme.of(context).buttonColor.withOpacity(0.5),
                fontSize: 18
              )
            )
            else
            Text(
              "${subProductDetail.quantity} left in stock",
              style: TextStyle(
                color: Theme.of(context).buttonColor.withOpacity(0.5),
                fontSize: 18
              )
            )
          ]
        ),
        SizedBox(
          height: deviceSize.height * 0.03,
        ),
        Row(
          children: [
            Text(
              "Price: ",
              style: TextStyle(
                color: Theme.of(context).buttonColor.withOpacity(0.5),
                fontSize: 18
              )
            ),
            Icon(
              Icons.euro_symbol,
              color: Theme.of(context).buttonColor.withOpacity(0.5),
              size: 16,
            ),
            Text(
              subProductDetail.toString(),
              style: TextStyle(
                color: Theme.of(context).buttonColor.withOpacity(0.5),
                fontSize: 18
              )
            )
          ]
        ),
        SizedBox(
          height: deviceSize.height * 0.03,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description: ",
              style: TextStyle(
                color: Theme.of(context).buttonColor.withOpacity(0.5),
                fontSize: 18
              )
            ),
            SizedBox(
              height: deviceSize.height * 0.016
            ),
            Text(
              subProductDetail.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Theme.of(context).buttonColor.withOpacity(0.5),
                fontSize: 18
              )
            )
          ]
        )
      ]
    );
  }
}