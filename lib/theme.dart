import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
  fontFamily: "ProductSans"
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
    fontFamily: "ProductSans",
);