import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/authentication_manager.dart';
import 'package:flutter_application_4/utils/utils.dart';
import 'package:flutter_application_4/widgets/widgets.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  Account({super.key});

  final AuthenticationManager _authManager = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang(context, 'account'),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
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
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            child: AppButton(
              lang(context, 'button.logout'),
              onPressed: () {
                _authManager.logOut();
              },
              mainAxisSize: MainAxisSize.max,
              type: ButtonType.outline,
            ),
          ),
        ],
      ),
    );
  }
}
