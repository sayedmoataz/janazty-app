/// Abstract service for local storage operations
abstract class StorageService {
  /// Save a funeral ID as prayed
  Future<bool> savePrayedFuneral(String funeralId);

  /// Check if user has prayed for a specific funeral
  Future<bool> hasPrayedForFuneral(String funeralId);

  /// Get all prayed funeral IDs
  Future<Set<String>> getPrayedFunerals();

  /// Clear all prayed funerals (for testing/debugging)
  Future<bool> clearPrayedFunerals();

  /// Save a funeral ID as reported
  Future<bool> saveReportedFuneral(String funeralId);

  /// Check if user has reported a specific funeral
  Future<bool> hasReportedFuneral(String funeralId);

  /// Get all reported funeral IDs
  Future<Set<String>> getReportedFunerals();

  /// Clear all reported funerals (for testing/debugging)
  Future<bool> clearReportedFunerals();
}
