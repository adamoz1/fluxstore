/* 
Written by: Adarsh Patel
Modified At: 22-04-24
Description: Following file has the design of 
onboarding page.
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/others/shared_prefs.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  PageController controller = PageController();
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  var txt1 = "Discover something new".obs;
  var txt2 = "Special new arrivals just for you".obs;

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
            contentOver(),
          ],
        ),
      ),
    );
  }

  // Function has content which is displayed over background.
  Widget contentOver() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
            child: Obx(() {
              return Text(
                txt1.value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Constants.blackColor,
                ),
                textAlign: TextAlign.center,
              );
            })),
        Container(
          width: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.only(top: (MediaQuery.of(context).size.height / 30)),
          child: Obx(() {
            return Text(
              txt2.value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Constants.blackColor,
              ),
              textAlign: TextAlign.center,
            );
          }),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0),
            child: PageView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int num) {
                _tabController.index = num;
                if (num == 0) {
                  txt1.value = "Discover something new";
                  txt2.value = "Special new arrivals just for you";
                } else if (num == 1) {
                  txt1.value = "Update trendy outfit";
                  txt2.value = "Favorite brands and hottest trends";
                } else if (num == 2) {
                  txt1.value = "Explore your true style";
                  txt2.value = "Relax and let us bring the style to you";
                }
              },
              scrollDirection: Axis.horizontal,
              children: [
                pageViewContent("assets/splash_image2.png"),
                pageViewContent("assets/splash_image3.png"),
                pageViewContent("assets/splash_image4.png")
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        TabPageSelector(
          indicatorSize: 8,
          controller: _tabController,
          selectedColor: Constants.whiteColor,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0, top: 10),
          child: ElevatedButton(
            onPressed: () {
              if (controller.page == 2) {
                print("Current page is ${controller.page}");
                SharedPrefs.sharedPreferences
                    .setString("seenLandingPage", "true");
                Get.offAllNamed(AppRoute.signup);
              } else {
                controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    Constants.whiteColor.withOpacity(0.90).withAlpha(70),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(
                        Constants.buttonBorderRadius,
                        Constants.buttonBorderRadius)),
                    side: BorderSide(color: Constants.whiteColor, width: 2))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                "Shopping View",
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Constants.whiteColor),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 11.5,
        )
      ],
    );
  }

  // Image Frame over PageView
  pageViewContent(String image) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
        decoration: BoxDecoration(
            color: Constants.splashGreyColor1,
            borderRadius: BorderRadius.circular(Constants.buttonBorderRadius),
            image: DecorationImage(
                image: AssetImage(image), fit: BoxFit.contain)));
  }
}
