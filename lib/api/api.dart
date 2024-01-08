import 'package:dio/dio.dart';
import 'package:flutter_application_4/api/http_manager.dart';
import 'package:flutter_application_4/model/model_result_api.dart';

class Api {
  //

  // Load user data
  static Future<dynamic> users(var page) async {
    String url =
        "https://g87d9ssdy6.execute-api.ap-southeast-1.amazonaws.com/default/sample-list-v1-list?page=$page";

    final result = await httpManager.get(
      url: url,
      options: Options(headers: <String, dynamic>{
        'x-api-key': "dH2kW4brIUaf9OGUqb7DXaWyGJSfwItR2lQ8l6QS",
      }),
    );

    return ResultApiModel.fromJson(result);
  }
}
