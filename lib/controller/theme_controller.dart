import 'package:fluxstore/others/shared_prefs.dart';
import 'package:fluxstore/theme.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = RxBool(
      SharedPrefs.getThemeStatus()); // Reactive variable to store theme mode

  void toggleTheme() {
    isDarkMode.value = isDarkMode.value ? false : true;
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
    SharedPrefs.sharedPreferences.setBool("isDarkMode", isDarkMode.value);
  }
}
