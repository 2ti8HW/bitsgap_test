import 'package:bitsgap_test/resources/l10n/generated/l10n.dart';
import 'package:bitsgap_test/src/app/app_messenger.dart';
import 'package:bitsgap_test/src/app/app_router.dart';
import 'package:bitsgap_test/src/app/domain/store/auth_store.dart';
import 'package:bitsgap_test/src/app/extensions/validation_failed_extensions.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthStore _authStore;
  final AppRouter _appRouter;
  final AppMessenger _appMessenger;

  _SignUpStore(this._authStore, this._appRouter, this._appMessenger) {
    emailController.addListener(() {
      _onEmailEnter(emailController.text);
    });
    usernameController.addListener(() {
      _onUserNameEnter(usernameController.text);
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
  String? userNameWrong;

  @observable
  String? passwordWrong;

  void _onEmailEnter(String value) {
    if (value.isEmpty) {
      emailWrong = null;
      return;
    }

    emailWrong = value.isValidEmail ? null : AppL10n.current.emailWrong;
  }

  void _onUserNameEnter(String value) {
    if (value.isEmpty) {
      userNameWrong = null;
      return;
    }

    userNameWrong =
        value.isValidUserName ? null : AppL10n.current.userNameWrong;
  }

  void _onPasswordEnter(String value) {
    if (value.isEmpty) {
      passwordWrong = null;
      return;
    }

    passwordWrong = value.isValidPassword
        ? null
        : AppL10n.current.passwordWrong(
            ValidationFailedExtensions.defaultPasswordLength,
          );
  }

  void onShowPassword() => obscurePassword = !obscurePassword;

  @action
  Future<void> signUp() async {
    final email = emailController.text.trim();
    final userName = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty) {
      emailWrong = AppL10n.current.emailEmpty;
    }
    if (userName.isEmpty) {
      userNameWrong = AppL10n.current.userNameWrong;
    }
    if (password.isEmpty) {
      passwordWrong = AppL10n.current.passwordEmpty;
    }

    if (emailWrong != null || userNameWrong != null || passwordWrong != null) {
      return;
    }

    final user = await _authStore.signUp(email, password, userName);
    if (user == null) {
      _appMessenger.showSnackBar(AppL10n.current.userAlreadyExists);
      return;
    }

    await _authStore.signIn(email, password);

    _appRouter.router.go(AppRouter.home);
  }
}
