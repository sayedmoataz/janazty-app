abstract class LocationService {
  Future<bool> isLocationServiceEnabled();
  Future<bool> checkPermission();
  Future<void> requestPermission();
  Future<dynamic> getCurrentPosition(); // Returns Position from geolocator
}
