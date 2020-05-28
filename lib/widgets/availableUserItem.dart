import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/userProvider.dart";

class AvailableUserItem extends StatelessWidget {
  final Size deviceSize;
  final String userId;

  AvailableUserItem(
    this.deviceSize,
    this.userId
  );

  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).getSingleUserById(userId);

    return GestureDetector(
      onTap: () {
        //From here user will go to the chat screen, after chat module is integrated --Özgür
      },
      child: Card(
        child: Container(
          color: Theme.of(context).primaryColorLight,
          child: ListTile(
            leading: Container(
              width: deviceSize.height * 0.08,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: user.avatarPicture,
              )
            ),
            title: Text(
              user.userName,
              style: TextStyle(
                color: Theme.of(context).buttonColor.withOpacity(0.5)
              )
            ),
            trailing: Image.network("http://icons.iconarchive.com/icons/custom-icon-design/flatastic-10/16/Trafficlight-green-icon.png")
          ),
        )
      ),
    );
  }
}