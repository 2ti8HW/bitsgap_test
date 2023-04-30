import 'package:bitsgap_test/resources/l10n/generated/l10n.dart';
import 'package:bitsgap_test/src/app/app_messenger.dart';
import 'package:bitsgap_test/src/app/app_router.dart';
import 'package:bitsgap_test/src/app/domain/store/auth_store.dart';
import 'package:bitsgap_test/src/app/extensions/validation_failed_extensions.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStore with _$SignInStore;

abstract class _SignInStore with Store {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthStore _authStore;
  final AppRouter _appRouter;
  final AppMessenger _appMessenger;

  _SignInStore(this._authStore, this._appRouter, this._appMessenger) {
    emailController.addListener(() {
      if (emailController.text.isEmpty) {
        emailWrong = null;
      } else {
        _onEmailEnter(emailController.text);
      }
    });
    passwordController.addListener(() {
      if (passwordController.text.isEmpty) {
        passwordWrong = null;
      } else {
        _onPasswordEnter(passwordController.text);
      }
    });
  }

  @observable
  bool obscurePassword = true;

  @observable
  String? emailWrong;

  @observable
  String? passwordWrong;

  void _onEmailEnter(String value) {
    emailWrong = value.isValidEmail ? null : AppL10n.current.emailWrong;
  }

  void _onPasswordEnter(String value) {
    final isValidPassword = value.trim().isNotEmpty;

    passwordWrong = isValidPassword ? null : AppL10n.current.passwordEmpty;
  }

  void onShowPassword() => obscurePassword = !obscurePassword;

  @action
  Future<void> signIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    _onEmailEnter(email);
    _onPasswordEnter(password);

    if (emailWrong != null || passwordWrong != null) return;

    await _authStore.signIn(email, password);

    if (!_authStore.isSignedIn) {
      _appMessenger.showSnackBar(AppL10n.current.userNotFound);
      return;
    }

    _appRouter.router.go(AppRouter.home);
  }
}
