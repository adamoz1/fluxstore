import 'package:flutter/material.dart';
import 'package:fluxstore/screens/splash_screen1.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "ProductSans"),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => const SplashScreen1())],
      darkTheme: ThemeData.dark(useMaterial3: false),
      debugShowCheckedModeBanner: false,
    );
  }
}
