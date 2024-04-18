import 'package:flutter/material.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/controller/login_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late List<Widget> columnData = [];

  @override
  void initState() {
    super.initState();
    initList();
  }

  TextEditingController name = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController pass = TextEditingController();

  TextEditingController confipass = TextEditingController();

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
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: TextField(
          decoration: const InputDecoration(hintText: "Enter you name"),
          controller: name,
        ),
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
        child: TextField(
          decoration: const InputDecoration(hintText: "Confirm Password"),
          controller: confipass,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              if (pass.text == confipass.text) {
                LoginController controller = LoginController();
                if (controller.register(name.text, pass.text) &&
                    address.text.isNotEmpty) {
                  Get.offAllNamed(AppRoute.signin);
                } else {
                  if (LoginController().validateEmail(address.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Fill Proper Email Address")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Fill Every Field Information")));
                  }
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
                    content: Text(
                        "Password and Confirm Password are not same!!!"))));
              }
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
                    icon: Icon(Icons.apple_rounded),
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
                "Login In",
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
