class Preferences {
  static String language = 'language';
  static String darkOption = 'darkOption';

  ///Singleton factory
  static final Preferences _instance = Preferences._internal();

  factory Preferences() {
    return _instance;
  }

  Preferences._internal();
}
