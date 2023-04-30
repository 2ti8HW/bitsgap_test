import 'package:bitsgap_test/resources/l10n/generated/l10n.dart';
import 'package:bitsgap_test/src/features/auth/domain/sign_up_store.dart';
import 'package:bitsgap_test/src/features/auth/widgets/email_field.dart';
import 'package:bitsgap_test/src/features/auth/widgets/password_field.dart';
import 'package:bitsgap_test/src/features/auth/widgets/username_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignUp extends StatelessWidget {
  final SignUpStore store;

  const SignUp(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Observer(builder: (context) {
            return EmailField(
              controller: store.emailController,
              errorText: store.emailWrong,
            );
          }),
          const SizedBox(height: 12),
          Observer(builder: (context) {
            return UserNameField(
              controller: store.usernameController,
              errorText: store.userNameWrong,
            );
          }),
          const SizedBox(height: 12),
          Observer(builder: (context) {
            return PasswordField(
              controller: store.passwordController,
              onTapSuffix: store.onShowPassword,
              obscureText: store.obscurePassword,
              errorText: store.passwordWrong,
            );
          }),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: store.signUp,
              child: Text(AppL10n.of(context).buttonSignUp),
            ),
          ),
        ],
      ),
    );
  }
}
