import '../entity/funeral_entity.dart';
import '../entity/prayer_guide_entity.dart';
import '../entity/service_entity.dart';

abstract class FuneralRepository {
  Stream<List<FuneralEntity>> getFunerals();
  Future<FuneralEntity?> getFuneralById(String id);
  Future<void> addFuneral(FuneralEntity funeral);
  Future<void> incrementPrayCount(String funeralId);
  Future<void> reportFuneral(String funeralId);
}

abstract class ServiceRepository {
  Stream<List<ServiceEntity>> getApprovedServices();
  Stream<List<ServiceEntity>> getServicesByType(ServiceType type);
  Future<void> suggestService(ServiceEntity service);
  Future<void> suggestNewServiceType(
    String serviceName,
    String description,
    String example,
  );
  Future<List<ServiceEntity>> getPendingServices();
  Future<void> approveService(String serviceId, String approvedBy);
}

abstract class PrayerGuideRepository {
  Stream<List<PrayerGuideEntity>> getAllPrayerGuides();
  Stream<List<PrayerGuideEntity>> getPrayerGuidesByCategory(String category);
  Future<PrayerGuideEntity?> getPrayerGuideById(String id);
}
