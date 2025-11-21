import '../../domain/entity/service_entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/service_remote_data_source.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceRemoteDataSource _remoteDataSource;

  ServiceRepositoryImpl(this._remoteDataSource);

  @override
  Stream<List<ServiceEntity>> getApprovedServices() {
    return _remoteDataSource.getApprovedServices();
  }

  @override
  Stream<List<ServiceEntity>> getServicesByType(ServiceType type) {
    return _remoteDataSource.getServicesByType(type);
  }

  @override
  Future<void> suggestService(ServiceEntity service) {
    return _remoteDataSource.suggestService(service);
  }

  @override
  Future<List<ServiceEntity>> getPendingServices() {
    return _remoteDataSource.getPendingServices();
  }

  @override
  Future<void> approveService(String serviceId, String approvedBy) {
    return _remoteDataSource.approveService(serviceId, approvedBy);
  }
}
