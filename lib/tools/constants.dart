import 'package:flutter_flavor/flutter_flavor.dart';

///
/// Esta clase contiene todos los valores constantes en la aplicación
///

class Constants {
  String domain = FlavorConfig.instance.variables["baseUrl"];
  String appName = 'Trablisa';
  String photoProfile =
      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  String lottieNfc = 'assets/lottie/nfc.json';
  String logo = 'assets/images/logo.png';
  bool isIOS = true;
}

final Constants constants = Constants();
