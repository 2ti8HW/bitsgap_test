import 'dart:async';
import 'dart:developer' as developer;

import 'package:bitsgap_test/app.dart';
import 'package:bitsgap_test/src/app/injection/main_module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() async {
    await MainModule().asyncInit();

    runApp(const BitsgapApp());
  }, _onError);
}

Future<void> _onError(Object error, StackTrace? stackTrace) async {
  if (kDebugMode) {
    developer.log(
      'onError',
      error: error,
      stackTrace: stackTrace,
    );
    return;
  }
}
