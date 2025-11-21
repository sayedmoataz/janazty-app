import 'package:geolocator/geolocator.dart';

import 'location_service.dart';

class GeolocatorLocationService implements LocationService {
  @override
  Future<bool> isLocationServiceEnabled() =>
      Geolocator.isLocationServiceEnabled();

  @override
  Future<bool> checkPermission() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  @override
  Future<void> requestPermission() => Geolocator.requestPermission();

  @override
  Future<Position> getCurrentPosition() => Geolocator.getCurrentPosition();
}
