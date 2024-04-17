import 'package:flutter/material.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/controller/theme_controller.dart';
import 'package:fluxstore/screens/splash_screen1.dart';
import 'package:fluxstore/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: "/homepage",
      getPages: appRoutes(),
      themeMode: ThemeController().isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
