import 'package:flutter/material.dart';
import 'package:flutter_application_4/configs/configs.dart';
import 'package:flutter_application_4/pages/pages.dart';
import 'package:flutter_application_4/utils/utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: Application.debug,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        primarySwatch: generateMaterialColor(Palette.primary),
        // brightness: Brightness.light,
      ),
      localizationsDelegates: const [
        Translate.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: UtilLanguage.getCurrentLanguage(Get.deviceLocale),
      fallbackLocale: AppLanguage.defaultLanguage,
      supportedLocales: AppLanguage.supportLanguage,
      home: const App(),
      getPages: appRoutes(),
    );
  }
}
