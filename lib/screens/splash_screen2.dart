import 'package:flutter/material.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/others/shared_prefs.dart';
import 'package:get/get.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>
    with TickerProviderStateMixin {
  PageController controller = PageController();
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

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
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Constants.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.only(top: (MediaQuery.of(context).size.height / 30)),
          child: Text(
            "Special new arrivals just for you",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Constants.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0),
            child: PageView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (num) {
                _tabController.index = num;
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
              SharedPrefs.sharedPreferences
                  .setString("seenLandingPage", "true");
              Get.offAllNamed(AppRoute.signup);
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
