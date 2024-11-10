import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/init/presentation/splash_screen/splash_page.dart';
import '../features/login/presentation/login_page.dart';

class Routes {
  static const String splash = '/splash-screen';
  static const String login = '/login';
  static const String loading = '/loading';
  static const String home = '/home';
}

final router = GoRouter(initialLocation: Routes.splash, routes: [
  GoRoute(
    path: Routes.splash,
    pageBuilder: (context, state) => page(
      state: state,
      child: const SplashScreenPage(),
    ),
  ),
  GoRoute(
    path: Routes.login,
    pageBuilder: (context, state) => page(
      state: state,
      child: const LoginPage(),
    ),
  ),
  GoRoute(
    path: Routes.loading,
    pageBuilder: (context, state) => page(
      state: state,
      child: const SplashScreenPage(),
    ),
  ),
  GoRoute(
    path: Routes.home,
    pageBuilder: (context, state) => page(
      state: state,
      child: const SplashScreenPage(),
    ),
  ),
]);

NoTransitionPage<void> page(
        {required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);
