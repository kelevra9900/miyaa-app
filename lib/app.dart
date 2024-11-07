import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:theme_manager/theme_manager.dart';

import 'common/local_notifications/local_notifications.dart';
import 'common/secure_storage.dart';
import 'common/user_preferences.dart';
import 'tools/routes.dart';
import 'tools/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await getDeviceValues(context);
    });
    super.initState();
  }

  Future<void> getDeviceValues(BuildContext context) async {
    bool isFristRun = await IsFirstRun.isFirstRun();
    prefs.isFirtsRun = isFristRun;
    if (isFristRun) {
      if (!context.mounted) return;
      Brightness brightness = MediaQuery.of(context).platformBrightness;
      prefs.isDarkMode = brightness == Brightness.dark ? true : false;
    }
    notificationsPush();
  }

  notificationsPush() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? tokenNotification = await firebaseMessaging.getToken();
    saveTokenNotitication(tokenNotification ?? "");
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        log(message.notification!.title.toString());
        log(message.notification!.body.toString());
        localNotifications.showNotification(message, context);
      }
    });

    FirebaseMessaging.onMessage.listen((message) {
      log(message.notification!.title.toString());
      log(message.notification!.body.toString());
      localNotifications.showNotification(message, context);
    });

    ///App abierta y en modo backgroud
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleNotification(message);
    });

    /// App Cerrada
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      handleNotification(message);
    });
  }

  ///Redirección del app cerrada.
  void handleNotification(RemoteMessage message) {
    log(message.toString());
  }

  void saveTokenNotitication(String token) async {
    //TODO: CONFIGURAR EL GUARDADO DEL TOKEN
    log("token notificaciones $token");
    secureStorage.setTokenNotification(token);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      defaultBrightnessPreference: BrightnessPreference.dark,
      data: (Brightness brightness) =>
          prefs.isDarkMode ? CustomTheme().darkTheme : CustomTheme().ligthTheme,
      themeChangeListener: (ThemeState state) {
        debugPrint('ThemeState: ${state.brightnessPreference}');
      },
      themedBuilder: (BuildContext context, ThemeState state) {
        return ResponsiveApp(
          builder: (context) => ScreenUtilInit(
            designSize: const Size(360, 760),
            rebuildFactor: RebuildFactors.change,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'miyaa',
              theme: state.themeData,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              routeInformationProvider: router.routeInformationProvider,
            ),
          ),
        );
      },
    );
  }
}
