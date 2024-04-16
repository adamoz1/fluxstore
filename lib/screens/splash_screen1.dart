import 'package:flutter/material.dart';
import 'package:fluxstore/constants.dart';

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
            color: Colors.black.withOpacity(0.15),
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
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Constants().whiteColor),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "A home for a fashionita",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Constants().whiteColor),
              )),
            ],
          )
        ],
      ),
    );
  }
}
