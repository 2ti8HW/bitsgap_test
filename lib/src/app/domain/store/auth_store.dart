import 'dart:convert';

import 'package:bitsgap_test/src/app/domain/entities/app_user.dart';
import 'package:bitsgap_test/src/app/domain/storages/local_storage.dart';
import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final LocalStorage _localStorage;

  _AuthStore(this._localStorage);

  void init() {
    final currentUserId = _localStorage.getUserId();

    if (currentUserId == null) return;

    final users = _localStorage.getUsers();
    user = users.firstWhereOrNull((user) => user.id == currentUserId);
  }

  @observable
  AppUser? user;

  @computed
  bool get isSignedIn => user != null;

  @action
  Future<AppUser?> signIn(String email, String password) async {
    final passwordHash = _generateMd5(password);
    final users = _localStorage.getUsers();
    final foundUser = users.firstWhereOrNull(
      (user) => user.email == email && user.passwordHash == passwordHash,
    );

    if (foundUser == null) return null;

    _localStorage.saveUserId(foundUser.id);

    return user = foundUser;
  }

  @action
  Future<AppUser?> signUp(String email, String password, String? name) async {
    final users = _localStorage.getUsers();
    final hasUser = users.firstWhereOrNull((user) => user.email == email);

    if (hasUser != null) return null;

    final newUser = _createUser(email, password, name);
    _addNewUser(newUser);

    return newUser;
  }

  @action
  void signOut() {
    _localStorage.deleteUserId();
    user = null;
  }

  AppUser _createUser(String email, String password, String? name) {
    final passwordHash = _generateMd5(password);
    return AppUser(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: name,
      passwordHash: passwordHash,
    );
  }

  void _addNewUser(AppUser user) {
    final users = _localStorage.getUsers();
    users.add(user);
    _localStorage.saveUsers(users);
  }

  String _generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
