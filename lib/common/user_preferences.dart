import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instancia = UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal() {
    initPrefs();
  }

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool get isFirtsRun {
    return _prefs.getBool('isFirtsRun') ?? true;
  }

  set isFirtsRun(bool value) {
    _prefs.setBool('isFirtsRun', value);
  }

  // GET y SET del codigo del lenguaje
  String get languageCode {
    return _prefs.getString('languageCode') ?? 'en';
  }

  set languageCode(String value) {
    _prefs.setString('languageCode', value);
  }

  // GET y SET de datos del usuario
  bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? false;
  }

  set isDarkMode(bool value) {
    _prefs.setBool('isDarkMode', value);
  }

  String get emailUser {
    return _prefs.getString('emailUser') ?? "";
  }

  set emailUser(String value) {
    _prefs.setString('emailUser', value);
  }

  String get latitude {
    return _prefs.getString('latitude') ?? "";
  }

  set latitude(String value) {
    _prefs.setString('latitude', value);
  }

  String get longitude {
    return _prefs.getString('longitude') ?? "";
  }

  set longitude(String value) {
    _prefs.setString('longitude', value);
  }

  int get currentScreenDashboard {
    return _prefs.getInt('currentScreenDashboard') ?? 0;
  }

  set currentScreenDashboard(int value) {
    _prefs.setInt('currentScreenDashboard', value);
  }

  String get fcmToken {
    return _prefs.getString('fcmToken') ?? "";
  }

  set fcmToken(String value) {
    _prefs.setString('fcmToken', value);
  }
}

final UserPreferences prefs = UserPreferences();
