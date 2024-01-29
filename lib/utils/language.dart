import 'package:flutter/material.dart';
import 'package:flutter_application_4/configs/configs.dart';
import 'package:flutter_application_4/utils/translate.dart';
import 'package:get_storage/get_storage.dart';

String lang(BuildContext context, String key) {
  return Translate.of(context).translate(key);
}

class UtilLanguage {
  ///Get Language Global Language Name
  static String getGlobalLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'th':
        return 'ไทย';
      case 'lo':
        return 'ລາວ';
      default:
        return 'Unknown';
    }
  }

  ///Current Language
  static Locale getCurrentLanguage(deviceLocale) {
    final box = GetStorage();
    var code = box.read('lang') ?? deviceLocale;

    switch (code) {
      case 'en':
        return const Locale('en', 'US');
      case 'th':
        return const Locale('th', 'TH');
      case 'lo':
        return const Locale('lo', 'LA');
      default:
        return const Locale('en', 'US');
    }
  }

  static bool isRTL() {
    switch (AppLanguage.defaultLanguage.languageCode) {
      case "ar":
      case "he":
        return true;
      default:
        return false;
    }
  }

  ///Singleton factory
  static final UtilLanguage _instance = UtilLanguage._internal();

  factory UtilLanguage() {
    return _instance;
  }

  UtilLanguage._internal();
}
