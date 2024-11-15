import 'package:miyaa/features/login/domain/user.dart';

class LoginState {
  /// Indica si la pantalla esta cargando
  final bool? isLoading;

  /// Indica si ya se hizo una primera validación del formulario
  final bool? firtsValidation;

  final UserResponse? userData;

  /// Inidica si el dispositivo soporta biometricos

  LoginState({
    this.isLoading = false,
    this.firtsValidation = false,
    this.userData,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? firtsValidation,
    UserResponse? userData,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      firtsValidation: firtsValidation ?? this.firtsValidation,
      userData: userData ?? this.userData,
    );
  }
}
