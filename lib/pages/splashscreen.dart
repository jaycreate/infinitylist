import 'package:flutter/material.dart';
import 'package:flutter_application_4/controller/controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              // Get.offAllNamed('/');
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.grey,
                strokeWidth: 2,
              ));
            }));
  }
}
