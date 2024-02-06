class Application {
  //

  static String appVersion = '0.0.1';
  static bool debug = false;

  ///Singleton factory
  static final Application _instance = Application._internal();

  factory Application() {
    return _instance;
  }

  Application._internal();
}
