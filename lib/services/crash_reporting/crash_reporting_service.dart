abstract class CrashReportingService {
  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    dynamic reason,
  });
  Future<void> log(String message);
  Future<void> setCustomKey(String key, dynamic value);
}
