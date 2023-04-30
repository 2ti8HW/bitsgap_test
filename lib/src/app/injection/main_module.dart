import 'package:bitsgap_test/src/app/app_messenger.dart';
import 'package:bitsgap_test/src/app/app_router.dart';
import 'package:bitsgap_test/src/app/data/storages/local_storage_impl.dart';
import 'package:bitsgap_test/src/app/domain/storages/local_storage.dart';
import 'package:bitsgap_test/src/app/domain/store/auth_store.dart';
import 'package:bitsgap_test/src/app/injection/abstract_module.dart';
import 'package:bitsgap_test/src/app/injection/auth_module.dart';
import 'package:bitsgap_test/src/features/home/domain/home_page_store.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainModule extends AbstractModule {
  static final MainModule _mainModule = MainModule._internal();

  factory MainModule() {
    return _mainModule;
  }

  MainModule._internal() {
    configure(injector);
  }

  Future<void> asyncInit() async {
    final sh = await SharedPreferences.getInstance();
    injector.map<SharedPreferences>(
      (i) => sh,
      isSingleton: true,
    );
  }

  @override
  Future<void> configure(Injector injector) async {
    injector.map<AppRouter>((i) => AppRouter(), isSingleton: true);
    injector.map<AppMessenger>(
      (i) => AppMessenger(
        i.get<AppRouter>().scaffoldMessengerKey,
      ),
      isSingleton: true,
    );

    injector.map<LocalStorage>(
      (i) => LocalStorageImpl(i.get<SharedPreferences>()),
      isSingleton: true,
    );

    injector.map<HomePageStore>(
      (i) => HomePageStore(
        i.get<AuthStore>(),
        i.get<AppRouter>(),
      ),
      isSingleton: true,
    );

    AuthModule().configure(injector);
  }
}
