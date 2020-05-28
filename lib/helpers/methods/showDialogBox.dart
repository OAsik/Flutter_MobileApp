import "package:flutter/material.dart";
import "../constants/applicationConstant.dart";

class ShowDialogBox {
  static void showDialogBox(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(ApplicationConstant.errorDialogBoxTitle),
        content: Text(message),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Ok")
          )
        ]
      )
    );
  }
}