import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'common/firebase/firebase_options.dart';
import 'common/user_preferences.dart';

Future<void> main() async {
  FlavorConfig(
    name: "PROD",
    variables: {
      "baseUrl": "",
      "timeOtp": 60,
    },
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await prefs.initPrefs();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const ProviderScope(child: App()));
}
