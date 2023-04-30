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
      if (emailController.text.isEmpty) {
        emailWrong = null;
      } else {
        _onEmailEnter(emailController.text);
      }
    });
    usernameController.addListener(() {
      if (usernameController.text.isEmpty) {
        userNameWrong = null;
      } else {
        _onUserNameEnter(usernameController.text);
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
  String? userNameWrong;

  @observable
  String? passwordWrong;

  void _onEmailEnter(String value) {
    emailWrong = value.isValidEmail ? null : AppL10n.current.emailWrong;
  }

  void _onUserNameEnter(String value) {
    userNameWrong =
        value.isValidUserName ? null : AppL10n.current.userNameWrong;
  }

  void _onPasswordEnter(String value) {
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

    _onEmailEnter(email);
    _onUserNameEnter(userName);
    _onPasswordEnter(password);

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
