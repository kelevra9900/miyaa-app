// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:miyaa/common/secure_storage.dart';
import 'package:miyaa/tools/custom_dialogs.dart';
import 'package:miyaa/tools/models/modal_dynamic_data.dart';
import 'package:miyaa/tools/routes.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../common/network/socket_manager.dart';
import '../../../../../common/user_preferences.dart';

Future<void> backgroundNotificationHandler(RemoteMessage message) async {
  log('onBackgroundMessage: ${message.messageId}');
}

class InitUtils {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Timer? _locationTimer;

  goToNextPage({required BuildContext context}) {
    Timer(const Duration(seconds: 1), () async {
      bool isLoggedIn = await secureStorage.isLoggedIn();

      if (!context.mounted) return;
      if (prefs.isFirtsRun) {
        context.go(Routes.splash);
      } else {
        if (isLoggedIn) {
          context.go(Routes.login);
        } else {
          // context.go(Routes.home);
        }
      }
    });
  }

  Future<void> requestNotificationPermissions(BuildContext context) async {
    var status = await Permission.notification.request();
    if (status.isGranted) {
      var backgroundStatus = await Permission.notification.request();
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        log('onMessage received: ${message.data}');
        showFlutterNotificationFromMessage(message);
      });
      if (!backgroundStatus.isGranted) {
        FlutterLocalNotificationsPlugin().show(
          0,
          'Permisos de notificaciones',
          'Es necesario que otorgues permisos de notificaciones',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'General',
              'trablisa',
              channelDescription: 'General notifications channel',
              importance: Importance.max,
              priority: Priority.high,
              showWhen: false,
            ),
          ),
        );
      }

      if (status.isGranted) {
        await initializeNotifications(context);
      }
    } else if (status.isDenied || status.isPermanentlyDenied) {
      log('Notification permissions are denied');
    }
  }

  /// Dado el contexto de la aplicación [context]
  /// Determina la posición actual del dispositivo del usuario y gestiona los permisos de ubicación si es necesario.
  /// Retorna una instacia de [Position] con la información de la localizacion actual
  Future<Position> determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        dialogs.showMessageYesNoDialog(
          context,
          data: ModalDinamicData(
            title: 'Atención',
            labelButtonNo: 'Cancelar',
            labelButtonYes: 'Aceptar',
            subtitle: 'Para continuar necesitamos acceder a tu ubicación.',
            onPressedYes: () async {
              Navigator.pop(context);
              await determinePosition(context);
              context.go(Routes.loading, extra: {"nextRoute": Routes.splash});
            },
          ),
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      dialogs.showMessageDialog(
        context,
        data: ModalDinamicData(
          title: 'Atención',
          subtitle:
              'Si no aceptas los permisos de ubicación no podrás acceder a toda la información disponible en nuestra app.',
        ),
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  /// Dado el contexto de la aplicacion [context]
  /// Obtiene la ubicación geográfica actual del dispositivo del usuario y la guarda en las preferencias del usuario.
  /// No retorna nada
  Future<void> getCurrentLocation(BuildContext context) async {
    Position position = await determinePosition(context);
    prefs.latitude = position.latitude.toString();
    prefs.longitude = position.longitude.toString();
    log("latitude: ${prefs.latitude}");
    log("longitude: ${prefs.longitude}");
  }

  Future<void> setTrackingLocation() async {
    const settings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    Geolocator.getPositionStream(locationSettings: settings).listen((pos) {
      log("new location ======= ${pos.latitude}, ${pos.longitude}");
      SocketManager().emit('new_location', {
        'latitude': pos.latitude,
        'longitude': pos.longitude,
      });
      if (_locationTimer == null || !_locationTimer!.isActive) {
        _startLocationTimer(pos.latitude, pos.longitude);
      }
    });
  }

  void _startLocationTimer(double latitude, double longitude) {
    _locationTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      log('Location updated: $latitude, $longitude');
      saveLocationHistorically(latitude, longitude);
    });
  }

  Future<void> saveLocationHistorically(
    double latitude,
    double longitude,
  ) async {
    SocketManager().emit('save_location', {
      'latitude': latitude,
      'longitude': longitude,
    });
    log('Location saved historically: $latitude, $longitude');
  }

  void configureNotificationClick(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // _handleNotificationClick(message, context);
    });
  }

  Future<void> initializeNotifications(BuildContext context) async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        log('On Notification tapped: ${details.payload}');
        _handleNotificationClick(details, context);
      },
    );
    FirebaseMessaging.onBackgroundMessage(backgroundNotificationHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('onMessage received =================: ${message.data}');
    });
  }

  void showFlutterNotificationFromMessage(RemoteMessage message) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'General',
      'trablisa',
      channelDescription: 'General notifications channel',
      importance: Importance.max,
      priority: Priority.max,
      vibrationPattern: Int64List.fromList([0, 1000, 500, 1000]),
      playSound: true,
      enableVibration: true,
    );

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    log('Notification received: ${message.data}');

    await flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.notification?.title ?? 'Título predeterminado',
      message.notification?.body ?? 'Cuerpo de notificación predeterminado',
      platformChannelSpecifics,
      payload: jsonEncode(message.data),
    );
  }

  void _handleNotificationClick(
      NotificationResponse message, BuildContext context) {
    final notificationData = message.payload;

    log('Notification tapped: $notificationData');
    if (notificationData != null) {
      final data = jsonDecode(notificationData);
      String route = data['route'];
      context.push(route);
    }
  }

  Future<void> getPermissionsNotifications(BuildContext context) async {
    final NotificationSettings settings =
        await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    log('User granted permission: ${settings.authorizationStatus}');

    void handleToken(String? token) {
      if (token != null) {
        prefs.fcmToken = token;
      }
    }

    switch (settings.authorizationStatus) {
      case AuthorizationStatus.authorized:
      case AuthorizationStatus.provisional:
      case AuthorizationStatus.notDetermined:
        final token = await firebaseMessaging.getToken();
        handleToken(token);
        log('User granted permission');
        break;
      case AuthorizationStatus.denied:
        log('User denied permission');
        break;
      default:
        log('Unhandled authorization status: ${settings.authorizationStatus}');
    }

    firebaseMessaging.onTokenRefresh.listen((String token) {
      log('Token: $token');
      handleToken(token);
    });
  }

  Future<String?> getFcmToken() async {
    return await firebaseMessaging.getToken();
  }
}

InitUtils initUtils = InitUtils();
