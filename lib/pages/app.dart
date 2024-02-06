import 'package:flutter/material.dart';
import 'package:flutter_application_4/configs/configs.dart';
import 'package:flutter_application_4/pages/pages.dart';
import 'package:flutter_application_4/utils/utils.dart';
import 'package:flutter_application_4/controller/controller.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController =
        Get.put(AppController(), permanent: false);
    return SafeArea(
        top: false,
        child: Scaffold(
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: FloatingActionButton(
          //   heroTag: 'mainfab',
          //   onPressed: () {},
          //   backgroundColor: Palette.primary,
          //   elevation: 0,
          //   child: const Icon(Icons.add),
          // ),
          bottomNavigationBar: Obx(() => BottomAppBar(
                height: 56,
                padding: const EdgeInsets.only(top: 4),
                shape: const CircularNotchedRectangle(),
                notchMargin: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMenuItem(
                      'home',
                      lang(context, "navbar.home"),
                      appController,
                    ),
                    _buildMenuItem(
                      'gps',
                      lang(context, "navbar.gps"),
                      appController,
                    ),
                    // const SizedBox(width: 45),
                    _buildMenuItem(
                      'qrcode',
                      lang(context, "navbar.qrcode"),
                      appController,
                    ),
                    _buildMenuItem(
                      'setting',
                      lang(context, "navbar.settings"),
                      appController,
                    ),
                    _buildMenuItem(
                      'account',
                      lang(context, "navbar.account"),
                      appController,
                    ),
                  ],
                ),
              )),
          body: Obx(() => IndexedStack(
                index: appController.tabIndex.value,
                children: [
                  Home(),
                  const Gps(),
                  const QRCode(),
                  const Setting(),
                  Account(),
                ],
              )),
        ));
  }

  ///Build Item Menu
  Widget _buildMenuItem(String route, String title, appController) {
    Color? color = Colors.grey.shade600;

    int tabIndex = 0;
    IconData iconData = Icons.help_outline;
    switch (route) {
      case 'home':
        iconData = Icons.home_outlined;
        tabIndex = 0;
        break;
      case 'gps':
        iconData = Icons.gps_fixed;
        tabIndex = 1;
        break;
      case 'qrcode':
        iconData = Icons.qr_code_2;
        tabIndex = 2;
        break;
      case 'setting':
        iconData = Icons.settings_outlined;
        tabIndex = 3;
        break;
      case 'account':
        iconData = Icons.person_outline_rounded;
        tabIndex = 4;
        break;
      default:
        iconData = Icons.home_outlined;
        break;
    }
    if (tabIndex == appController.tabIndex.value) {
      color = Palette.primary;
    }
    return IconButton(
      onPressed: () {
        appController.changeTabIndex(tabIndex);
      },
      padding: EdgeInsets.zero,
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: color,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 10, color: color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
