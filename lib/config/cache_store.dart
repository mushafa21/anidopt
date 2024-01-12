import 'package:get_storage/get_storage.dart';

import '../model/user_model.dart';

class CacheStore {
  /// Singleton instance
  static final CacheStore _instance = CacheStore._internal();

  factory CacheStore() {
    return _instance;
  }

  CacheStore._internal();

  final GetStorage _getStorage = GetStorage();

  set token(String token) {
    _getStorage.write('token', token);

  }

  String get token {
    return _getStorage.read<String?>('token') ?? "";
  }


  set first(bool first) {
    _getStorage.write('first', first);

  }

  bool get isLogin {
    return _getStorage.read<bool?>('login') ?? false;
  }

  set isLogin(bool login) {
    _getStorage.write('login', login);

  }

  bool get first {
    return _getStorage.read<bool?>('first') ?? true;
  }


  set user(UserModel user) {
    _getStorage.write('user', user.toJson());
  }

  UserModel get user {
    return UserModel.fromJson(_getStorage.read<Map<String, dynamic>>('user') ?? {});
  }



  void clearCache() {
    _getStorage.erase();
    first = false;
  }
}