import "../widgets/appDrawer.dart";
import "../screens/homeScreen.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/userProvider.dart";
import "../widgets/availableUserItem.dart";

class AvailableUserScreen extends StatelessWidget {
  static const routeName = "/available-users";
  final String userId;

  AvailableUserScreen(
    this.userId
  );

  Future<void> _refreshAvailableUsers(BuildContext context) async {
    await Provider.of<UserProvider>(context, listen: false).getAvailableUsers(userId);
  }

  //As I'm modifying dummy user account list here, app drawer is throwing an error after going back to home screen. This will not be an issue in a real app as available user information and current user information will be retrieved seperately from different API end-points --Özgür

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
          }
        ),
        title: Text("Your Profile")
      ),
      endDrawer: AppDrawer(
        userId,
        deviceSize
      ),
      body: FutureBuilder(
        future: _refreshAvailableUsers(context),
        builder: (_, snapshot) => snapshot.connectionState == ConnectionState.waiting ?
        Center(
          child: CircularProgressIndicator(),
        ) :
        RefreshIndicator(
          child: Consumer<UserProvider>(
            builder: (ctx, userData, _) => Container(
              color: Theme.of(ctx).primaryColor,
              child: ListView.builder(
                itemCount: userData.allUsers.length,
                itemBuilder: (ctx, index) => Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      AvailableUserItem(
                        deviceSize,
                        userData.allUsers[index].id
                      )
                    ]
                  )
                )
              )
            )
          ),
          onRefresh: () => _refreshAvailableUsers(context)
        )
      )
    );
  }
}