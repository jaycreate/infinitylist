import 'package:flutter/material.dart';
import 'package:flutter_application_4/controller/app_controller.dart';
import 'package:flutter_application_4/utils/utils.dart';
import 'package:flutter_application_4/widgets/widgets.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
                bottom: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    lang(context, 'login'),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  AppTextInput(
                    hintText: lang(context, 'phone'),
                    keyboardType: TextInputType.number,
                    trailing: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.clear,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextInput(
                    hintText: lang(context, 'password'),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    trailing: GestureDetector(
                      onTap: () {},
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye_outlined)),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  AppButton(
                    lang(context, 'login_btn'),
                    onPressed: () {
                      Get.offAllNamed('/');
                    },
                    mainAxisSize: MainAxisSize.max,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        lang(context, 'reset_password'),
                        onPressed: () {},
                        mainAxisSize: MainAxisSize.max,
                        type: ButtonType.text,
                      ),
                      // AppButton(
                      //   lang(context, 'register'),
                      //   onPressed: () {},
                      //   mainAxisSize: MainAxisSize.max,
                      //   type: ButtonType.text,
                      // ),
                    ],
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 15),
              child: GetBuilder<AppController>(builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      'ไทย',
                      onPressed: () {
                        controller.switchLanguage('th');
                      },
                      mainAxisSize: MainAxisSize.max,
                      type: ButtonType.text,
                    ),
                    AppButton(
                      'Eng',
                      onPressed: () {
                        controller.switchLanguage('en');
                      },
                      mainAxisSize: MainAxisSize.max,
                      type: ButtonType.text,
                    ),
                  ],
                );
              }),
            ),
          ],
        );
      }),
    );
  }
}
