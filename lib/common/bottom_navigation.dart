import 'package:flutter/material.dart';
import 'package:fluxstore/screens/home_sreen.dart';
import 'package:get/get.dart';

import '../controller/bottomnavigation_coontroller.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final BottomNavigationBarController controller =
  Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.changePage(index);
      },
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black26,
      type: BottomNavigationBarType.fixed, // Set type to fixed
      showSelectedLabels: false, // Hide labels
      showUnselectedLabels: false,
      elevation: 8.0, // Add some elevation for a subtle shadow effect

      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, color: Get.isDarkMode ? Colors.white : Colors.black,size: 30,),
          label: ''
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Get.isDarkMode ? Colors.white : Colors.black,size: 30,),
            label: ''
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined, color: Get.isDarkMode ? Colors.white : Colors.black,size: 30,),
            label: ''
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_outlined, color: Get.isDarkMode ? Colors.white : Colors.black,size: 30,),
            label: ''
        ),
      ],
    ));
  }
}