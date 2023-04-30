import 'package:bitsgap_test/resources/l10n/generated/l10n.dart';
import 'package:bitsgap_test/src/app/app_router.dart';
import 'package:bitsgap_test/src/app/app_theme.dart';
import 'package:bitsgap_test/src/app/injection/main_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BitsgapApp extends StatefulWidget {
  const BitsgapApp({super.key});

  @override
  State<BitsgapApp> createState() => _BitsgapAppState();
}

class _BitsgapAppState extends State<BitsgapApp> {
  late final _appRouter = MainModule().get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.router,
      scaffoldMessengerKey: _appRouter.scaffoldMessengerKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppL10n.delegate
      ],
      supportedLocales: AppL10n.delegate.supportedLocales,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}
