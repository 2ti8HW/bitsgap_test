import 'package:flutter/material.dart';

class AppMessenger {
  static const _duration = Duration(milliseconds: 4000);
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

  AppMessenger(this._scaffoldMessengerKey);

  void showSnackBar(
    String message, {
    String? actionLabel,
    VoidCallback? actionOnPressed,
    Duration? duration,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: duration ?? _duration,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      action: (actionLabel != null && actionOnPressed != null)
          ? SnackBarAction(
              label: actionLabel,
              onPressed: actionOnPressed,
            )
          : null,
    );

    _scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
