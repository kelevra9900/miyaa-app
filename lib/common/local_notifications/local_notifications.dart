import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initialize(RemoteMessage message, context) async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("app_icon"),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        defaultPresentAlert: true,
        defaultPresentBadge: true,
      ),
    );
    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (detail) {
        //_openDocumentsDirectory(message, context);
      },
    );
  }

  ///Método que permite visualizar la notificación
  Future<void> showNotification(RemoteMessage message, context) async {
    try {
      await initialize(message, context);
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotification",
          "pushnotification",
          importance: Importance.max,
          priority: Priority.max,
          fullScreenIntent: true,
          enableVibration: true,
          channelShowBadge: true,
          enableLights: true,
          color: Colors.red,
          showProgress: true,
          playSound: true,
          visibility: NotificationVisibility.public,
        ),
        iOS: DarwinNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          badgeNumber: 1,
        ),
      );
      await _notificationsPlugin.show(
        id,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}

LocalNotifications localNotifications = LocalNotifications();
