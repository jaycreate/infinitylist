import 'package:flutter_application_4/core/authentication_manager.dart';
import 'package:flutter_application_4/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/pages.dart';
import 'package:get/get.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = Get.find();

    return Obx(() {
      return authManager.isLogged.value ? const App() : const LoginView();
    });
  }
}
