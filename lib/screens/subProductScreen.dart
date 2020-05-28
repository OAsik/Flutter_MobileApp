import "../widgets/appDrawer.dart";
import "../widgets/productGrid.dart";
import "package:flutter/material.dart";

class SubProductScreen extends StatelessWidget {
  static const routeName = "/subProduct";
  final userId;

  SubProductScreen(
    this.userId
  );

  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final arguments = ModalRoute.of(context).settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(arguments["productName"])
      ),
      endDrawer: AppDrawer(
        userId,
        deviceSize
      ),
      body: ProductGrid(
        arguments["productId"],
        deviceSize
      )
    );
  }
}