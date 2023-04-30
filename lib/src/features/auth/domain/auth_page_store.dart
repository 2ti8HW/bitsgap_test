import 'package:bitsgap_test/resources/l10n/generated/l10n.dart';
import 'package:bitsgap_test/src/app/app_messenger.dart';
import 'package:bitsgap_test/src/features/auth/domain/sign_in_store.dart';
import 'package:bitsgap_test/src/features/auth/domain/sign_up_store.dart';
import 'package:bitsgap_test/src/features/auth/widgets/auth_page_type.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'auth_page_store.g.dart';

class AuthPageStore = _AuthPageStore with _$AuthPageStore;

abstract class _AuthPageStore with Store {
  static const _animateDuration = Duration(milliseconds: 300);
  static const _animatecurve = Curves.easeInOut;

  final authPageController = PageController();

  final SignInStore signInStore;
  final SignUpStore signUpStore;
  final AppMessenger _appMessenger;

  _AuthPageStore(
    this.signInStore,
    this.signUpStore,
    this._appMessenger,
  ) {
    reaction((_) => pageIndex, _animateToPage);
  }

  final pages = [
    AuthPageType.signIn,
    AuthPageType.signUp,
  ];

  @observable
  AuthPageType currentPage = AuthPageType.signIn;

  @computed
  int get pageIndex => pages.indexOf(currentPage);

  @action
  void forgotPassword() {
    _appMessenger.showSnackBar(AppL10n.current.forgotPasswordMessage);
  }

  void _animateToPage(int page) {
    authPageController.animateToPage(
      page,
      duration: _animateDuration,
      curve: _animatecurve,
    );
  }
}
