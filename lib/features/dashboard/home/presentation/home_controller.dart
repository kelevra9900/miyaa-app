import 'dart:convert';
import 'dart:developer';

import 'package:background_location/background_location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/secure_storage.dart';
import '../../../announcements/domain/announcement.dart';
import 'home_state.dart';
import '../../profile/data/profile_repository.dart';
import '../../../login/data/login_repository.dart';
import '../../../login/domain/user.dart';
import '../../../../common/network/socket_manager.dart';
import '../../../../common/user_preferences.dart';
import '../../../init/presentation/splash_screen/utils/init_utils.dart';
import '../../../notifications/data/notifications_repository.dart';
import '../data/home_repository.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController({
    required this.loginRepository,
    required this.profileRepository,
    required this.homeRepository,
    required this.notificationsRepository,
  }) : super(HomeState());

  final LoginRepository loginRepository;
  final ProfileRepository profileRepository;
  final HomeRepository homeRepository;
  final NotificationsRepository notificationsRepository;

  Future<void> initData() async {
    setInitLoading(true);
    await getUserData();
    await getAnnouncements();
    setInitLoading(false);
    await getFcmToken();
  }

  // Get fcm token
  Future<void> getFcmToken() async {
    String? fcmToken = await secureStorage.fcmToken;
    String? currentFCMToken = await initUtils.getFcmToken();

    if (fcmToken != currentFCMToken) {
      await setFCMToken(currentFCMToken!);
    }
  }

  Future<void> setFCMToken(String fcmToken) async {
    await secureStorage.setFcmToken(fcmToken);
    await homeRepository.updateFCMToken(fcmToken);
  }

  Future<void> getUserData() async {
    String? currentUser = await secureStorage.userData;
    if (currentUser == null || currentUser.isEmpty) {
      UserResponse userData = await profileRepository.getProfileData();
      state = state.copyWith(userData: userData);
    } else {
      state = state.copyWith(
          userData: UserResponse.fromJson(json.decode(currentUser)));
    }
  }

  void setInitLoadiing(bool value) {
    state = state.copyWith(initLoading: value);
  }

  void setRefreshData(bool value) async {
    state = state.copyWith(refreshData: value);
    await secureStorage.clearUserData();
  }

  void setInitLoading(bool value) {
    state = state.copyWith(initLoading: value);
  }

  void setIdScreenHome(int value) {
    state = state.copyWith(idScreenHome: value);
  }

  void setTracking(bool isActive) {
    state = state.copyWith(activeTracking: isActive);
  }

  Future<void> toggleBackgroundLocationService({required bool activate}) async {
    setInitLoading(true);
    if (activate) {
      await initUtils.setTrackingLocation();
      setTracking(true);
    } else {
      BackgroundLocation.stopLocationService();
      setTracking(false);
    }
    setInitLoading(false);
    log(activate
        ? 'Background location service started'
        : 'Background location service stopped');
  }

  Future<void> startBackgroundLocationService() async {
    if (!state.activeTracking) {
      await toggleBackgroundLocationService(activate: true);
    }
  }

  Future<void> stopBackgroundLocationService() async {
    if (state.activeTracking) {
      await toggleBackgroundLocationService(activate: false);
    }
  }

  Future<AnnouncementResponse> getAnnouncements() async {
    try {
      setInitLoading(true);
      var response = await homeRepository.getAnnouncements();
      if (response.data != null) {
        state = state.copyWith(announcements: response.data);
      } else {
        log("No se recibieron anuncios del backend");
      }
      return response;
    } catch (e) {
      log("Error al cargar anuncios: $e");
      rethrow;
    } finally {
      setInitLoading(false);
    }
  }

  Future<void> sendSOS() async {
    try {
      setInitLoading(true);
      SocketManager().emit('new_alert', {
        'latitude': prefs.latitude,
        'longitude': prefs.longitude,
        'content': 'S.O.S',
      });
      startBackgroundLocationService();
    } catch (e) {
      log("Error al enviar SOS: $e");
      rethrow;
    } finally {
      setInitLoading(false);
    }
  }
}

final homeController = StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController(
    loginRepository: ref.watch(loginRepositoryProvider),
    profileRepository: ref.watch(profileRepositoryProvider),
    homeRepository: ref.watch(homeRepositoryProvider),
    notificationsRepository: ref.watch(notificationsRepositoryProvider),
  );
});
