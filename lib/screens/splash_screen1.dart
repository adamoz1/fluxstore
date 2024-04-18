import 'package:flutter/material.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/constants.dart';
import 'package:get/get.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/splash_image1.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.50),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.7,
              ),
              Center(
                  child: Text(
                "Welcome to GemStore!",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27,
                    color: Constants.whiteColor),
              )),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "A home for a fashionita",
                style: TextStyle(fontSize: 18, color: Constants.whiteColor),
              )),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.splashScreen2);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Constants.whiteColor.withOpacity(0.90).withAlpha(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.elliptical(
                              Constants.buttonBorderRadius,
                              Constants.buttonBorderRadius)),
                          side: BorderSide(
                              color: Constants.whiteColor, width: 2))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: Text(
                      "Get Started",
                      style: TextStyle(color: Constants.whiteColor),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
