abstract class NotificationService {
  Future<void> initialize();
  Future<String?> getToken();
  Stream<String> get onTokenRefresh;
}
