import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/funeral_remote_data_source.dart';
import '../../data/repositories/funeral_repository_impl.dart';
import '../../domain/entity/funeral_entity.dart';
import '../../domain/repositories/repository.dart';

part 'funeral_provider.g.dart';

// Remote Data Source Provider
@riverpod
FuneralRemoteDataSource funeralRemoteDataSource(Ref ref) {
  return FuneralRemoteDataSourceImpl(FirebaseFirestore.instance);
}

// Repository Provider
@riverpod
FuneralRepository funeralRepository(Ref ref) {
  final remoteDataSource = ref.watch(funeralRemoteDataSourceProvider);
  return FuneralRepositoryImpl(remoteDataSource);
}

// Stream Provider for Funerals List
@riverpod
Stream<List<FuneralEntity>> funerals(Ref ref) {
  final repository = ref.watch(funeralRepositoryProvider);
  return repository.getFunerals();
}

// Future Provider for Single Funeral by ID
@riverpod
Future<FuneralEntity> funeralById(Ref ref, String id) async {
  final repository = ref.watch(funeralRepositoryProvider);
  final funeral = await repository.getFuneralById(id);
  if (funeral == null) {
    throw Exception('Funeral not found');
  }
  return funeral;
}

// Future Provider for Incrementing Pray Count
@riverpod
Future<void> prayCount(Ref ref, String funeralId) async {
  final repository = ref.watch(funeralRepositoryProvider);
  await repository.incrementPrayCount(funeralId);
}
