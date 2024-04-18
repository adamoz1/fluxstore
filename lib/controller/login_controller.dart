import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluxstore/others/shared_prefs.dart';

class LoginController {
  late SharedPreferences sharedPreferences;

  LoginController() {
    sharedPreferences = SharedPrefs.sharedPreferences;
  }

  bool register(String username, String password) {
    if (password.isNotEmpty && username.isNotEmpty) {
      return true;
    }
    return false;
  }

  Map<String, dynamic> canLogin(String email, String password) {
    Map<String, dynamic> response = {"status": 1, "message": "Done Login"};
    var validate;
    try {
      validate = validateEmail(email);
      SharedPreferences instance = SharedPrefs.sharedPreferences;
      instance.setString("isLogin", "true");
    } catch (e) {
      return response;
    }

    if (!validate) {
      response["status"] = 0;
      response["message"] = "Fill Proper Email";
      return response;
    }

    if (!password.isNotEmpty) {
      response["status"] = 0;
      response["message"] = "Fill Proper Password";
      return response;
    }
    return response;
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
