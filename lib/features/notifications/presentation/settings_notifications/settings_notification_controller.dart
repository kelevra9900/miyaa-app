import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miyaa/features/notifications/data/notifications_repository.dart';
import 'package:miyaa/features/notifications/presentation/settings_notifications/settings_notification_state.dart';

class SettingsNotificationController
    extends StateNotifier<SettingsNotificationState> {
  SettingsNotificationController({required this.notificationsRepository})
      : super(SettingsNotificationState());

  final NotificationsRepository notificationsRepository;

  void initData() {
    setViewButtons();
  }

  Future<void> updateNotificationSettings() async {
    Map<String, bool> settings = {
      'promotions': state.promotions,
      'ongoingTreatments': state.ongoingTreatments,
      'dailyDoses': state.dailyDoses,
      'upcomingAppointments': state.upcomingAppointments,
      'cancelledAppointments': state.cancelledAppointments,
      'rescheduledAppointments': state.rescheduledAppointments,
      'liveChat': state.liveChat,
      'messages': state.messages,
    };
    await notificationsRepository.updateNotificationSettings(settings);
  }

  Future<void> resetSettings() async {
    state = state.copyWith(
      promotions: true,
      ongoingTreatments: true,
      dailyDoses: true,
      upcomingAppointments: true,
      cancelledAppointments: true,
      rescheduledAppointments: true,
      liveChat: true,
      messages: true,
      resetValues: true,
    );
    await updateNotificationSettings();
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void setViewButtons() {
    if (state.promotions == true &&
        state.ongoingTreatments == true &&
        state.dailyDoses == true &&
        state.upcomingAppointments == true &&
        state.cancelledAppointments == true &&
        state.rescheduledAppointments == true &&
        state.liveChat == true &&
        state.messages == true) {
      state = state.copyWith(viewButtons: false);
    } else {
      state = state.copyWith(viewButtons: true);
    }
  }
}

final settingsNotificationController = StateNotifierProvider<
    SettingsNotificationController, SettingsNotificationState>((ref) {
  return SettingsNotificationController(
    notificationsRepository: ref.watch(notificationsRepositoryProvider),
  );
});
