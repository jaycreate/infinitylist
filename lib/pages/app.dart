import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/pages.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController =
        Get.put(AppController(), permanent: false);
    return SafeArea(
        top: false,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            heroTag: 'mainfab',
            onPressed: () {},
            backgroundColor: Colors.blue.shade800,
            child: const Icon(Icons.add),
            // elevation: 0,
          ),
          bottomNavigationBar: Obx(() => BottomAppBar(
                height: 56,
                padding: const EdgeInsets.only(top: 4),
                shape: const CircularNotchedRectangle(),
                notchMargin: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMenuItem('home', appController),
                    _buildMenuItem('gps', appController),
                    const SizedBox(width: 45),
                    _buildMenuItem('qr', appController),
                    _buildMenuItem('setting', appController),
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
                ],
              )),
        ));
  }

  ///Build Item Menu
  Widget _buildMenuItem(String route, appController) {
    Color? color = Colors.grey.shade600;
    String title = 'หน้าหลัก';
    int tabIndex = 0;
    IconData iconData = Icons.help_outline;
    switch (route) {
      case 'home':
        iconData = Icons.home_outlined;
        title = 'หน้าหลัก';
        tabIndex = 0;
        break;
      case 'gps':
        iconData = Icons.gps_fixed;
        title = 'จีพีเอส';
        tabIndex = 1;
        break;
      case 'qr':
        iconData = Icons.qr_code_2;
        title = 'คิวอาร์';
        tabIndex = 2;
        break;
      case 'setting':
        iconData = Icons.settings_outlined;
        title = 'ตั้งค่า';
        tabIndex = 3;
        break;
      default:
        iconData = Icons.home_outlined;
        title = 'home';
        break;
    }
    if (tabIndex == appController.tabIndex.value) {
      color = Colors.blue.shade800;
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
