import 'package:flutter/material.dart';
import 'package:flutter_application_4/configs/language.dart';
import 'package:flutter_application_4/configs/preferences.dart';
import 'package:flutter_application_4/utils/preferences.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  var tabIndex = 0.obs;
  var language = AppLanguage.defaultLanguage.languageCode.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    initLanguage();
  }

  void initLanguage() {
    language.value = UtilPreferences.get(Preferences.language) ??
        AppLanguage.defaultLanguage.languageCode;
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void switchLanguage(String lang) {
    language.value = lang;

    UtilPreferences.set(Preferences.language, lang);
    Locale locale = Locale(lang);

    Get.updateLocale(locale);
    update();
  }
}
