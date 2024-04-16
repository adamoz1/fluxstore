import 'package:fluxstore/Common/common_drawer.dart';
import 'package:fluxstore/screens/home_sreen.dart';
import 'package:fluxstore/screens/notification_page.dart';
import 'package:fluxstore/screens/splash_screen1.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

appRoutes() => [
      GetPage(name: '/', page: () => const HomePage()),
      GetPage(name: '/notification', page:() => const NotificationPage()),

    ];
