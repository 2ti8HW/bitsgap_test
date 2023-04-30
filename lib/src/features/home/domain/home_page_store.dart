import 'package:bitsgap_test/src/app/app_router.dart';
import 'package:bitsgap_test/src/app/domain/store/auth_store.dart';
import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  final AuthStore _authStore;
  final AppRouter _appRouter;

  _HomePageStore(this._authStore, this._appRouter);

  @computed
  String get userName => _authStore.user?.name ?? '';

  @action
  void signOut() {
    _authStore.signOut();
    _appRouter.router.go(AppRouter.auth);
  }
}
