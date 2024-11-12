import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miyaa/common/secure_storage.dart';

import 'app.dart';
import 'common/firebase/firebase_options.dart';
import 'common/user_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer';

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("Background message received: ${message.messageId}");
}

Future<void> main() async {
  FlavorConfig(
    name: "PROD",
    variables: {
      "baseUrl": "http://10.0.2.2:3000",
      "timeOtp": 60,
    },
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await prefs.initPrefs();
  await secureStorage.initStorage();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

  runApp(const ProviderScope(child: App()));
}
