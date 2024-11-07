class LocalAuthService {
  SupportState supportState = SupportState.unknown;
  bool? canCheckBiometrics;
  String authorized = 'Not Authorized';
  bool isAuthenticating = false;
}

LocalAuthService localAuthService = LocalAuthService();

enum SupportState {
  unknown,
  supported,
  unsupported,
}
