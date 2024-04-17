import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottomNavigationBarController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;

    if(index == 0){
      Get.offAndToNamed('/');
    }
    else if(index == 1){
      Get.offAndToNamed('/search');
    }
    else if(index == 2){
      Get.offAndToNamed('/order');
    }
    else if(index == 3){
      Get.offAndToNamed('/profile');
    }

  }
}