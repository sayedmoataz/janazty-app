import 'package:shared_preferences/shared_preferences.dart';

import 'storage_service.dart';

/// Implementation of [StorageService] using SharedPreferences
class SharedPreferencesStorageService implements StorageService {
  final SharedPreferences _prefs;

  static const String _prayedFuneralsKey = 'prayed_funerals';
  static const String _reportedFuneralsKey = 'reported_funerals';

  SharedPreferencesStorageService(this._prefs);

  @override
  Future<bool> savePrayedFuneral(String funeralId) async {
    final prayedFunerals = await getPrayedFunerals();
    prayedFunerals.add(funeralId);
    return _prefs.setStringList(_prayedFuneralsKey, prayedFunerals.toList());
  }

  @override
  Future<bool> hasPrayedForFuneral(String funeralId) async {
    final prayedFunerals = await getPrayedFunerals();
    return prayedFunerals.contains(funeralId);
  }

  @override
  Future<Set<String>> getPrayedFunerals() async {
    final prayedList = _prefs.getStringList(_prayedFuneralsKey) ?? [];
    return prayedList.toSet();
  }

  @override
  Future<bool> clearPrayedFunerals() async {
    return _prefs.remove(_prayedFuneralsKey);
  }

  @override
  Future<bool> saveReportedFuneral(String funeralId) async {
    final reportedFunerals = await getReportedFunerals();
    reportedFunerals.add(funeralId);
    return _prefs.setStringList(
      _reportedFuneralsKey,
      reportedFunerals.toList(),
    );
  }

  @override
  Future<bool> hasReportedFuneral(String funeralId) async {
    final reportedFunerals = await getReportedFunerals();
    return reportedFunerals.contains(funeralId);
  }

  @override
  Future<Set<String>> getReportedFunerals() async {
    final reportedList = _prefs.getStringList(_reportedFuneralsKey) ?? [];
    return reportedList.toSet();
  }

  @override
  Future<bool> clearReportedFunerals() async {
    return _prefs.remove(_reportedFuneralsKey);
  }
}
