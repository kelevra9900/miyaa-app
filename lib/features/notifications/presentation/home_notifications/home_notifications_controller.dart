import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miyaa/features/notifications/data/notifications_repository.dart';

import 'home_notifications_state.dart';

class HomeNotificationsController
    extends StateNotifier<HomeNotificationsState> {
  HomeNotificationsController({required this.notificationsRepository})
      : super(HomeNotificationsState());
  final NotificationsRepository notificationsRepository;

  Future<void> getNoifications() async {
    // List<NotificationsResponse> response =
    //     await notificationsRepository.getNotifications();
    // state = state.copyWith(notificationList: response);
  }

  void selectedNotification(int value) {
    state = state.copyWith(selectedNotification: value);
  }
}

final homeNotificationsController = StateNotifierProvider.autoDispose<
    HomeNotificationsController, HomeNotificationsState>((ref) {
  return HomeNotificationsController(
    notificationsRepository: ref.watch(notificationsRepositoryProvider),
  );
});
