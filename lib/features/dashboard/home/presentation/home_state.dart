import 'package:miyaa/features/login/domain/user.dart';

class HomeState {
  ///Indica si la pantalla esta en modo cargando
  final bool? initLoading;

  ///Inica si al volver a la pantalla necesitamos volver a consultar información al servidor en caso de actualizaciones
  final bool? refreshData;

  /// Datos del usuario
  final UserResponse? userData;

  final int? idScreenHome;

  HomeState({
    this.initLoading = true,
    this.refreshData = true,
    this.userData,
    this.idScreenHome = 0,
  });

  HomeState copyWith({
    bool? initLoading,
    bool? refreshData,
    UserResponse? userData,
    int? idScreenHome,
    T,
  }) {
    return HomeState(
      initLoading: initLoading ?? this.initLoading,
      refreshData: refreshData ?? this.refreshData,
      userData: userData ?? this.userData,
      idScreenHome: idScreenHome ?? this.idScreenHome,
    );
  }
}
