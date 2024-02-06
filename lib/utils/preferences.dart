import 'package:get_storage/get_storage.dart';

class UtilPreferences {
  static Future<void> clear() {
    final prefs = GetStorage();
    return prefs.erase();
  }

  static dynamic get(String key) {
    final prefs = GetStorage();
    return prefs.read(key);
  }

  static dynamic set(String key, dynamic value) {
    final prefs = GetStorage();
    return prefs.write(key, value);
  }

  ///Singleton factory
  static final UtilPreferences _instance = UtilPreferences._internal();

  factory UtilPreferences() {
    return _instance;
  }

  UtilPreferences._internal();
}
