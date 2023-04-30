import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final InputDecoration decoration;
  final bool obscureText;

  const AppTextField({
    super.key,
    this.controller,
    this.decoration = const InputDecoration(),
    this.maxLines,
    this.minLines,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 1,
      decoration: decoration,
      obscureText: obscureText,
    );
  }
}
