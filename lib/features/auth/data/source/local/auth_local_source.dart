import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:guliva/core/error/exceptions.dart';
import 'package:guliva/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalSource {
  Future<String> getToken();

  Future<UserModel> getUser();

  Future<void> saveToken(String token);

  Future<void> saveUser(UserModel user);

  Future<void> clearCache();

  Future<bool> isTokenAvailable();
}

const cachedToken = 'TOKEN';
const cachedUser = 'USER';

class AuthLocalSourceImpl implements AuthLocalSource {
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;
  AuthLocalSourceImpl(
      {required this.sharedPreferences, required this.secureStorage});

  @override
  Future<String> getToken() async {
    String? token = await secureStorage.read(key: cachedToken);
    if (token != null) {
      return Future.value(token);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: cachedToken, value: token);
  }

  @override
  Future<UserModel> getUser() async {
    if (sharedPreferences.getBool('first_run') ?? true) {
      await secureStorage.deleteAll();
      sharedPreferences.setBool('first_run', false);
    }
    final jsonString = sharedPreferences.getString(cachedUser);
    if (jsonString != null) {
      return Future.value(userModelFromJson(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveUser(UserModel user) {
    return sharedPreferences.setString(
      cachedUser,
      userModelToJson(user),
    );
  }

  @override
  Future<bool> isTokenAvailable() async {
    String? token = await secureStorage.read(key: cachedToken);
    return Future.value((token != null));
  }

  @override
  Future<void> clearCache() async {
    await secureStorage.deleteAll();
    await sharedPreferences.remove(cachedUser);
  }
}
