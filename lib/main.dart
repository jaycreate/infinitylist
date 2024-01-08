import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/details.dart';
import 'package:flutter_application_4/pages/home.dart';
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
      home: Home(),
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/details', page: () => const Details()),
      ],
    );
  }
}
