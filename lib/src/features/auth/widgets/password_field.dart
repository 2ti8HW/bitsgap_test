import 'package:bitsgap_test/resources/l10n/generated/l10n.dart';
import 'package:bitsgap_test/src/uikit/app_text_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onTapSuffix;
  final bool obscureText;
  final String? errorText;

  const PasswordField({
    super.key,
    this.controller,
    this.onTapSuffix,
    this.obscureText = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      minLines: 1,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: AppL10n.of(context).passwordFieldHint,
        errorText: errorText,
        suffixIcon: GestureDetector(
          onTap: onTapSuffix,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
