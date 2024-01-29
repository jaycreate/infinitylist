import 'package:flutter_application_4/pages/pages.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/',
        page: () => const App(),
        transition: Transition.rightToLeftWithFade,
        // transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/home',
        page: () => Home(),
        transition: Transition.rightToLeftWithFade,
        // transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/details',
        page: () => const Details(),
        transition: Transition.rightToLeftWithFade,
        // transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/gps',
        page: () => const Gps(),
        transition: Transition.rightToLeftWithFade,
        // transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/language',
        page: () => const Language(),
        transition: Transition.rightToLeftWithFade,
        // transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/profile',
        page: () => const Profile(),
        transition: Transition.rightToLeftWithFade,
        // transitionDuration: const Duration(milliseconds: 500),
      ),
    ];
