/* 
Written by: Adarsh Patel
Modified At: 22-04-24
Description: Login Controller is used help
with login and registration logic.
*/

import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluxstore/others/shared_prefs.dart';

class LoginController {
  late SharedPreferences sharedPreferences;

  LoginController() {
    sharedPreferences = SharedPrefs.sharedPreferences;
  }

  canLogin() {
    try {
      SharedPreferences instance = SharedPrefs.sharedPreferences;
      instance.setString("isLogin", "true");
    } catch (e) {
      print(e);
    }
  }

  bool validateEmail(String email) {
    if (email.isNotEmpty) {
      return RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    } else {
      return false;
    }
  }
}
