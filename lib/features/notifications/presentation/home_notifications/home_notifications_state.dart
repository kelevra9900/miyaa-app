import 'package:miyaa/features/notifications/domain/notification.dart';

class HomeNotificationsState {
  final List<NotificationResponse>? notificationList;

  final int selectedNotification;

  HomeNotificationsState({
    this.notificationList,
    this.selectedNotification = 0,
  });

  HomeNotificationsState copyWith({
    List<NotificationResponse>? notificationList,
    List<NotificationData>? notificationList2,
    int? selectedNotification,
  }) {
    return HomeNotificationsState(
        notificationList: notificationList ?? this.notificationList,
        selectedNotification:
            selectedNotification ?? this.selectedNotification);
  }
}
