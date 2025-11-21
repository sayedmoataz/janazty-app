import '../entity/funeral_entity.dart';
import '../entity/prayer_guide_entity.dart';
import '../entity/service_entity.dart';

abstract class FuneralRepository {
  Stream<List<FuneralEntity>> getTodayAndTomorrowFunerals();
  Future<void> addFuneral(FuneralEntity funeral);
  Future<void> incrementPrayCount(String funeralId);
  Future<void> reportDuplicate(String funeralId, String reason);
  Future<FuneralEntity?> getFuneralById(String id);
}

abstract class ServiceRepository {
  Stream<List<ServiceEntity>> getApprovedServices();
  Stream<List<ServiceEntity>> getServicesByType(ServiceType type);
  Future<void> suggestService(ServiceEntity service);
  Future<List<ServiceEntity>> getPendingServices();
  Future<void> approveService(String serviceId, String approvedBy);
}

abstract class PrayerGuideRepository {
  Stream<List<PrayerGuideEntity>> getAllPrayerGuides();
  Stream<List<PrayerGuideEntity>> getPrayerGuidesByCategory(String category);
  Future<PrayerGuideEntity?> getPrayerGuideById(String id);
}
