import 'package:firebase_messaging/firebase_messaging.dart';

import 'notification_service.dart';

class FirebaseNotificationService implements NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  @override
  Future<void> initialize() async {
    await _messaging.requestPermission();
  }

  @override
  Future<String?> getToken() => _messaging.getToken();

  @override
  Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;
}
