import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/secure_storage.dart';

import 'app.dart';
import 'common/user_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  FlavorConfig(
    name: "PROD",
    variables: {
      "baseUrl": "https://miyaa-v1-e224e7c85f0e.herokuapp.com",
      "timeOtp": 300,
    },
  );

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await prefs.initPrefs();
  await secureStorage.initStorage();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
