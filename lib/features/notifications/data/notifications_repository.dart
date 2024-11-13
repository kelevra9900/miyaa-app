import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:miyaa/features/notifications/domain/notification.dart';

import '../../../common/network/network_service.dart';

class NotificationsRepository {
  final http.Client client;

  NotificationsRepository({required this.client});

  Future<NotificationResponse> getNotifications() async {
    try {
      var response = await httpService.get(
        endpoint: '/users/me/notifications',
      );
      var decoded = json.decode(response.body!);

      return NotificationResponse.fromJson(decoded);
    } catch (e) {
      rethrow;
    }
  }

  // Update only fcm token for the user
  Future<void> updateFcmToken(String fcmToken) async {
    try {
      var response = await httpService.patch(
        endpoint: '/user/fcm',
        body: {"fcmToken": fcmToken},
        client: client,
      );

      if (response.success == true) {
        return;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateNotificationSettings(Map<String, bool> settings) async {
    try {
      var response = await httpService.post(
        endpoint: '/notifications/subscribe/topics',
        body: {"settings": json.encode(settings)},
        client: client,
      );

      if (response.success == true) {
        return;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateNotificationRead(String idNotification) async {
    try {
      var response = await httpService.put(
        endpoint: '/notifications/$idNotification/read',
        body: {},
        client: client,
      );

      if (response.success == true) {
        return;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteNotification(String idNotification) async {
    try {
      var response = await httpService.delete(
        endpoint: '/notifications/$idNotification',
        client: client,
      );

      if (response.success == true) {
        return;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }
}

final notificationsRepositoryProvider = Provider<NotificationsRepository>(
  (ref) => NotificationsRepository(client: http.Client()),
);
