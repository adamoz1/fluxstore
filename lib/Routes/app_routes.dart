import 'package:fluxstore/Common/common_drawer.dart';
import 'package:fluxstore/screens/discover_page.dart';
import 'package:fluxstore/screens/home_sreen.dart';
import 'package:fluxstore/screens/notification_page.dart';
import 'package:fluxstore/screens/order_page.dart';
<<<<<<< HEAD
import 'package:fluxstore/screens/profile_setting.dart';
import 'package:fluxstore/screens/rate_app_page.dart';
import 'package:fluxstore/screens/rate_pro_page.dart';
=======
import 'package:fluxstore/screens/rate_app_page.dart';
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
import 'package:fluxstore/screens/setting_page.dart';
import 'package:fluxstore/screens/settings_notification.dart';
import 'package:fluxstore/screens/splash_screen1.dart';
import 'package:fluxstore/screens/voucher_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screens/forgot_password.dart';
import '../screens/new_password.dart';
import '../screens/profile_page.dart';
import '../screens/signin.dart';
import '../screens/signup.dart';
import '../screens/splash_screen2.dart';
<<<<<<< HEAD
import '../screens/verification.dart';

class AppRoute {
  static String homePage = '/homepage';
  static String notificationPage = '/notification';
  static String profilePage = '/profile';
  static String splashScreen1 = '/splash1';
  static String splashScreen2 = '/splash2';
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
=======




appRoutes() => [
      GetPage(name: '/homepage', page: () => const HomePage()),
      GetPage(name: '/notification', page:() => const NotificationPage()),
      GetPage(name: '/profile',page: () => const ProfilePage()),
      GetPage(name: '/splash1', page: () => const SplashScreen1()),
      GetPage(name: '/splash2', page: () => SplashScreen2()),
      GetPage(name: '/signin', page: () => Signin()),
      GetPage(name: '/signup', page: () => Signup()),
      GetPage(name: '/orderpage', page: () => const OrderPage()),
      GetPage(name: '/discoverpage', page: () => const DiscoverPage()),
      GetPage(name: '/voucher', page: () => const VoucherPage()),
      GetPage(name: '/setting', page: () => const SettingPage()),
      GetPage(name: '/notificationSetting', page: () => const NotificationSettingPage()),
      GetPage(name: '/rateApp', page: () => const RateAppPage()),
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436

  static final appRoute = [
    GetPage(name: homePage, page: () => const HomePage()),
    GetPage(name: notificationPage, page: () => const NotificationPage()),
    GetPage(name: profilePage, page: () => const ProfilePage()),
    GetPage(name: splashScreen1, page: () => const SplashScreen1()),
    GetPage(name: splashScreen2, page: () => SplashScreen2()),
    GetPage(name: signin, page: () => Signin()),
    GetPage(name: signup, page: () => Signup()),
    GetPage(name: orderPage, page: () => const OrderPage()),
    GetPage(name: discoverPage, page: () => const DiscoverPage()),
    GetPage(name: voucherPage, page: () => const VoucherPage()),
    GetPage(name: settingPage, page: () => const SettingPage()),
    GetPage(name: forgetPassword, page: () => ForgetPassword()),
    GetPage(
        name: notificationPage, page: () => const NotificationSettingPage()),
    GetPage(name: rateApp, page: () => const RateAppPage()),
    GetPage(name: verification, page: () => Verification()),
    GetPage(name: newPassword, page: () => NewPassword()),
    GetPage(name: rateProduct, page: () => const RateProduct()),
    GetPage(name: profileSetting, page: () => const ProfileSetting()),
  ];
}
