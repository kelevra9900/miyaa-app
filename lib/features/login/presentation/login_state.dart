class LoginState {
  /// Indica si la pantalla esta cargando
  final bool? isLoading;

  /// Indica si ya se hizo una primera validación del formulario
  final bool? firtsValidation;

  /// Inidica si el dispositivo soporta biometricos

  LoginState({
    this.isLoading = false,
    this.firtsValidation = false,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? firtsValidation,
  }) {
    return LoginState(
        isLoading: isLoading ?? this.isLoading,
        firtsValidation: firtsValidation ?? this.firtsValidation);
  }
}
