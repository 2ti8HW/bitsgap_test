import 'package:bitsgap_test/src/app/app_messenger.dart';
import 'package:bitsgap_test/src/app/app_router.dart';
import 'package:bitsgap_test/src/app/domain/storages/local_storage.dart';
import 'package:bitsgap_test/src/app/domain/store/auth_store.dart';
import 'package:bitsgap_test/src/app/injection/abstract_module.dart';
import 'package:bitsgap_test/src/features/auth/domain/auth_page_store.dart';
import 'package:bitsgap_test/src/features/auth/domain/sign_in_store.dart';
import 'package:bitsgap_test/src/features/auth/domain/sign_up_store.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class AuthModule extends AbstractModule {
  static final AuthModule _authModule = AuthModule._internal();

  factory AuthModule() {
    return _authModule;
  }

  AuthModule._internal();

  @override
  void configure(Injector injector) {
    injector.map<AuthStore>(
      (i) => AuthStore(i.get<LocalStorage>())..init(),
      isSingleton: true,
    );

    injector.map<AuthPageStore>(
      (i) => AuthPageStore(
        SignInStore(
          i.get<AuthStore>(),
          i.get<AppRouter>(),
          i.get<AppMessenger>(),
        ),
        SignUpStore(
          i.get<AuthStore>(),
          i.get<AppRouter>(),
          i.get<AppMessenger>(),
        ),
        i.get<AppMessenger>(),
      ),
    );
  }
}
