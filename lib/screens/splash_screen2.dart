import 'package:flutter/material.dart';
import 'package:fluxstore/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashScreen2 extends StatefulWidget {
  SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>
    with TickerProviderStateMixin {
  PageController controller = PageController();
  late TabController _tabController = TabController(length: 3, vsync: this);

  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Constants.splashGreyColor,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.7,
              width: double.infinity,
              color: Constants.whiteColor,
            ),
            contentOver(context),
          ],
        ),
      ),
    );
  }

  Widget contentOver(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
          child: Text(
            "Discover something new",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Constants.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.only(top: (MediaQuery.of(context).size.height / 17)),
          child: Text(
            "Special new arrivals just for you",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Constants.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: PageView(
            controller: controller,
            // ignore: avoid_types_as_parameter_names
            onPageChanged: (num) {
              _curr = num;
              _tabController.index = num;
            },
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                  margin: const EdgeInsets.all(24),
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      color: Constants.splashGreyColor1,
                      borderRadius:
                          BorderRadius.circular(Constants.buttonBorderRadius),
                      image: const DecorationImage(
                          image: AssetImage("assets/splash_image2.png"),
                          fit: BoxFit.contain))),
              Container(
                  margin: const EdgeInsets.all(24),
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      color: Constants.splashGreyColor1,
                      borderRadius:
                          BorderRadius.circular(Constants.buttonBorderRadius),
                      image: const DecorationImage(
                          image: AssetImage("assets/splash_image3.png"),
                          fit: BoxFit.contain))),
              Container(
                  margin: const EdgeInsets.all(24),
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      color: Constants.splashGreyColor1,
                      borderRadius:
                          BorderRadius.circular(Constants.buttonBorderRadius),
                      image: const DecorationImage(
                          image: AssetImage("assets/splash_image4.png"),
                          fit: BoxFit.contain))),
            ],
          ),
        ),
        TabPageSelector(
          controller: _tabController,
          selectedColor: Constants.whiteColor,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0, top: 10),
          child: ElevatedButton(
            onPressed: () {
              Get.to(SplashScreen2());
            },
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    Constants.whiteColor.withOpacity(0.90).withAlpha(70),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(
                        Constants.buttonBorderRadius,
                        Constants.buttonBorderRadius)),
                    side: BorderSide(color: Constants.whiteColor, width: 2))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text("Shopping View"),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 8.5,
        )
      ],
    );
  }
}
