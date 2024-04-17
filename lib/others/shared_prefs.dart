import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _singleton = SharedPrefs._internal();
  static late SharedPreferences sharedPreferences;
  static initializeSharedPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  factory SharedPrefs() {
    return _singleton;
  }

  SharedPrefs._internal();
}