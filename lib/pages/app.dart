import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/pages.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class App extends StatelessWidget {
  App({super.key});

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          // height: 54,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            // backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
            // unselectedItemColor: Colors.white.withOpacity(0.5),
            // selectedItemColor: Colors.white,
            selectedItemColor: Colors.blue.shade800,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,

            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.home,
                    // size: 25.0,
                  ),
                ),
                label: "หน้าหลัก",
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.gps_fixed,
                    // size: 20.0,
                  ),
                ),
                label: 'จีพีเอส',
                // backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.qr_code_2,
                    // size: 20.0,
                  ),
                ),
                label: 'คิวอาร์',
                // backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.settings,
                    // size: 20.0,
                  ),
                ),
                label: 'ตั่งค่า',
                // backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final AppController landingPageController =
        Get.put(AppController(), permanent: false);
    return SafeArea(
        top: false,
        child: Scaffold(
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   child: Icon(Icons.add),
          //   backgroundColor: Colors.blue.shade800,
          //   elevation: 0,
          // ),
          bottomNavigationBar:
              buildBottomNavigationMenu(context, landingPageController),
          body: Obx(() => IndexedStack(
                index: landingPageController.tabIndex.value,
                children: [
                  Home(),
                  const Gps(),
                  const QRCode(),
                  const Settings(),
                ],
              )),
        ));
  }
}
