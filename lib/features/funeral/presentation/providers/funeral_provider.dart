import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janazty/features/funeral/data/repositories/funeral_repository_impl.dart';

import '../../domain/entity/funeral_entity.dart';
import '../../domain/repositories/repository.dart';

final funeralRepositoryProvider = Provider<FuneralRepository>((ref) {
  return FuneralRepositoryImpl();
});

final funeralsProvider = StreamProvider.autoDispose<List<FuneralEntity>>((ref) {
  final repo = ref.read(funeralRepositoryProvider);
  return repo.getTodayAndTomorrowFunerals();
});

final addFuneralProvider = FutureProvider.family<void, FuneralEntity>((ref, funeral) async {
  final repo = ref.read(funeralRepositoryProvider);
  await repo.addFuneral(funeral);
});

final prayCountProvider = FutureProvider.family<void, String>((ref, funeralId) async {
  final repo = ref.read(funeralRepositoryProvider);
  await repo.incrementPrayCount(funeralId);
  ref.invalidate(funeralsProvider);
});