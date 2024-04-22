import 'package:fluxstore/theme.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs; // Reactive variable to store theme mode

  void toggleTheme() {
    isDarkMode.value = isDarkMode.value ? false : true;
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }
}
