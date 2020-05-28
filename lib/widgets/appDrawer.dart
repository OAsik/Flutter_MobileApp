import "../models/user.dart";
import "../screens/homeScreen.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/userProvider.dart";
import "../screens/userOrderScreen.dart";
import "../screens/userProfileScreen.dart";
import "../screens/availableUserScreen.dart";

class AppDrawer extends StatelessWidget {
  final String userId;
  final Size deviceSize;

  AppDrawer(
    this.userId,
    this.deviceSize
  );

  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context, listen: false).getSingleUserById(userId);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor
      ),
      width: deviceSize.width * 0.65,
      child: Column(
        children: [
          AppBar(
            backgroundColor: Theme.of(context).accentColor,
            title: Text("Hello, ${user.userName}!"),
            automaticallyImplyLeading: false,
            actions: [
              Container()
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                HomeScreen.routeName
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).buttonColor.withOpacity(0.5)
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).buttonColor.withOpacity(0.5)
                )
              )
            ),
          ),
          Divider(
            color: Theme.of(context).buttonColor.withOpacity(0.5)
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AvailableUserScreen.routeName,
                arguments: deviceSize
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.settings_input_antenna,
                color: Theme.of(context).buttonColor.withOpacity(0.5)
              ),
              title: Text(
                "People Looking for Party",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).buttonColor.withOpacity(0.5)
                )
              )
            ),
          ),
          Divider(
            color: Theme.of(context).buttonColor.withOpacity(0.5)
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                UserOrderScreen.routeName
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).buttonColor.withOpacity(0.5),
              ),
              title: Text(
                "My Orders",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).buttonColor.withOpacity(0.5)
                )
              )
            ),
          ),
          Divider(
            color: Theme.of(context).buttonColor.withOpacity(0.5)
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                UserProfileScreen.routeName,
                arguments: deviceSize
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Theme.of(context).buttonColor.withOpacity(0.5),
              ),
              title: Text(
                "User Profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).buttonColor.withOpacity(0.5)
                )
              )
            ),
          ),
          Divider(
            color: Theme.of(context).buttonColor.withOpacity(0.5)
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).buttonColor.withOpacity(0.5)
            ),
            title: Text(
              "Sign Out",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).buttonColor.withOpacity(0.5)
              )
            )
          )
        ]
      )
    );
  }
}