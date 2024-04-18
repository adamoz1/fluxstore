import 'package:flutter/material.dart';
import 'package:fluxstore/constants.dart';
import 'package:get/get.dart';

import '../Routes/app_routes.dart';

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
                  tf4.text.isNotEmpty) {
                Get.toNamed(AppRoute.newPassword);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Enter valid Otp")));
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Constants.blackColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(
                        Constants.buttonBorderRadius,
                        Constants.buttonBorderRadius)),
                    side: BorderSide(color: Constants.whiteColor, width: 2))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                "Verify Otp",
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

  verificationOtp(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 60,
          height: 60,
          child: TextField(
            controller: tf1,
            focusNode: focusNode1,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 16),
              focusColor: Constants.blackColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width: 0, color: Constants.blackColor),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Constants.blackColor,
                  )),
              filled: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: Constants.whiteColor,
            ),
            onChanged: (String value) {
              // var value = tf1.text;
              if (value.length == 1) {
                focusNode1.unfocus();
                FocusScope.of(context).requestFocus(focusNode2);
              } else if (value.length > 1) {
                tf1.text = value[0];
              }
            },
          ),
        ),
        Container(
          width: 60,
          height: 60,
          child: TextField(
            controller: tf2,
            focusNode: focusNode2,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 16),
              focusColor: Constants.blackColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width: 0, color: Constants.blackColor),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Constants.blackColor,
                  )),
              filled: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: Constants.whiteColor,
            ),
            onChanged: (String value) {
              if (value.length == 1) {
                focusNode2.unfocus();
                FocusScope.of(context).requestFocus(focusNode3);
              } else if (value.length > 1) {
                tf2.text = value[0];
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
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 16),
              focusColor: Constants.blackColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width: 0, color: Constants.blackColor),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Constants.blackColor,
                  )),
              filled: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: Constants.whiteColor,
            ),
            onChanged: (String value) {
              if (value.length == 1) {
                focusNode3.unfocus();
                FocusScope.of(context).requestFocus(focusNode4);
              } else if (value.length > 1) {
                tf3.text = value[0];
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
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 16),
              focusColor: Constants.blackColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width: 0, color: Constants.blackColor),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Constants.blackColor,
                  )),
              filled: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: Constants.whiteColor,
            ),
            onChanged: (String value) {
              if (value.length == 1) {
                focusNode4.unfocus();
                // FocusScope.of(context).requestFocus(focusNode2);
              } else if (value.length > 1) {
                tf4.text = value[0];
              }
            },
          ),
        ),
      ],
    );
  }
}
