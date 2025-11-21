import '../../domain/entity/prayer_guide_entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/prayer_guide_remote_data_source.dart';

class PrayerGuideRepositoryImpl implements PrayerGuideRepository {
  final PrayerGuideRemoteDataSource _remoteDataSource;

  PrayerGuideRepositoryImpl(this._remoteDataSource);

  @override
  Stream<List<PrayerGuideEntity>> getAllPrayerGuides() {
    return _remoteDataSource.getAllPrayerGuides();
  }

  @override
  Stream<List<PrayerGuideEntity>> getPrayerGuidesByCategory(String category) {
    return _remoteDataSource.getPrayerGuidesByCategory(category);
  }

  @override
  Future<PrayerGuideEntity?> getPrayerGuideById(String id) {
    return _remoteDataSource.getPrayerGuideById(id);
  }
}
