import "../models/subCategory.dart";
import "package:flutter/material.dart";

class TabInput extends StatelessWidget {
  final SubCategory subCategory;
  final Size deviceSize;

  TabInput(
    this.subCategory,
    this.deviceSize
  );

  Widget build(BuildContext context) {
    return Tab(
      child: SizedBox(
        width: deviceSize.width * 0.25,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            subCategory.name,
            style: TextStyle(
              fontSize: 20
            )
          )
        )
      )
    );
  }
}