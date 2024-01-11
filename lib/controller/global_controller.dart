import 'package:get/get.dart';

class GlobalController extends GetxController {
  //
  var pageIndex = 0;

  setParams(int index) {
    pageIndex = index;
  }
}
