import 'package:flutter/material.dart';
import 'package:fluxstore/controller/theme_controller.dart';
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
