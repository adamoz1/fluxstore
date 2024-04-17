import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluxstore/others/shared_prefs.dart';
class LoginController{
  late SharedPreferences sharedPreferences;

  LoginController() {
    sharedPreferences = SharedPrefs.sharedPreferences;
  }

  bool regiester(String username, String email, String password) {
    bool validate = false;
    try{
      validate = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    }catch(e){
      return false;
    }

    if(validate && password.isNotEmpty && username.isNotEmpty){
      return true;
    }
    return false;
  }

  bool canLogin(String email, String password) {
    bool validate = false;
    try{
      validate = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      SharedPreferences instance = SharedPrefs.sharedPreferences;
      instance.setString("isLogin", "true");
    }catch(e){
      return false;
    }

    if(validate && password.isNotEmpty){
      return true;
    }
    return false;
  }
}
