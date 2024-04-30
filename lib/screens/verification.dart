/* 
Written by: Adarsh Patel
Modified At: 22-04-24
Description: Following file has the design of 
otp verification after forget-password.
*/

import 'package:flutter/material.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/controller/theme_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Verification extends StatelessWidget {
  Verification({super.key});
  late List<Widget> columnData = [];
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  TextEditingController tf1 = TextEditingController();
  TextEditingController tf2 = TextEditingController();
  TextEditingController tf3 = TextEditingController();
  TextEditingController tf4 = TextEditingController();
  ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    initList(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columnData,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void initList(context) {
    columnData = [
      const SizedBox(
        height: 10,
      ),
      InkWell(
        onTap: () {
          Get.back();
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: themeController.isDarkMode.value
              ? Constants.blackColor
              : Constants.whiteColor,
          child: SizedBox(
            height: 40,
            width: 40,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: themeController.isDarkMode.value
                  ? Constants.whiteColor
                  : Constants.blackColor,
              size: 15,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: Text(
          "Verfication Code",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Text(
          "Please enter the verification code we sent to your email address",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
        ),
      ),
      verificationOtp(context),
      Expanded(child: Container()),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              if (tf1.text.isNotEmpty &&
                  tf2.text.isNotEmpty &&
                  tf3.text.isNotEmpty &&
                  tf4.text.isNotEmpty &&
                  tf1.text.isNum &&
                  tf2.text.isNum &&
                  tf3.text.isNum &&
                  tf4.text.isNum) {
                Get.toNamed(AppRoute.newPassword);
              } else {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Enter valid Otp"),
                  duration: Duration(milliseconds: 800),
                ));
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: themeController.isDarkMode.value
                    ? Constants.whiteColor
                    : Constants.blackColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(
                        Constants.buttonBorderRadius,
                        Constants.buttonBorderRadius)),
                    side: BorderSide(color: Constants.blackColor, width: 2))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                "Verify Otp",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: themeController.isDarkMode.value
                        ? Constants.blackColor
                        : Constants.whiteColor,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      )
    ];
  }

  verificationOtp(context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 60,
            height: 60,
            child: TextField(
              controller: tf1,
              focusNode: focusNode1,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontSize: 16),
                focusColor: Constants.blackColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      width: 0,
                      color: themeController.isDarkMode.value
                          ? Constants.whiteColor
                          : Constants.blackColor),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: themeController.isDarkMode.value
                          ? Constants.whiteColor
                          : Constants.blackColor,
                    )),
                filled: true,
                contentPadding: const EdgeInsets.all(16),
                fillColor: themeController.isDarkMode.value
                    ? Constants.blackColor
                    : Constants.whiteColor,
              ),
              onChanged: (String value) {
                print("Onchange is called --$value--");
                // var value = tf1.text;
                if (value.length == 1) {
                  if (tf1.text.length == 1) {
                    tf2.text = value;
                    FocusScope.of(context).requestFocus(focusNode2);
                  } else {
                    tf1.text = value;
                  }
                  focusNode1.unfocus();
                } else if (value == "") {
                  tf1.clear();
                  FocusScope.of(context).requestFocus(focusNode1);
                }
                print(value);
              },
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: TextField(
              controller: tf2,
              focusNode: focusNode2,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontSize: 16),
                focusColor: Constants.blackColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      width: 0,
                      color: themeController.isDarkMode.value
                          ? Constants.whiteColor
                          : Constants.blackColor),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: themeController.isDarkMode.value
                          ? Constants.whiteColor
                          : Constants.blackColor,
                    )),
                filled: true,
                contentPadding: const EdgeInsets.all(16),
                fillColor: themeController.isDarkMode.value
                    ? Constants.blackColor
                    : Constants.whiteColor,
              ),
              onChanged: (String value) {
                if (value.length == 1) {
                  if (tf2.text.length == 1) {
                    tf3.text = value;
                    FocusScope.of(context).requestFocus(focusNode3);
                  } else {
                    tf2.text = value;
                  }
                  focusNode1.unfocus();
                } else if (value == "") {
                  tf2.clear();
                  FocusScope.of(context).requestFocus(focusNode1);
                }
              },
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: TextField(
              controller: tf3,
              focusNode: focusNode3,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontSize: 16),
                focusColor: Constants.blackColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      width: 0,
                      color: themeController.isDarkMode.value
                          ? Constants.whiteColor
                          : Constants.blackColor),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: themeController.isDarkMode.value
                          ? Constants.whiteColor
                          : Constants.blackColor,
                    )),
                filled: true,
                contentPadding: const EdgeInsets.all(16),
                fillColor: themeController.isDarkMode.value
                    ? Constants.blackColor
                    : Constants.whiteColor,
              ),
              onChanged: (String value) {
                if (value.length == 1) {
                  focusNode3.unfocus();
                  FocusScope.of(context).requestFocus(focusNode4);
                } else if (value.length > 1) {
                  FocusScope.of(context).requestFocus(focusNode4);
                  tf4.text = value[1];
                } else if (value == "") {
                  focusNode3.unfocus();
                  FocusScope.of(context).requestFocus(focusNode2);
                }
              },
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: TextField(
              controller: tf4,
              focusNode: focusNode4,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontSize: 16),
                focusColor: Constants.blackColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      width: 0,
                      color: themeController.isDarkMode.value
                          ? Constants.whiteColor
                          : Constants.blackColor),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: themeController.isDarkMode.value
                          ? Constants.whiteColor
                          : Constants.blackColor,
                    )),
                filled: true,
                contentPadding: const EdgeInsets.all(16),
                fillColor: themeController.isDarkMode.value
                    ? Constants.blackColor
                    : Constants.whiteColor,
              ),
              onChanged: (String value) {
                if (value.length == 1) {
                  focusNode4.unfocus();
                  // FocusScope.of(context).requestFocus(focusNode2);
                } else if (value.length > 1) {
                  tf4.text = value[1];
                } else if (value == "") {
                  focusNode4.unfocus();
                  FocusScope.of(context).requestFocus(focusNode3);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
