import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/injection_container.dart' as di;
import '../../domain/entity/service_entity.dart';
import '../../domain/repositories/repository.dart';

// Service Repository Provider
final serviceRepositoryProvider = Provider<ServiceRepository>((ref) {
  return di.sl<ServiceRepository>();
});

// Get all approved services
final approvedServicesProvider =
    StreamProvider.autoDispose<List<ServiceEntity>>((ref) {
      final repository = ref.watch(serviceRepositoryProvider);
      return repository.getApprovedServices();
    });

// Get services by type
final servicesByTypeProvider = StreamProvider.autoDispose
    .family<List<ServiceEntity>, ServiceType>((ref, type) {
      final repository = ref.watch(serviceRepositoryProvider);
      return repository.getServicesByType(type);
    });

// Suggest a new service
final suggestServiceProvider = FutureProvider.family<void, ServiceEntity>((
  ref,
  service,
) async {
  final repository = ref.read(serviceRepositoryProvider);
  await repository.suggestService(service);
});

// Suggest a new service type
final suggestNewServiceTypeProvider =
    FutureProvider.family<void, Map<String, String>>((ref, data) async {
      final repository = ref.read(serviceRepositoryProvider);
      await repository.suggestNewServiceType(
        data['serviceName']!,
        data['description']!,
        data['example']!,
      );
    });
