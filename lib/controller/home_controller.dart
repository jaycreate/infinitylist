import 'package:flutter/foundation.dart';
import 'package:flutter_application_4/api/api.dart';
import 'package:flutter_application_4/model/model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<UserModel> listData = [];

  var page = 1;
  var preventCall = false;
  var isInitialized = false.obs;
  var tabIndex = 0;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  refreshData() async {
    listData = [];
    page = 1;
    fetchData();
  }

  fetchData() async {
    final ResultApiModel result = await Api.users(page);
    if (kDebugMode) print("page $page");

    page++;

    for (int i = 0; i < result.result; i++) {
      listData.add(UserModel.fromJson(result.data[i]));
    }
    isInitialized(true);
    update();
  }

  setTabIndex(index) {
    tabIndex = index;
  }
}
