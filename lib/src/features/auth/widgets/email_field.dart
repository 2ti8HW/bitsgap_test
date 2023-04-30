import 'package:bitsgap_test/resources/l10n/generated/l10n.dart';
import 'package:bitsgap_test/src/uikit/app_text_field.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorText;

  const EmailField({
    super.key,
    this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      minLines: 1,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: AppL10n.of(context).emailFieldHint,
        errorText: errorText,
      ),
    );
  }
}
