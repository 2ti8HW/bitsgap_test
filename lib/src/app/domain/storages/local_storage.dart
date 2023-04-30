import 'package:bitsgap_test/src/app/domain/entities/app_user.dart';

abstract class LocalStorage {
  Future<void> saveUsers(List<AppUser> user);

  List<AppUser> getUsers();

  Future<void> saveUserId(String userId);

  Future<void> deleteUserId();

  String? getUserId();
}
