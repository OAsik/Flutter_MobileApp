import "../widgets/appDrawer.dart";
import "../screens/homeScreen.dart";
import "package:flutter/material.dart";
import "../widgets/userProfileItem.dart";

class UserProfileScreen extends StatelessWidget {
  static const String routeName = "/userProfile";
  final String userId;

  UserProfileScreen(
    this.userId
  );

  Widget build(BuildContext context) {
    final deviceSize = ModalRoute.of(context).settings.arguments as Size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
        title: Text("Your Profile")
      ),
      endDrawer: AppDrawer(
        userId,
        deviceSize
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(
            FocusNode()
          );
        },
        child: SingleChildScrollView(
          child: UserProfileItem(
            userId,
            deviceSize
          )
        )
      )
    );
  }
}