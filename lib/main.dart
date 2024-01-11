import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        // primarySwatch: generateMaterialColor(Palette.primary),
      ),
      home: const App(),
      getPages: [
        GetPage(name: '/', page: () => const App()),
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/details', page: () => const Details()),
        GetPage(name: '/map', page: () => const Map()),
      ],
    );
  }
}
