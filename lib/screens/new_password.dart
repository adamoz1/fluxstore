import 'package:flutter/material.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/others/shared_prefs.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NewPassword extends StatefulWidget {
  NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  late List<Widget> columnData = [];

  TextEditingController pass = TextEditingController();
  TextEditingController confipass = TextEditingController();

  bool tf1Visible = false;
  bool tf2Visible = false;

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
          Get.back();
        },
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Constants.whiteColor,
          child: SizedBox(
            height: 40,
            width: 40,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Constants.backIconColor,
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
          "Create new password",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Text(
          "Your new password must be different from previously used password",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: TextField(
            obscureText: !tf1Visible,
            controller: pass,
            decoration: InputDecoration(
                hintText: "New Password",
                suffixIcon: IconButton(
                    onPressed: () {
                      tf1Visible = !tf1Visible;
                      setState(() {});
                    },
                    icon: Icon(!tf1Visible
                        ? Icons.visibility
                        : Icons.visibility_off)))),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: TextField(
            obscureText: !tf2Visible,
            controller: confipass,
            decoration: InputDecoration(
                hintText: "Confirm Password",
                suffixIcon: IconButton(
                    onPressed: () {
                      tf2Visible = !tf2Visible;
                      setState(() {});
                    },
                    icon: Icon(!tf2Visible
                        ? Icons.visibility
                        : Icons.visibility_off)))),
      ),
      Expanded(child: Container()),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              if (pass.text.isNotEmpty &&
                  confipass.text.isNotEmpty &&
                  pass.text == confipass.text) {
                showBottomSheet();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Password and confirm password must be same!!")));
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Constants.blackColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(
                      Constants.buttonBorderRadius,
                      Constants.buttonBorderRadius)),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                "Confirm",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Constants.whiteColor,
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

  showBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Constants.cardBackgroundColor,
                    ),
                    child: const Image(image: AssetImage("assets/success.png")),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "Your password has been changed",
                      style:
                      TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "Welcome back! Discover Now!",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          SharedPrefs.sharedPreferences.setString("isLogin", "true");
                          Get.toNamed(AppRoute.homePage);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Constants.blackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.elliptical(
                                  Constants.buttonBorderRadius,
                                  Constants.buttonBorderRadius)),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          child: Text(
                            "Browser Home",
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
              ),
            ),
          );
        });
  }
}