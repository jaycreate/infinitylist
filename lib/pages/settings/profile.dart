import 'package:flutter/material.dart';
import 'package:flutter_application_4/utils/utils.dart';
import 'package:flutter_application_4/widgets/app_text_input.dart';
import 'package:flutter_application_4/widgets/widgets.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang(context, 'profile'),
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Prompt',
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black87,
            )),
        backgroundColor: Colors.grey[100],
        elevation: 0.3,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 15,
              bottom: 15,
            ),
            child: ListView(
              children: [
                AppTextInput(
                  hintText: lang(context, 'account_info'),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black12,
                    ),
                  ),
                ),
              ],
            ),
          )),
          AppButton(
            lang(context, 'button.save'),
            onPressed: () => Get.back(),
            mainAxisSize: MainAxisSize.max,
          ),
        ],
      ),
    );
  }
}
