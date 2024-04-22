import 'package:flutter/material.dart';
import 'package:fluxstore/controller/theme_controller.dart';
import 'package:get/get.dart';

class CommonDrawer extends StatefulWidget {
  const CommonDrawer({super.key});

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              padding: EdgeInsets.only(
                  top: 40, left: 15.0, bottom: 20.0, right: 0.0),
              child: ListTile(
                leading: CircleAvatar(
                    foregroundImage: AssetImage('assets/profile.png')),
                title: Text('Sunie Pham'),
                subtitle: Text('sunieux@gmail.com'),
              )),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: const Icon(
                Icons.home_outlined,
                size: 25,
              ),
              title: const Text(
                'Homepage',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Get.offAndToNamed('/homepage');
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: const Icon(
                Icons.search,
                size: 25,
              ),
              title: const Text(
                'Discover',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Get.offAndToNamed('/discoverpage');
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: const Icon(
                Icons.shopping_bag_outlined,
                size: 25,
              ),
              title: const Text(
                'My Order',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Get.offAndToNamed('/orderpage');
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: const Icon(
                Icons.person_outline_outlined,
                size: 25,
              ),
              title: const Text(
                'My Profile',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Get.offAndToNamed('/profile');
              },
            ),
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
              ),
              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 10.0, 20.0),
              child: const Text(
                'OTHER',
                style: TextStyle(fontSize: 20),
              )),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                size: 25,
              ),
              title: const Text(
                'Setting',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Get.offAndToNamed('/setting');
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: const Icon(
                Icons.mail_outline_outlined,
                size: 25,
              ),
              title: const Text(
                'Support',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: const Icon(
                Icons.info_outline,
                size: 25,
              ),
              title: const Text(
                'About us',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            height: 80, // Adjust height as needed
            width: 60, // Adjust width as needed
            child: ElevatedButton.icon(
              onPressed: () {
                themeController.toggleTheme();
                setState(() {});
              },
              label: Text('Theme',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white)),
              style: ElevatedButton.styleFrom(
                  // foregroundColor: getThemeColor(Get.isDarkMode),
                  // backgroundColor: getThemeColor(!Get.isDarkMode),
                  // Inverted for background
                  backgroundColor:
                      Get.isDarkMode ? Colors.white : Colors.black),
              icon: Icon(Icons.sunny,
                  color: Get.isDarkMode ? Colors.black : Colors.white),
            ),
          ),
        ],
      ),
    );
  }
  // Color getThemeColor(bool isDarkMode) {
  //   return isDarkMode ? Colors.black : Colors.white;
  // }
}
