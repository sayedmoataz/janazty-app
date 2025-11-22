import '../../domain/entity/funeral_entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/funeral_remote_data_source.dart';

class FuneralRepositoryImpl implements FuneralRepository {
  final FuneralRemoteDataSource remoteDataSource;

  FuneralRepositoryImpl(this.remoteDataSource);

  @override
  Stream<List<FuneralEntity>> getFunerals() {
    return remoteDataSource.getFunerals();
  }

  @override
  Future<FuneralEntity?> getFuneralById(String id) {
    return remoteDataSource.getFuneralById(id);
  }

  @override
  Future<void> addFuneral(FuneralEntity funeral) {
    return remoteDataSource.addFuneral(funeral);
  }

  @override
  Future<void> incrementPrayCount(String funeralId) {
    return remoteDataSource.incrementPrayCount(funeralId);
  }

  @override
  Future<void> reportFuneral(String funeralId) {
    return remoteDataSource.reportFuneral(funeralId);
  }
}
