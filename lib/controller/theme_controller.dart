import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../theme.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs; // Reactive variable to store theme mode

  void toggleTheme() {
    isDarkMode.value = isDarkMode.value ? false : true;
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }
}