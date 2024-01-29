import 'package:flutter/material.dart';
import 'package:flutter_application_4/utils/utils.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang(context, 'language'),
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
