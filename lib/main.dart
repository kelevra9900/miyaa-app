import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'common/secure_storage.dart';

import 'common/firebase/firebase_options.dart';
import 'common/user_preferences.dart';

Future<void> main() async {
  FlavorConfig(
    name: "DEV",
    variables: {
      "baseUrl": "https://backstaging.doctorsnet.mx",
      "timeOtp": 300,
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
  runApp(const ProviderScope(child: App()));
}
