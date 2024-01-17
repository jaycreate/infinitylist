import 'package:flutter/material.dart';
import 'package:flutter_application_4/widgets/app_list_tile.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "ตั้งค่าใช้งาน",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey[100],
          elevation: 0.3),
      body: ListView(
        children: [
          AppListTile(
            title: "ข้อมูลส่วนตัว",
            leading: Icon(
              Icons.person_outline,
              color: Colors.grey.shade600,
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.grey.shade600,
            ),
            onPressed: () {},
          ),
          AppListTile(
            title: "ภาษา",
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
