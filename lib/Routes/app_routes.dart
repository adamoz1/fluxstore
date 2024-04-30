/* 
Written by: Adarsh Patel
Modified At: 22-04-24
Description: Contains route names of the system
with list of routes returned to GetMaterialApp at 
the main.dart.
*/

import 'package:fluxstore/screens/discover_page.dart';
import 'package:fluxstore/screens/discover_search_page.dart';
import 'package:fluxstore/screens/forgot_password.dart';
import 'package:fluxstore/screens/home_sreen.dart';
import 'package:fluxstore/screens/new_password.dart';
import 'package:fluxstore/screens/notification_page.dart';
import 'package:fluxstore/screens/onboarding_screen.dart';
import 'package:fluxstore/screens/order_page.dart';
import 'package:fluxstore/screens/product_detail.dart';
import 'package:fluxstore/screens/profile_page.dart';
import 'package:fluxstore/screens/profile_setting.dart';
import 'package:fluxstore/screens/rate_app_page.dart';
import 'package:fluxstore/screens/rate_pro_page.dart';
import 'package:fluxstore/screens/search_result.dart';
import 'package:fluxstore/screens/setting_page.dart';
import 'package:fluxstore/screens/settings_notification.dart';
import 'package:fluxstore/screens/signin.dart';
import 'package:fluxstore/screens/signup.dart';
import 'package:fluxstore/screens/splash_screen1.dart';
import 'package:fluxstore/screens/verification.dart';
import 'package:fluxstore/screens/voucher_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppRoute {
  static String homePage = '/homepage';
  static String notificationPage = '/notification';
  static String profilePage = '/profile';
  static String splashScreen1 = '/splash1';
  static String onboardingPage = '/onboarding';
  static String signin = '/signin';
  static String signup = '/signup';
  static String orderPage = '/orderpage';
  static String discoverPage = '/discoverpage';
  static String voucherPage = '/voucher';
  static String settingPage = '/setting';
  static String notificationSetting = '/notificationSetting';
  static String rateApp = '/rate';
  static String verification = '/verification';
  static String newPassword = '/newpassword';
  static String forgetPassword = '/forgetpassword';
  static String rateProduct = '/ratePro';
  static String profileSetting = '/profileSetting';
  static String searchProduct = '/searchProduct';
  static String productDetail = '/productDetail';
  static String searchResult = '/searchResult';

  static final appRoute = [
    GetPage(
        name: homePage,
        page: () => const HomePage(),
        transition: Transition.fadeIn),
    GetPage(name: notificationPage, page: () => const NotificationPage()),
    GetPage(
        name: profilePage,
        page: () => const ProfilePage(),
        transition: Transition.fadeIn),
    GetPage(name: splashScreen1, page: () => const SplashScreen1()),
    GetPage(name: onboardingPage, page: () => const OnboardingScreen()),
    GetPage(name: signin, page: () => Signin()),
    GetPage(name: signup, page: () => const Signup()),
    GetPage(
        name: orderPage,
        page: () => const OrderPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: discoverPage,
        page: () => const DiscoverPage(),
        transition: Transition.fadeIn),
    GetPage(name: voucherPage, page: () => const VoucherPage()),
    GetPage(name: settingPage, page: () => const SettingPage()),
    GetPage(name: forgetPassword, page: () => const ForgetPassword()),
    GetPage(
        name: notificationPage, page: () => const NotificationSettingPage()),
    GetPage(name: rateApp, page: () => const RateAppPage()),
    GetPage(name: verification, page: () => Verification()),
    GetPage(name: newPassword, page: () => const NewPassword()),
    GetPage(name: rateProduct, page: () => const RateProduct()),
    GetPage(name: profileSetting, page: () => const ProfileSetting()),
    GetPage(name: searchProduct, page: () => const DiscoverSearchPage()),
    GetPage(name: productDetail, page: () => const ProductDetail()),
    GetPage(name: searchResult, page: () => const SearchResult()),
  ];
}
