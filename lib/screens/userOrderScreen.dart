import "dart:math";
import "../widgets/appDrawer.dart";
import "../screens/homeScreen.dart";
import "../widgets/userOrderItem.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/userOderProvider.dart";

class UserOrderScreen extends StatelessWidget {
  static const String routeName = "/userOrder";
  final String userId;

  UserOrderScreen(
    this.userId
  );

  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    bool isCartEmpty = Provider.of<UserOrderProvider>(context, listen: false).getUserOrders(userId).length == 0 ? true : false;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Color.fromRGBO(51, 28, 5, 1),
        backgroundColor: Theme.of(context).accentColor,
        iconTheme: Theme.of(context).iconTheme,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              HomeScreen.routeName
            );
          },
        ),
        title: Text("Your Orders"),
      ),
      endDrawer: AppDrawer(
        userId,
        deviceSize
      ),
      body: Container(
        //color: Color.fromRGBO(12, 12, 11, 1).withOpacity(0.98),
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.only(
            left: deviceSize.width * 0.04,
            top: deviceSize.height * 0.035,
            right: deviceSize.width * 0.04
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Sub-Totals",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).buttonColor.withOpacity(0.5)
                )
              ),
              Container(
                width: deviceSize.width * 0.25,
                child: Divider(
                  thickness: 3,
                  color: Theme.of(context).buttonColor.withOpacity(0.5)
                )
              ),
              SizedBox(
                height: deviceSize.height * 0.5,
                  child: Consumer<UserOrderProvider>(
                  builder: (ctx, userOrderData, _) => ListView.builder(
                    key: ValueKey(Random().nextInt(100000).toString()),
                    itemCount: userOrderData.getUserOrders(userId).length,
                    itemBuilder: (_, index) => UserOrderItem(
                      userOrderData.getUserOrders(userId)[index],
                      deviceSize
                    )
                  )
                )
              ),
              Container(
                width: deviceSize.width * 0.25,
                child: Divider(
                  thickness: 3,
                  color: Theme.of(context).buttonColor.withOpacity(0.5)
                )
              ),
              Text(
                "Total: ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).buttonColor.withOpacity(0.5)
                )
              ),
              Consumer<UserOrderProvider>(
                builder: (ctx, userOrderData, _) => Text(
                  userOrderData.getUserOrderTotal(userId).toStringAsFixed(2) + " EUR",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).buttonColor.withOpacity(0.5)
                  )
                )
              ),
              SizedBox(
                height: deviceSize.height * 0.05,
              ),
              RaisedButton(
                onPressed: isCartEmpty ?
                () {} :
                () {},
                child: isCartEmpty ?
                Text (
                  "Your Cart is Empty",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).buttonColor.withOpacity(0.5)
                  )
                ) :
                Text(
                  "Place Order",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).buttonColor
                  )
                ),
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                )
              )
            ]
          )
        )
      )
    );
  }
}