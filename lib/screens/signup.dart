/* 
Written by: Adarsh Patel
Modified At: 22-04-24
Description: Following file has the design of 
signup page.
*/

import 'package:flutter/material.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/controller/login_controller.dart';
import 'package:fluxstore/controller/theme_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late List<Widget> columnData = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ThemeController themeController = Get.find<ThemeController>();
  @override
  void initState() {
    super.initState();
    initList();
  }

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(shrinkWrap: true, children: [
        Container(
          height: MediaQuery.of(context).size.height - 30,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 30,
              left: 30,
            ),
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
      Expanded(child: Container()),
      const Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Text(
          "Create",
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
              textFieldControl("Enter your name", name, (value) {
                if (value == null || value == "") {
                  return "This field is required";
                }
                return null;
              }, false),
              textFieldControl("Enter address", address, (value) {
                if (value == null || value == "") {
                  return "This field is required";
                }
                if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return "Invalid Email Format, Pls Retry";
                }
                return null;
              }, false),
              textFieldControl("password", password, (value) {
                if (value == null || value == "") {
                  return "This field is required";
                }
                return null;
              }, true),
              textFieldControl("Confirm password", confirmPassword, (value) {
                if (value == null || value == "") {
                  return "This field is required";
                }
                if (password.value.text != confirmPassword.value.text) {
                  return "Password and Confirm Password are not same!";
                }
                return null;
              }, true),
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
                            side: BorderSide(
                                color: Constants.buttonBrownColor, width: 2))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Constants.whiteColor,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
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
          const Text("Already have account?"),
          TextButton(
              onPressed: () {
                Get.toNamed(AppRoute.signin);
              },
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              child: Text(
                "Log In",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: themeController.isDarkMode.value
                        ? Constants.whiteColor
                        : Constants.blackColor),
              )),
        ],
      ),
      const SizedBox(
        height: 20,
      )
    ];
  }

  // This method return custom textfield setting hints and controller.
  textFieldControl(hintWords, controller, validatorFunction, obsecureField) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        obscureText: obsecureField,
        decoration: InputDecoration(
          hintText: hintWords,
          hintStyle: TextStyle(
              color: themeController.isDarkMode.value
                  ? Constants.whiteColor
                  : Constants.blackColor),
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Constants.signupInputBorderColor, width: 1),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Constants.signupInputBorderColor, width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Constants.focusedSignupInputBorderColor, width: 2)),
        ),
        controller: controller,
        validator: validatorFunction,
      ),
    );
  }
}
