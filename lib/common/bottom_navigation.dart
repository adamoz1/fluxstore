import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:fluxstore/controller/theme_controller.dart';
=======
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
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
<<<<<<< HEAD
      Get.put(BottomNavigationBarController());

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    var themes = themeController.isDarkMode;
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white, // Set background color
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), // Adjust radius to your preference
          topRight: Radius.circular(20), // Adjust radius to your preference
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), // Adjust radius to your preference
          topRight: Radius.circular(20), // Adjust radius to your preference
        ),
        child: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changePage(index);
          },
          selectedItemColor: getThemeColor(themes.value, true),
          unselectedItemColor: getThemeColor(themes.value, false),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation:
              0.0, // Set elevation to 0 as it's already provided by BoxDecoration
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 30),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined, size: 30),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined, size: 30),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Color getThemeColor(bool isDarkMode, bool isSelected) {
    return isSelected
        ? (isDarkMode ? Colors.white : Colors.black)
        : (isDarkMode
            ? Colors.white.withOpacity(0.6)
            : Colors.black.withOpacity(0.6));
  }
}
=======
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
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
