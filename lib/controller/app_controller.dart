import 'package:get/get.dart';

class AppController extends GetxController {
  var tabIndex = 0.obs;
  var language = "en".obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void switchLanguage(String lang) {
    language.value = lang;
    update();
  }
}
