import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/injection_container.dart' as di;
import '../../domain/entity/prayer_guide_entity.dart';
import '../../domain/repositories/repository.dart';

// Prayer Guide Repository Provider
final prayerGuideRepositoryProvider = Provider<PrayerGuideRepository>((ref) {
  return di.sl<PrayerGuideRepository>();
});

// Get all prayer guides
final allPrayerGuidesProvider =
    StreamProvider.autoDispose<List<PrayerGuideEntity>>((ref) {
      final repository = ref.watch(prayerGuideRepositoryProvider);
      return repository.getAllPrayerGuides();
    });

// Get prayer guides by category
final prayerGuidesByCategoryProvider = StreamProvider.autoDispose
    .family<List<PrayerGuideEntity>, String>((ref, category) {
      final repository = ref.watch(prayerGuideRepositoryProvider);
      return repository.getPrayerGuidesByCategory(category);
    });

// Get single prayer guide by ID
final prayerGuideByIdProvider =
    FutureProvider.family<PrayerGuideEntity?, String>((ref, id) async {
      final repository = ref.read(prayerGuideRepositoryProvider);
      return await repository.getPrayerGuideById(id);
    });
