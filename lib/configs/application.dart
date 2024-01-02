class Application {
  //

  static String listUrl =
      'https://g87d9ssdy6.execute-api.ap-southeast-1.amazonaws.com';
  static String listApiKey = 'dH2kW4brIUaf9OGUqb7DXaWyGJSfwItR2lQ8l6QS';

  ///Singleton factory
  static final Application _instance = Application._internal();

  factory Application() {
    return _instance;
  }

  Application._internal();
}
