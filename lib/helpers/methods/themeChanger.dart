import "dart:convert";
import "package:flutter/material.dart";
import "../constants/themeConstant.dart";
import "../constants/applicationConstant.dart";
import "package:shared_preferences/shared_preferences.dart";

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger() {
    _setInitialTheme();
  }

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;

    notifyListeners();
  }

  Future<ThemeData> _setInitialTheme() async {
    final preferences = await SharedPreferences.getInstance();

    if (!preferences.containsKey(ApplicationConstant.sharedTheme)) {
      _themeData = appThemeDataDark;

      final currentThemeInfo = json.encode({
        "themeStyle": ApplicationConstant.darkAppTheme
      });

      preferences.setString(ApplicationConstant.sharedTheme, currentThemeInfo);

      return _themeData;
    }
    else {
      final extractedThemeInfo = json.decode(preferences.getString(ApplicationConstant.sharedTheme)) as Map<String, dynamic>;
      final chosenTheme = extractedThemeInfo["themeStyle"];

      if (chosenTheme == ApplicationConstant.lightAppTheme) {
        _themeData = appThemeDataLight;

        return _themeData;
      }
      else if (chosenTheme == ApplicationConstant.darkAppTheme) {
        _themeData = appThemeDataDark;

        return _themeData;
      }
      else {
        _themeData = appThemeDataDark; //Its better to define a third theme style, something like appThemeDefault, but in order not to spend more time on dummy stuff, I skipp that part --Özgür

        return _themeData;
      }
    }
  }
}