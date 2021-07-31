import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

//enum HomeBio { name, _id }

class UserData with ChangeNotifier {
  String _id = '';
  String _userName = '';
  bool _isSignedIn = false;

  bool _isPrefName = true;

  bool get isSignedIn {
    return _isSignedIn;
  }

  String get getUserName {
    return _userName;
  }

  String get getId {
    return _id;
  }

  bool get getPrefStatus {
    return _isPrefName;
  }

  void setHomeBioPref(bool value) {
    _isPrefName = value;
  }

  Future<void> setNameAndId() async {
    var prefs = await SharedPreferences.getInstance();
    _id = prefs.getString('ID') ?? '';
    _userName = prefs.getString('name') ?? '';
    _isSignedIn = prefs.getBool('isLoggedIn') ?? false;
    notifyListeners();
  }

  Future<void> signUp(String id, String userName) async {
    var prefs = await SharedPreferences.getInstance();
    _id = id;
    _userName = userName;
    _isSignedIn = true;

    prefs.setString('ID', id);
    prefs.setString('name', userName);
    prefs.setBool('isLoggedIn', true);
    notifyListeners();
  }
  Future<bool> tryAutoLogin() async {
    var prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('isLoggedIn')) {
      return false;
    }
    _isSignedIn = prefs.getBool('isLoggedIn') ?? false;
    notifyListeners();
    return _isSignedIn;
  }
}


 