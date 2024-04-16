import 'package:flutter/material.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/screens/signup.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Signin extends StatelessWidget {
  Signin({super.key});

  late List<Widget> columnData = [];
  TextEditingController address = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initList();
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

  initList() {
    columnData = [
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
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: TextField(
          decoration: const InputDecoration(hintText: "Enter address"),
          controller: address,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: TextField(
          decoration: const InputDecoration(hintText: "Password"),
          controller: pass,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // Get.to(Signup());
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Constants.buttonBrownColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(
                        Constants.buttonBorderRadius,
                        Constants.buttonBorderRadius)),
                    side: BorderSide(color: Constants.whiteColor, width: 2))),
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
          const Text("Already have account?"),
          TextButton(
              onPressed: () {
                Get.to(Signup());
              },
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Constants.blackColor),
              )),
        ],
      ),
      const SizedBox(
        height: 20,
      )
    ];
  }
}
