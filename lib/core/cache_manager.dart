import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(String? mytoken) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.token.toString(), mytoken);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.token.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.token.toString());
  }
}

enum CacheManagerKey { token }
