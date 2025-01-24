import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miyaa/firebase_options.dart';
import 'common/custom_colors.dart';
import 'common/secure_storage.dart';

import 'app.dart';
import 'common/user_preferences.dart';

// al mandar reporte de incidente
Future<void> main() async {
  FlavorConfig(
    name: "DEV",
    variables: {
      "baseUrl": "https://miyaa-v1-e224e7c85f0e.herokuapp.com",
      "timeOtp": 300
    },
  );

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await prefs.initPrefs();
  await secureStorage.initStorage();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: lightColors.primaryColor,
  ));
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
