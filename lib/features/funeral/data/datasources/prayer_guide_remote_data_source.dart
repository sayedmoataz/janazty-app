import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/prayer_guide_entity.dart';
import '../models/prayer_guide_model.dart';

abstract class PrayerGuideRemoteDataSource {
  Stream<List<PrayerGuideEntity>> getAllPrayerGuides();
  Stream<List<PrayerGuideEntity>> getPrayerGuidesByCategory(String category);
  Future<PrayerGuideEntity?> getPrayerGuideById(String id);
}

class PrayerGuideRemoteDataSourceImpl implements PrayerGuideRemoteDataSource {
  final FirebaseFirestore _firestore;

  PrayerGuideRemoteDataSourceImpl(this._firestore);

  @override
  Stream<List<PrayerGuideEntity>> getAllPrayerGuides() {
    return _firestore
        .collection('prayer_guide')
        .orderBy('order')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => PrayerGuideModel.fromFirestore(doc).toEntity())
              .toList(),
        );
  }

  @override
  Stream<List<PrayerGuideEntity>> getPrayerGuidesByCategory(String category) {
    return _firestore
        .collection('prayer_guide')
        .where('category', isEqualTo: category)
        .orderBy('order')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => PrayerGuideModel.fromFirestore(doc).toEntity())
              .toList(),
        );
  }

  @override
  Future<PrayerGuideEntity?> getPrayerGuideById(String id) async {
    final doc = await _firestore.collection('prayer_guide').doc(id).get();
    if (!doc.exists) return null;
    return PrayerGuideModel.fromFirestore(doc).toEntity();
  }
}
