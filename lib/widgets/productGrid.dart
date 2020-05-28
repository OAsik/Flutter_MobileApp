import "../models/subProduct.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../widgets/subProductItem.dart";
import "../providers/subProductProvider.dart";

class ProductGrid extends StatelessWidget {
  final String productId;
  final Size deviceSize;

  ProductGrid(
    this.productId,
    this.deviceSize
  );

  Widget build(BuildContext context) {
    List<SubProduct> subProductList = Provider.of<SubProductProvider>(context).getSubProductsById(productId);

    if (subProductList.length == 0) {
      return Flex(
        direction: Axis.vertical,
        children: [Expanded(
          child: Center(
            child: Container(
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Products Yet",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).buttonColor.withOpacity(0.5)
                    )
                  )
                ]
              )
            )
          )
        )]
      );
    }
    else {
      return Container(
        color: Theme.of(context).primaryColor,
        child: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: subProductList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: deviceSize.width * 0.05,
            mainAxisSpacing: deviceSize.height * 0.045
          ),
          //ChangeNotiferProvider allows us to register a class that we want to listen in CHILD widgets. So, whenever that class updated, the child wigdets which ARE listening, will rebuild.
          itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
            value: subProductList[index],
            child: SubProductItem()
          )
        )
      );
    }
  }
}