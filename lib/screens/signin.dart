/* 
Written by: Adarsh Patel
Modified At: 22-04-24
Description: Following file has the design of 
signin page.
*/

import 'package:flutter/material.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/controller/login_controller.dart';
import 'package:fluxstore/controller/theme_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Signin extends StatefulWidget {
  Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  late List<Widget> columnData = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController address = TextEditingController();
  ThemeController themeController = Get.find<ThemeController>();
  TextEditingController pass = TextEditingController();
  @override
  void initState() {
    super.initState();
    initList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(shrinkWrap: true, children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 30,
          child: Padding(
            padding: EdgeInsets.only(
                right: 30,
                left: 30,
                top: MediaQuery.of(context).size.height / 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: columnData,
            ),
          ),
        ),
      ]),
    );
  }

  //Initialize list data with widget to be assigned to column.
  initList() {
    columnData = [
      const Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Text(
          "Log into",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
      const Text(
        "your account",
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
      ),
      const SizedBox(
        height: 15,
      ),
      Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Obx(
                    () => TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter address",
                        hintStyle: TextStyle(
                            color: themeController.isDarkMode.value
                                ? Constants.whiteColor
                                : Constants.blackColor),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Constants.signupInputBorderColor,
                              width: 1),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Constants.signupInputBorderColor,
                              width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Constants.focusedSignupInputBorderColor,
                                width: 2)),
                      ),
                      validator: (value) {
                        if (value == null || value == "") {
                          return "This field is required";
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "Invalid Email Format, Pls Retry";
                        }
                        return null;
                      },
                      controller: address,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Obx(
                    () => TextFormField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: themeController.isDarkMode.value
                                ? Constants.whiteColor
                                : Constants.blackColor),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Constants.signupInputBorderColor,
                              width: 1),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Constants.signupInputBorderColor,
                              width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Constants.focusedSignupInputBorderColor,
                                width: 2)),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value == "") {
                          return "This field is required";
                        }
                        return null;
                      },
                      controller: pass,
                    ),
                  )),
            ],
          )),
      Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          width: double.infinity,
          child: InkWell(
            onTap: () {
              Get.toNamed(AppRoute.forgetPassword);
            },
            child: Obx(() => Text(
                  "Forgot password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: themeController.isDarkMode.value
                          ? Constants.whiteColor
                          : Constants.blackColor,
                      fontWeight: FontWeight.w100),
                )),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                LoginController().canLogin();
                Get.offAndToNamed(AppRoute.homePage);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Constants.buttonBrownColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(
                    Constants.buttonBorderRadius,
                    Constants.buttonBorderRadius)),
                side: BorderSide(color: Constants.buttonBrownColor, width: 2),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                "LOG IN",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Constants.whiteColor,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      ),
      const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Center(
            child: Text(
              "or sign up with",
              style: TextStyle(fontWeight: FontWeight.w100),
            ),
          )),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.apple_rounded),
                  )),
              const SizedBox(
                width: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/google.png'),
                  )),
              const SizedBox(
                width: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/facebook.png'),
                  )),
            ],
          )),
      Expanded(child: Container()),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account?"),
          TextButton(
              onPressed: () {
                Get.offAllNamed(AppRoute.signup);
              },
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              child: Obx(() => Text(
                    "Sign Up",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: themeController.isDarkMode.value
                            ? Constants.whiteColor
                            : Constants.blackColor),
                  ))),
        ],
      ),
      const SizedBox(
        height: 20,
      )
    ];
  }
}
