import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black)),
  fontFamily: "ProductSans",
  iconTheme: const IconThemeData(color: Colors.black),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.black, // Icon color for light theme
    unselectedItemColor:
        Colors.black26, // Unselected icon color for light theme
  ),
);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
    fontFamily: "ProductSans",
    iconTheme: const IconThemeData(color: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.white, // Icon color for dark theme
    unselectedItemColor: Colors.white54,
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),// Unselected icon color for dark theme
    ),
);
