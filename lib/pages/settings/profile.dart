import 'package:flutter/material.dart';
import 'package:flutter_application_4/utils/utils.dart';
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
        ),
        elevation: 0,
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
                    ),
                  ),
                ),
              ],
            ),
          )),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            child: AppButton(
              lang(context, 'button.save'),
              onPressed: () => Get.back(),
              mainAxisSize: MainAxisSize.max,
            ),
          ),
        ],
      ),
    );
  }
}
