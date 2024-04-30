/* 
Written by: Adarsh Patel
Modified At: 22-04-24
Description: Shared Preference Single-ton class.
*/

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _singleton = SharedPrefs._internal();
  static late SharedPreferences sharedPreferences;
  static initializeSharedPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getThemeStatus();
  }

  factory SharedPrefs() {
    return _singleton;
  }

  SharedPrefs._internal();

  static getThemeStatus() {
    var darkMode = false;
    try {
      darkMode = sharedPreferences.getBool("isDarkMode") ?? false;
    } catch (e) {
      sharedPreferences.setBool("isDarkMode", false);
      darkMode = false;
    }
    return darkMode;
  }
}
