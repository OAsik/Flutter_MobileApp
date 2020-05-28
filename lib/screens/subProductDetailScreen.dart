import "../widgets/appDrawer.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/userOderProvider.dart";
import "../widgets/subProductDetailItem.dart";
import "../providers/subProductDetailProvider.dart";

class SubProductDetailScreen extends StatelessWidget {
  static const routeName = "/subProductDetail";
  final String userId;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  SubProductDetailScreen(
    this.userId
  );

  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final subProductArguments = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final subProductDetail = Provider.of<SubProductDetailProvider>(context, listen: false).getSingleSubProductDetailById(subProductArguments["subProductDetailId"]);

    void _addCart(String userId, String subProductDetailId, double unitPrice) {
      Provider.of<UserOrderProvider>(context, listen: false).createUserOrder(
        userId,
        "",
        subProductDetailId,
        unitPrice
      );
    }

    void _undoAddCart(String userId, String subProductDetailId, double unitPrice) {
      Provider.of<UserOrderProvider>(context, listen: false).deleteSingleUserOrder(
        userId,
        "",
        subProductDetailId,
        unitPrice
      );
    }

    if (subProductDetail == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          title: Text(
            subProductArguments["subProductName"]
          )
        ),
        endDrawer: AppDrawer(
          userId,
          deviceSize
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Container(
              height: deviceSize.height * 0.8,
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
      );
    }
    else {
      return Scaffold(
        key: _scaffoldKey,
        body: Container(
          color: Theme.of(context).primaryColor,
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                iconTheme: IconThemeData(
                  color: Theme.of(context).accentColor
                ),
                expandedHeight: deviceSize.height * 0.42,
                stretch: true,
                //Another interesting thing that it brings is that we can launch an action when we scroll our widget. The property we will use will be onStretchTrigger, where we can execute any action. By default the trigger is called when the scroll exceeds 100.0 pixels but we can override that using the new stretchTriggerOffset property. --Diego Velasquez from Medium.com
                /*stretchTriggerOffset: 120,
                onStretchTrigger: () {},*/
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(width: 200,
                    child: Flex( 
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  subProductDetail.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w800
                                  )
                                )
                              ]
                            )
                          )
                        )
                      ]
                    )
                  ),
                  stretchModes: [
                    StretchMode.fadeTitle,
                    StretchMode.zoomBackground
                  ],
                  background: subProductDetail.picture,
                )
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: deviceSize.height * 0.06,
                  horizontal: deviceSize.width * 0.05
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    SubProductDetailItem(
                      deviceSize,
                      subProductDetail
                    )
                  ])
                )
              )
            ]
          )
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.shop,
            color: Theme.of(context).buttonColor,
          ),
          elevation: 2,
          backgroundColor: Theme.of(context).accentColor,
          onPressed: () {
            _addCart(
              userId,
              subProductDetail.id,
              subProductDetail.price
            );

            _scaffoldKey.currentState.hideCurrentSnackBar();

            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text("Item Added to Cart"),
                duration: Duration(
                  milliseconds: 3000
                ),
                action: SnackBarAction(
                  label: "Undo",
                  onPressed: () {
                    _undoAddCart(
                      userId,
                      subProductDetail.id,
                      subProductDetail.price
                    );
                  }
                )
              )
            );
          }
        ),
        endDrawer: AppDrawer(
          userId,
          deviceSize
        )
      );
    }
  }
}