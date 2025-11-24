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
    if (!ref.mounted) return;
    state = const AsyncValue.loading();

    final result = await AsyncValue.guard(() async {
      final repo = ref.read(funeralRepositoryProvider);
      await repo.addFuneral(funeral);
    });

    if (!ref.mounted) return;
    state = result;

    // Refresh funerals list
    if (ref.mounted) {
      ref.invalidate(funeralsProvider);
    }
  }

  Future<void> incrementPrayCount(String funeralId) async {
    if (!ref.mounted) return;

    final result = await AsyncValue.guard(() async {
      final repo = ref.read(funeralRepositoryProvider);
      await repo.incrementPrayCount(funeralId);
    });

    if (!ref.mounted) return;
    state = result;

    // Refresh funerals list
    if (ref.mounted) {
      ref.invalidate(funeralsProvider);
    }
  }

  Future<void> reportFuneral(String funeralId) async {
    if (!ref.mounted) return;

    final result = await AsyncValue.guard(() async {
      final repo = ref.read(funeralRepositoryProvider);
      await repo.reportFuneral(funeralId);
    });

    if (!ref.mounted) return;
    state = result;

    // Refresh funerals list
    if (ref.mounted) {
      ref.invalidate(funeralsProvider);
    }
  }
}
