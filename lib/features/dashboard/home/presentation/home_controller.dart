import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miyaa/common/secure_storage.dart';
import 'package:miyaa/features/dashboard/home/presentation/home_state.dart';
import 'package:miyaa/features/dashboard/profile/data/profile_repository.dart';
import 'package:miyaa/features/login/data/login_repository.dart';
import 'package:miyaa/features/login/domain/user.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController({
    required this.loginRepository,
    required this.profileRepository,
  }) : super(HomeState());

  final LoginRepository loginRepository;
  final ProfileRepository profileRepository;

  /// Llama a los servicios necesarios para mostrar la información principal de la pantalla inicial
  /// [getUserData] :  llama al servicio de datos de usuario
  /// [getCategories] : llama al servicio que trae las categorias
  /// [getCardSoonData] : llama al servicio que trae las tarjetas de proximos eventos
  /// [getTopClinic] :  LLama al servicio que trae las clinicas mas destacadas
  /// [getTopLaboratories] :  LLama al servicio que trae los laboratorios mas destacados
  Future<void> initData() async {
    state = state.copyWith(initLoading: true);
    await getUserData();

    //await getHistorySearch();
    state = state.copyWith(initLoading: false);
  }

  ///Obtiene la información del usuario
  ///Almacena la información del usuario en el state del home
  Future<void> getUserData() async {
    String? currentUser = await secureStorage.userData;
    if (currentUser == null || currentUser == "") {
      UserResponse userData = await profileRepository.getProfileData();
      state = state.copyWith(userData: userData);
    } else {
      state = state.copyWith(
          userData: UserResponse.fromJson(json.decode(currentUser)));
    }
  }

  ///Dado un estado de refrescar información
  ///Actualiza los datos ya almacenados en el state del home
  void setRefreshData(bool value) {
    state = state.copyWith(refreshData: value);
  }

  ///Dado un valor del estado de carga [value]
  ///Almacena el estado de carga de la pantalla del home
  void setInitLoadiing(bool value) {
    state = state.copyWith(initLoading: value);
  }

  void setIdScreenHome(int value) {
    state = state.copyWith(idScreenHome: value);
  }
}

final homeController = StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController(
    loginRepository: ref.watch(loginRepositoryProvider),
    profileRepository: ref.watch(profileRepositoryProvider),
  );
});
