import 'package:fluxstore/Routes/app_routes.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    if (index == 0) {
      Get.toNamed(AppRoute.homePage);
    } else if (index == 1) {
      Get.toNamed(AppRoute.discoverPage);
    } else if (index == 2) {
      Get.toNamed(AppRoute.orderPage);
    } else if (index == 3) {
      Get.toNamed(AppRoute.profilePage);
    }
  }
}
