import 'package:get/get.dart';

import '../screens/discover_page.dart';
import '../screens/home_sreen.dart';
import '../screens/order_page.dart';
import '../screens/profile_page.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottomNavigationBarController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;

    if(index == 0){
      Get.to(HomePage(), transition: Transition.fadeIn, routeName: '/homepage');
    }
    else if(index == 1){
      Get.to(DiscoverPage(), transition: Transition.fadeIn, routeName: '/discoverpage');
    }
    else if(index == 2){
      Get.to(OrderPage(), transition: Transition.fadeIn, routeName: '/orderpage');
    }
    else if(index == 3){
      Get.to(ProfilePage(), transition: Transition.fadeIn, routeName: '/profile');
    }

  }
}