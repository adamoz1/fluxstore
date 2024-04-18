import 'package:flutter/material.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/controller/theme_controller.dart';
import 'package:fluxstore/theme.dart';
import 'package:get/get.dart';

import 'others/shared_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.initializeSharedPrefs();
  runApp(const MainApp());
}

class ProductController {}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: _checkIsLogin(),
      getPages: AppRoute.appRoute,
      themeMode:
          ThemeController().isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }

  _checkIsLogin() {
    try {
      if (SharedPrefs.sharedPreferences.getString("isLogin") == "true") {
        return AppRoute.homePage;
      } else {
        if (SharedPrefs.sharedPreferences.getString("seenLandingPage") !=
            "true") {
          return AppRoute.splashScreen1;
        }
        return AppRoute.signin;
      }
    } catch (e) {
      return AppRoute.splashScreen1;
    }
  }
}
