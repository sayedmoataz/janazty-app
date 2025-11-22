import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../../features/funeral/data/datasources/funeral_remote_data_source.dart';
import '../../features/funeral/data/datasources/prayer_guide_remote_data_source.dart';
import '../../features/funeral/data/datasources/service_remote_data_source.dart';
import '../../features/funeral/data/repositories/funeral_repository_impl.dart';
import '../../features/funeral/data/repositories/prayer_guide_repository_impl.dart';
import '../../features/funeral/data/repositories/service_repository_impl.dart';
import '../../features/funeral/domain/repositories/repository.dart';
import '../../services/audio/audio_player_service.dart';
import '../../services/crash_reporting/crash_reporting_service.dart';
import '../../services/crash_reporting/firebase_crash_reporting_service.dart';
import '../../services/location/geolocator_location_service.dart';
import '../../services/location/location_service.dart';
import '../../services/notification/firebase_notification_service.dart';
import '../../services/notification/notification_service.dart';
import '../../services/remote_config/firebase_remote_config_service.dart';
import '../../services/remote_config/remote_config_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Services
  sl.registerLazySingleton<CrashReportingService>(
    FirebaseCrashReportingService.new,
  );
  sl.registerLazySingleton<RemoteConfigService>(
    FirebaseRemoteConfigService.new,
  );
  sl.registerLazySingleton<NotificationService>(
    FirebaseNotificationService.new,
  );
  sl.registerLazySingleton<LocationService>(GeolocatorLocationService.new);
  sl.registerLazySingleton(AudioPlayerService.new);

  // Data sources
  sl.registerLazySingleton<FuneralRemoteDataSource>(
    () => FuneralRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ServiceRemoteDataSource>(
    () => ServiceRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<PrayerGuideRemoteDataSource>(
    () => PrayerGuideRemoteDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<FuneralRepository>(
    () => FuneralRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<ServiceRepository>(
    () => ServiceRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<PrayerGuideRepository>(
    () => PrayerGuideRepositoryImpl(sl()),
  );
}
