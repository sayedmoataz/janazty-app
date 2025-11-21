import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'crash_reporting_service.dart';

class FirebaseCrashReportingService implements CrashReportingService {
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  @override
  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    dynamic reason,
  }) async {
    await _crashlytics.recordError(exception, stack, reason: reason);
  }

  @override
  Future<void> log(String message) async {
    await _crashlytics.log(message);
  }

  @override
  Future<void> setCustomKey(String key, dynamic value) async {
    if (value is String) {
      await _crashlytics.setCustomKey(key, value);
    } else if (value is int) {
      await _crashlytics.setCustomKey(key, value);
    } else if (value is double) {
      await _crashlytics.setCustomKey(key, value);
    } else if (value is bool) {
      await _crashlytics.setCustomKey(key, value);
    }
  }
}
