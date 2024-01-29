import 'package:flutter/material.dart';
import 'package:flutter_application_4/utils/utils.dart';
import 'package:flutter_application_4/widgets/app_list_tile.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            lang(context, 'settings'),
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Prompt',
            ),
          ),
          backgroundColor: Colors.grey[100],
          elevation: 0.3),
      body: ListView(
        children: [
          AppListTile(
            title: lang(context, 'profile'),
            leading: Icon(
              Icons.person_outline,
              color: Colors.grey.shade600,
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.grey.shade600,
            ),
            onPressed: () {
              Get.toNamed('/profile');
            },
          ),
          AppListTile(
            title: lang(context, 'language'),
            leading: Icon(
              Icons.language_outlined,
              color: Colors.grey.shade600,
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.grey.shade600,
            ),
            onPressed: () {
              Get.toNamed('/language');
            },
          ),
        ],
      ),
    );
  }
}
