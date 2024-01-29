import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  var tabIndex = 0.obs;
  var language = "en".obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    language.value = box.read('lang') ?? 'en';
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void switchLanguage(String lang) {
    language.value = lang;

    box.write('lang', lang);
    Locale locale = Locale(lang);
    Get.updateLocale(locale);

    update();
  }
}
