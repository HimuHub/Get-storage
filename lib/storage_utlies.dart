import 'package:get_storage/get_storage.dart';

class StorageUtiles {
  static final _storage = GetStorage();
  static final _loginkKey = "LoginKey";

  static bool isFirstTimeLogin() {
    return _storage.read(_loginkKey) ?? true;
  }

  static void setLogindata(bool value) {
    _storage.write(_loginkKey, value);
  }
}
