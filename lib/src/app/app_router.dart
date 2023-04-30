import 'package:bitsgap_test/src/app/domain/store/auth_store.dart';
import 'package:bitsgap_test/src/app/injection/main_module.dart';
import 'package:bitsgap_test/src/features/auth/auth_page.dart';
import 'package:bitsgap_test/src/features/auth/domain/auth_page_store.dart';
import 'package:bitsgap_test/src/features/home/domain/home_page_store.dart';
import 'package:bitsgap_test/src/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String home = '/';
  static const String auth = '/auth';
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final GoRouter router = GoRouter(
    // you can add a splash screen
    // or a screen with animation for the time we check authorization
    initialLocation: MainModule().get<AuthStore>().isSignedIn ? null : auth,
    routes: <GoRoute>[
      GoRoute(
        path: home,
        builder: (context, state) => HomePage(
          store: MainModule().get<HomePageStore>(),
        ),
      ),
      GoRoute(
        path: auth,
        builder: (context, state) => AuthPage(
          store: MainModule().get<AuthPageStore>(),
        ),
      ),
    ],
  );
}

extension AppRouterHelper on BuildContext {
  GoRouter? get instagridRouter => GoRouter.of(this);
}
