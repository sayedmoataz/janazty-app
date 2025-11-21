import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import 'storage_service.dart';

class FirebaseStorageService implements StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final Uuid _uuid = const Uuid();

  @override
  Future<String> uploadImage(String path, List<int> imageBytes) async {
    final fileName = '${_uuid.v4()}.jpg';
    final ref = _storage.ref().child(path).child(fileName);

    final uploadTask = ref.putData(
      imageBytes as Uint8List,
      SettableMetadata(contentType: 'image/jpeg'),
    );

    final snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  @override
  Future<void> deleteImage(String url) async {
    try {
      final ref = _storage.refFromURL(url);
      await ref.delete();
    } catch (e) {
      // Ignore errors if file doesn't exist
    }
  }
}
