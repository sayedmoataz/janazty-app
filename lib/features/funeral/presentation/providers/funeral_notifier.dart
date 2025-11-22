import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entity/funeral_entity.dart';
import 'funeral_provider.dart';

part 'funeral_notifier.g.dart';

@riverpod
class FuneralNotifier extends _$FuneralNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> addFuneral(FuneralEntity funeral) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(funeralRepositoryProvider);
      await repo.addFuneral(funeral);
      // Refresh funerals list
      ref.invalidate(funeralsProvider);
    });
  }

  Future<void> incrementPrayCount(String funeralId) async {
    state = await AsyncValue.guard(() async {
      final repo = ref.read(funeralRepositoryProvider);
      await repo.incrementPrayCount(funeralId);
      // Refresh funerals list
      ref.invalidate(funeralsProvider);
    });
  }

  Future<void> reportFuneral(String funeralId) async {
    state = await AsyncValue.guard(() async {
      final repo = ref.read(funeralRepositoryProvider);
      await repo.reportFuneral(funeralId);
      // Refresh funerals list
      ref.invalidate(funeralsProvider);
    });
  }
}
