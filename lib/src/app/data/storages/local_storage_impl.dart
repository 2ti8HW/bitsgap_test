import 'dart:convert';

import 'package:bitsgap_test/src/app/domain/entities/app_user.dart';
import 'package:bitsgap_test/src/app/domain/storages/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl implements LocalStorage {
  static const _allUsers = 'allUsers';
  static const _userId = 'userId';

  final SharedPreferences _prefs;

  LocalStorageImpl(this._prefs);

  @override
  List<AppUser> getUsers() {
    final value = _prefs.getString(_allUsers);
    if (value == null) return [];

    return (jsonDecode(value) as List).map((e) => AppUser.fromJson(e)).toList();
  }

  @override
  Future<void> saveUsers(List<AppUser> users) {
    final json = jsonEncode(
      users.map((user) => user.toJson()).toList(growable: false),
    );
    return _prefs.setString(_allUsers, json);
  }

  @override
  String? getUserId() {
    return _prefs.getString(_userId);
  }

  @override
  Future<void> saveUserId(String userId) {
    return _prefs.setString(_userId, userId);
  }

  @override
  Future<void> deleteUserId() {
    return _prefs.remove(_userId);
  }
}
