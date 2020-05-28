import "dart:async";
import "dart:convert";
import "../models/appException.dart";
import "package:flutter/foundation.dart";
import "../helpers/constants/dummyValue.dart";
import "../helpers/constants/errorMessage.dart";
import "../helpers/constants/applicationConstant.dart";
import "package:shared_preferences/shared_preferences.dart";

class AuthenticateProvider with ChangeNotifier {
  String _userId;
  String _userToken;
  DateTime _expiryDate;
  Timer _expiryTimer;

  bool get isLogedin {
    return _userToken != null;
  }

  String get userId {
    return _userId;
  }

  void _autoLogout() {
    if (_expiryTimer != null) {
      _expiryTimer.cancel();
    }

    final expiryTime = _expiryDate.difference(DateTime.now()).inMinutes;

    Timer(
      Duration(
        minutes: expiryTime
      ),
      logout
    );
  }

  Future<void> _authenticate(String userId, String password) async {
    //Authentication URL will be provided here after an API established --Özgür

    try
    {
      //Here, send a HTTP Post request if an API is presented. In the time, below dummy approach is used
      //Similar dummy approaches, which are reading dummy data defined on seperate provider classes, are used through the app. I will not state this warning again seperately on every dummy CRUD --Özgür
      
      String dummyToken = DummyValue.userToken;
      String dummyUserId = userId;
      DateTime dummyExpiryDate = DateTime.now().add(
        Duration(
          minutes: ApplicationConstant.tokenExpiryTimeInMinutes
        )
      );

      _userId = dummyUserId;
      _userToken = dummyToken;
      _expiryDate = dummyExpiryDate;

      _autoLogout();

      notifyListeners();

      final preference = await SharedPreferences.getInstance();

      final currentUserInfo = json.encode({
        "token": _userToken,
        "userId": _userId,
        "expiryDate": _expiryDate.toIso8601String()
      });

      preference.setString(ApplicationConstant.sharedPreferenceKey, currentUserInfo);
    }
    on AppException catch(error) {
      throw error;
    }
    catch(error)
    {
      throw AppException(ErrorMessages.unknownError);
    }
  }

  Future<void> login(String userName, String password) {
    return _authenticate(userName, password);
  }

  Future<bool> autoLogin() async {
    final preference = await SharedPreferences.getInstance();

    if (!preference.containsKey(ApplicationConstant.sharedPreferenceKey)) {
      return false;
    }

    final extractedUserInfo = json.decode(preference.getString(ApplicationConstant.sharedPreferenceKey)) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserInfo["expiryDate"]);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }

    _userToken = extractedUserInfo["token"];
    _userId = extractedUserInfo["userId"];
    _expiryDate = expiryDate;

    notifyListeners();

    _autoLogout();

    return true;
  }

  Future<void> logout() async {
    _userId = null;
    _userToken = null;
    _expiryDate = null;

    if (_expiryTimer != null) {
      _expiryTimer.cancel();

      _expiryTimer = null;
    }

    notifyListeners();

    final preference = await SharedPreferences.getInstance();

    preference.clear();
  }
}