import "../widgets/appDrawer.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../widgets/subProductTypeItem.dart";
import "../providers/subProductTypeProvider.dart";

class SubProductTypeScreen extends StatelessWidget {
  static const routeName = "/subProductType";
  final String userId;

  SubProductTypeScreen(
    this.userId
  );

  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final subProductArguments = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final subProductListLength = Provider.of<SubProductTypeProvider>(context, listen: false).getSubProductSubProductTypesById(subProductArguments["subProductId"]).length;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(subProductArguments["subProductName"]),
      ),
      endDrawer: AppDrawer(
        userId,
        deviceSize
      ),
      body: subProductListLength == 0 ?
      Container(
        color: Theme.of(context).primaryColor,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: double.infinity,
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
            )
          ]
        )
      ) :
      Container(
        color: Theme.of(context).primaryColor,
        child: Consumer<SubProductTypeProvider>(
          builder: (ctx, subProductTypeData, _) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.1,
              vertical: deviceSize.height * 0.03
            ),
            child: ListView.builder(
              itemCount: subProductListLength,
              itemBuilder: (_, index) => Column(
                children: [
                  SubProductTypeItem(
                    subProductTypeData.getSubProductSubProductTypesById(subProductArguments["subProductId"])[index],
                    subProductArguments["subProductId"],
                    deviceSize
                  )
                ]
              )
            )
          )
        )
      )
    );
  }
}