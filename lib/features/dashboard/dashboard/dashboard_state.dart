class DashboardState {
  /// Id de la pantalla actual
  final int? currentScreen;

  /// Estado de carga de la pantalla
  final bool? initLoading;

  /// Habilita los botones del menú inferior
  final bool? viewMenuButtons;

  DashboardState({
    this.currentScreen = 0,
    this.initLoading = true,
    this.viewMenuButtons = true,
  });

  DashboardState copyWith({
    int? currentScreen,
    bool? initLoading,
    bool? viewMenuButtons,
  }) {
    return DashboardState(
      currentScreen: currentScreen ?? this.currentScreen,
      initLoading: initLoading ?? this.initLoading,
      viewMenuButtons: viewMenuButtons ?? this.viewMenuButtons,
    );
  }
}
