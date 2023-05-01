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
      _onEmailEnter(emailController.text);
    });
    passwordController.addListener(() {
      _onPasswordEnter(passwordController.text);
    });
  }

  @observable
  bool obscurePassword = true;

  @observable
  String? emailWrong;

  @observable
  String? passwordWrong;

  void _onEmailEnter(String value) {
    if (value.isEmpty) {
      emailWrong = null;
      return;
    }

    emailWrong = value.isValidEmail ? null : AppL10n.current.emailWrong;
  }

  void _onPasswordEnter(String value) {
    if (value.isEmpty) {
      passwordWrong = null;
      return;
    }

    final isValidPassword = value.trim().isNotEmpty;

    passwordWrong = isValidPassword ? null : AppL10n.current.passwordEmpty;
  }

  void onShowPassword() => obscurePassword = !obscurePassword;

  @action
  Future<void> signIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty) {
      emailWrong = AppL10n.current.emailEmpty;
    }
    if (password.isEmpty) {
      passwordWrong = AppL10n.current.passwordEmpty;
    }

    if (emailWrong != null || passwordWrong != null) return;

    await _authStore.signIn(email, password);

    if (!_authStore.isSignedIn) {
      _appMessenger.showSnackBar(AppL10n.current.userNotFound);
      return;
    }

    _appRouter.router.go(AppRouter.home);
  }
}
