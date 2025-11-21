abstract class StorageService {
  Future<String> uploadImage(String path, List<int> imageBytes);
  Future<void> deleteImage(String url);
}
