import 'package:flutter/material.dart';
import 'package:flutter_application_4/controller/controller.dart';
import 'package:flutter_application_4/utils/utils.dart';
import 'package:flutter_application_4/widgets/app_list_tile.dart';
import 'package:get/get.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang(context, 'language'),
        ),
        elevation: 0,
      ),
      body: GetBuilder<AppController>(builder: (controller) {
        return ListView(
          children: [
            AppListTile(
              title: "English",
              trailing: controller.language.value == 'en'
                  ? const Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : Container(),
              onPressed: () {
                controller.switchLanguage('en');
              },
            ),
            AppListTile(
              title: "ภาษาไทย",
              trailing: controller.language.value == 'th'
                  ? const Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : Container(),
              onPressed: () {
                controller.switchLanguage('th');
              },
            ),
          ],
        );
      }),
    );
  }
}
