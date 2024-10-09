import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:guliva/core/error/exceptions.dart';
import 'package:guliva/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalSource {
  Future<String> getToken();
  Future<int?> getUserId();
  Future<UserModel> getUser();
  Future<void> saveToken(String token);
  Future<void> saveUserId(int id);
  Future<void> saveUser(UserModel user);
  Future<void> clearCache();
  Future<bool> isTokenAvailable();
}

const cachedToken = 'TOKEN';
const cachedUserId = 'USER-ID';
const cachedUser = 'USER';

class AuthLocalSourceImpl implements AuthLocalSource {
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  AuthLocalSourceImpl({
    required this.sharedPreferences,
    required this.secureStorage,
  });

  @override
  Future<String> getToken() async {
    final token = await secureStorage.read(key: cachedToken);
    return token ?? (throw CacheException());
  }

  @override
  Future<int?> getUserId() async {
    String? id = await secureStorage.read(key: cachedUserId);
    if (id != null) {
      return int.tryParse(id);
    }
    return null;
  }

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: cachedToken, value: token);
  }

  @override
  Future<void> saveUserId(int id) async {
    await secureStorage.write(key: cachedUserId, value: id.toString());
  }

  @override
  Future<UserModel> getUser() async {
    final jsonString = sharedPreferences.getString(cachedUser);
    return jsonString != null
        ? userModelFromJson(jsonString)
        : (throw CacheException());
  }

  @override
  Future<void> saveUser(UserModel user) async {
    await sharedPreferences.setString(cachedUser, userModelToJson(user));
  }

  @override
  Future<bool> isTokenAvailable() async {
    final token = await secureStorage.read(key: cachedToken);
    return token != null;
  }

  @override
  Future<void> clearCache() async {
    await secureStorage.deleteAll();
    await sharedPreferences.remove(cachedUser);
  }
}
