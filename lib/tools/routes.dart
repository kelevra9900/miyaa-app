import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miyaa/features/announcements/presentation/announcement_page.dart';
import 'package:miyaa/features/dashboard/chat/screens/chat_message.dart';
import 'package:miyaa/features/incident/presentation/incident_page.dart';
import 'package:miyaa/features/login/domain/user.dart';
import 'package:miyaa/features/notifications/presentation/home_notifications/home_notifications_page.dart';

import '../features/dashboard/chat/presentation/chat_page.dart';
import '../features/dashboard/dashboard/dashboard_page.dart';
import '../features/dashboard/home/presentation/home_page.dart';
import '../features/init/presentation/loading/loading_page.dart';
import '../features/init/presentation/splash_screen/splash_page.dart';
import '../features/login/presentation/login_page.dart';

class Routes {
  static const String splash = '/splash-screen';
  static const String login = '/login';
  static const String loading = '/loading';
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String chat = '/chat';
  static const String chatRoom = 'chat/:id';
  static const String conversation = '/conversation';
  static const String profile = '/profile';
  static const String notifications = '/notifications';
  static const String settings = '/settings';
  static const String announcements = '/announcements';
  static const String incident = '/incident';
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
      child: const LoadingPage({}),
    ),
  ),
  GoRoute(
    path: Routes.home,
    pageBuilder: (context, state) => page(
      state: state,
      child: const HomePage(),
    ),
  ),
  GoRoute(
    path: Routes.dashboard,
    pageBuilder: (context, state) => page(
      state: state,
      child: const DashboardPage(),
    ),
  ),
  GoRoute(
    path: Routes.chat,
    pageBuilder: (context, state) => page(
      state: state,
      child: const ChatPage(),
    ),
    routes: [
      GoRoute(
        path: Routes.chatRoom,
        builder: (BuildContext context, GoRouterState state) {
          return ChatMessages(
            chatId: state.pathParameters['id'] as String,
            user: state.extra as User,
          );
        },
        name: 'chatRoom',
      ),
    ],
  ),
  GoRoute(
    path: Routes.announcements,
    pageBuilder: (context, state) => page(
      state: state,
      child: const AnnouncementPage(),
    ),
  ),
  GoRoute(
    path: Routes.incident,
    pageBuilder: (context, state) => page(
      state: state,
      child: const IncidentPage(),
    ),
  ),
  GoRoute(
    path: Routes.notifications,
    pageBuilder: (context, state) => page(
      state: state,
      child: const HomeNotificationsPage(),
    ),
  ),
  GoRoute(
    path: Routes.settings,
    pageBuilder: (context, state) => page(
      state: state,
      child: const HomePage(),
    ),
  ),
]);

NoTransitionPage<void> page(
        {required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);
