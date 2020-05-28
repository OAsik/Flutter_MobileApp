import "dart:convert";
import "../models/user.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/userProvider.dart";
import "../helpers/constants/applicationConstant.dart";
import "package:shared_preferences/shared_preferences.dart";
import "../helpers/constants/themeConstant.dart" as themeProfile;
import "package:game_shop_demo_app/helpers/methods/themeChanger.dart";

class UserProfileItem extends StatefulWidget {
  final String userId;
  final Size deviceSize;

  UserProfileItem(
    this.userId,
    this.deviceSize
  );
  
  _UserProfileItemState createState() => _UserProfileItemState();
}

class _UserProfileItemState extends State<UserProfileItem> {
  User user;
  bool _initialLaunch = true;
  bool _readOnlyValue = true;
  bool _lightThemeSwitch = false;
  bool _availabilitySwitch = false;
  TextEditingController _userNameController;
  FocusNode _userNameFieldFocus;

  Future<void> didChangeDependencies() async {
    if(_initialLaunch) {
      user = Provider.of<UserProvider>(context, listen: false).getSingleUserById(widget.userId);

      _userNameController = TextEditingController(
        text: user.userName
      );

      _userNameFieldFocus = FocusNode();

      final preferences = await SharedPreferences.getInstance();
      final extractedThemeInfo = json.decode(preferences.getString(ApplicationConstant.sharedTheme)) as Map<String, dynamic>;

      if (extractedThemeInfo["themeStyle"] == ApplicationConstant.lightAppTheme) {
        setState(() {
          _lightThemeSwitch = true;
        });
      }
      else if (extractedThemeInfo["themeStyle"] == ApplicationConstant.darkAppTheme) {
        setState(() {
          _lightThemeSwitch = false;
        });
      }

      if (user.isLookingForParty) {
        setState(() {
          _availabilitySwitch = true;
        });
      }
      else {
        setState(() {
          _availabilitySwitch = false;
        });
      }
    }

    _initialLaunch = false;

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context, listen: false);

    Future<void> _changeThemePreference(bool lightThemeSelection) async {
      final preferences = await SharedPreferences.getInstance();

      if (lightThemeSelection) {
        final currentThemeInfo = json.encode({
          "themeStyle": ApplicationConstant.lightAppTheme
        });

        preferences.setString(ApplicationConstant.sharedTheme, currentThemeInfo);

        setState(() {
          _lightThemeSwitch = !_lightThemeSwitch;
        });
      }
      else {
        final currentThemeInfo = json.encode({
          "themeStyle": ApplicationConstant.darkAppTheme
        });

        preferences.setString(ApplicationConstant.sharedTheme, currentThemeInfo);

        setState(() {
          _lightThemeSwitch = !_lightThemeSwitch;
        });
      }
    }

    void _changeUserAvailability(bool availabilitySelection) {
      user.isLookingForParty = availabilitySelection;

      Provider.of<UserProvider>(context, listen: false).updateUser(user.id, user);

      setState(() {
        _availabilitySwitch = !_availabilitySwitch;
      });
    }

    return Container(
      color: Theme.of(context).primaryColor,
      height: widget.deviceSize.height * 0.91,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: widget.deviceSize.height * 0.05
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 3,
                  color: Theme.of(context).primaryColorLight
                )
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: user.avatarPicture != null ?
                    /*Image.asset(
                      "assets/images/dummyUserAvatar.png", //Cannot read directly from a File. Will be checked later --Özgür
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200
                    )*/
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: user.avatarPicture,
                    ) :
                    Image.asset(
                      "assets/images/placeholderAvatar.png",
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200
                    )
                  ),
                  Positioned(
                    bottom: 2,
                    right: 6,
                    child: FloatingActionButton(
                      child: Icon(
                        Icons.camera_alt,
                        color: Theme.of(context).buttonColor.withOpacity(0.5)
                      ),
                      elevation: 0,
                      backgroundColor: Theme.of(context).primaryColorLight,
                      onPressed: () {
                        //Uploading image file both from gallery and camera will be implemented on here --Özgür
                      }
                    )
                  )
                ]
              )
            ),
            SizedBox(
              height: widget.deviceSize.height * 0.04,
            ),
            SizedBox(
              width: widget.deviceSize.width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(
                      "Username:",
                      style: TextStyle(
                        color: Theme.of(context).buttonColor.withOpacity(0.5)
                      )
                    ),
                    SizedBox(
                      height: 10,
                      width: 67,
                      child: Divider(
                        color: Theme.of(context).buttonColor.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: widget.deviceSize.width * 0.3,
                      child: TextFormField(
                        focusNode: _userNameFieldFocus,
                        readOnly: _readOnlyValue,
                        textAlign: TextAlign.start,
                        controller: _userNameController,
                        style: TextStyle(
                          color: Theme.of(context).buttonColor.withOpacity(0.5)
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                        onFieldSubmitted: (value) {
                          setState(() {
                            _readOnlyValue = true;
                          });
                        }
                      )
                    )]
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: widget.deviceSize.height * 0.044,
                      right: 18
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _readOnlyValue = false;
                        });

                        return _userNameFieldFocus.requestFocus();
                      },
                      child: Icon(
                        Icons.edit,
                        size: 14,
                        color: Theme.of(context).buttonColor.withOpacity(0.5)
                      )
                    )
                  )
                ]
              )
            ),
            SizedBox(
              height: widget.deviceSize.height * 0.04,
            ),
            SizedBox(
              width: widget.deviceSize.width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Light Theme",
                    style: TextStyle(
                      color: Theme.of(context).buttonColor.withOpacity(0.5)
                    )
                  ),
                  Switch(
                    value: _lightThemeSwitch,
                    onChanged: (bool lightThemeSelection) {                      
                      if (lightThemeSelection) {
                        _changeThemePreference(lightThemeSelection);

                        theme.setTheme(themeProfile.appThemeDataLight);
                      }
                      else {
                        _changeThemePreference(lightThemeSelection);

                        theme.setTheme(themeProfile.appThemeDataDark);
                      }
                    },
                    activeColor: Theme.of(context).buttonColor,
                    inactiveThumbColor: Theme.of(context).buttonColor.withOpacity(0.5),
                  )
                ]
              )
            ),
            SizedBox(
              height: widget.deviceSize.height * 0.01,
            ),
            SizedBox(
              width: widget.deviceSize.width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Looking for Party",
                    style: TextStyle(
                      color: Theme.of(context).buttonColor.withOpacity(0.5)
                    )
                  ),
                  Switch(
                    value: _availabilitySwitch,
                    onChanged: (bool availabilitySelection) {
                      _changeUserAvailability(availabilitySelection);
                    },
                    activeColor: Theme.of(context).buttonColor,
                    inactiveThumbColor: Theme.of(context).buttonColor.withOpacity(0.5),
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}