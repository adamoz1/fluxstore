import 'package:flutter/material.dart';

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
                    colorFilter: ColorFilter.mode(
                        Color.fromARGB(255, 160, 160, 160), BlendMode.darken),
                    image: AssetImage(
                      "assets/splash_image1.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              Center(child: Text("Welcome to Splash Screen")),
            ],
          )
        ],
      ),
    );
  }
}
