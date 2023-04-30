import 'package:bitsgap_test/resources/l10n/generated/l10n.dart';
import 'package:bitsgap_test/src/features/auth/domain/auth_page_store.dart';
import 'package:bitsgap_test/src/features/auth/widgets/sign_in.dart';
import 'package:bitsgap_test/src/features/auth/widgets/sign_up.dart';
import 'package:flutter/material.dart';

abstract class AuthPageType {
  String get label;

  Widget build(AuthPageStore store);

  static const AuthPageType signIn = _SignIn();
  static const AuthPageType signUp = _SignUp();
}

class _SignIn implements AuthPageType {
  const _SignIn();

  @override
  String get label => AppL10n.current.buttonSignIn;

  @override
  Widget build(AuthPageStore store) => SignIn(store.signInStore);
}

class _SignUp implements AuthPageType {
  const _SignUp();

  @override
  String get label => AppL10n.current.buttonSignUp;

  @override
  Widget build(AuthPageStore store) => SignUp(store.signUpStore);
}
