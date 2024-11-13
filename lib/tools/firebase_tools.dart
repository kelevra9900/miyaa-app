import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseTool {
  static final FirebaseTool _instance = FirebaseTool._internal();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  factory FirebaseTool() {
    return _instance;
  }

  FirebaseTool._internal();

  Future<void> initFirebase() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await _firebaseMessaging.subscribeToTopic('all');
  }

  // Get fcm token
  Future<String?> getFCMToken() async {
    return await _firebaseMessaging.getToken();
  }
}
