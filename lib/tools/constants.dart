import 'package:flutter_flavor/flutter_flavor.dart';

class Constants {
  String domain = FlavorConfig.instance.variables["baseUrl"];
  int timeOtp = FlavorConfig.instance.variables["timeOtp"];
}

final Constants constants = Constants();
