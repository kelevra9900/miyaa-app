import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dashboard_state.dart';

class DashboardController extends StateNotifier<DashboardState> {
  DashboardController() : super(DashboardState());

  ///Dado un id de pantalla [idScreen]
  ///[0: Home, 1: Calendario, 2: Listas, 3: perfil, 4: Servicios medicos]
  ///Almacena el vaalor del id pantalla actual para mostrar la pantalla correspondiente
  Future<void> setCurrentScreen(int idScreen) async {
    state = state.copyWith(
        currentScreen: idScreen,
        viewMenuButtons: idScreen != 3 && idScreen != 4);
  }

  /// Dado un valor de estado de carga [loading]
  /// Almacena el valor en el state para mostrar el widget de cargar
  void setInitLoading(bool loading) {
    state = state.copyWith(initLoading: loading);
  }

  /// Dado un estado de visualización [value]
  /// Almacena el valor en el state para mostrar los botones del menu principal
  void setViewMenuButtons(bool value) {
    state = state.copyWith(viewMenuButtons: value);
  }
}

final dashboardController =
    StateNotifierProvider<DashboardController, DashboardState>((ref) {
  return DashboardController();
});
