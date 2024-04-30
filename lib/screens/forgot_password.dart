/* 
Written by: Adarsh Patel
Modified At: 22-04-24
Description: Following file has the design of 
forget password page.
*/

import 'package:flutter/material.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/controller/theme_controller.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late List<Widget> columnData = [];
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ThemeController themeController = Get.find<ThemeController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columnData,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void initList() {
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
          "Forget Password?",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Text(
          "Enter email associated with you account and we'll send and email with instructions to reset your password",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 12,
      ),
      Form(
          key: _formKey,
          child: Obx(
            () => TextFormField(
              controller: email,
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "enter your email here",
                  hintStyle: TextStyle(
                      color: themeController.isDarkMode.value
                          ? Constants.whiteColor
                          : Constants.blackColor,
                      fontWeight: FontWeight.w100),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Constants.signupInputBorderColor, width: 1),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Constants.signupInputBorderColor, width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Constants.focusedSignupInputBorderColor,
                          width: 1)),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xffBFBFBF),
                    size: 16,
                  )),
            ),
          )),
      Expanded(child: Container()),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Get.toNamed(AppRoute.verification);
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: themeController.isDarkMode.value
                    ? Constants.whiteColor
                    : Constants.buttonBrownColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(
                        Constants.buttonBorderRadius,
                        Constants.buttonBorderRadius)),
                    side: BorderSide(
                        color: themeController.isDarkMode.value
                            ? Constants.whiteColor
                            : Constants.buttonBrownColor,
                        width: 2))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                "Send Email",
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
}
