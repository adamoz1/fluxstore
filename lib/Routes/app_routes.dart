import 'package:fluxstore/Common/common_drawer.dart';
import 'package:fluxstore/screens/discover_page.dart';
import 'package:fluxstore/screens/home_sreen.dart';
import 'package:fluxstore/screens/notification_page.dart';
import 'package:fluxstore/screens/order_page.dart';
import 'package:fluxstore/screens/rate_app_page.dart';
import 'package:fluxstore/screens/setting_page.dart';
import 'package:fluxstore/screens/settings_notification.dart';
import 'package:fluxstore/screens/splash_screen1.dart';
import 'package:fluxstore/screens/voucher_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/profile_page.dart';
import '../screens/signin.dart';
import '../screens/signup.dart';
import '../screens/splash_screen2.dart';




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

    ];
