import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/funeral_entity.dart';
import '../../domain/repositories/repository.dart';
import '../models/funeral_model.dart';

class FuneralRepositoryImpl implements FuneralRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String collection = 'funerals';

  @override
  Stream<List<FuneralEntity>> getTodayAndTomorrowFunerals() {
    final now = DateTime.now();
    final tomorrow = now.add(const Duration(days: 1));

    final startOfToday = DateTime(now.year, now.month, now.day);
    final endOfTomorrow = DateTime(
      tomorrow.year,
      tomorrow.month,
      tomorrow.day,
      23,
      59,
      59,
    );

    return _firestore
        .collection(collection)
        .where(
          'prayerTime',
          isGreaterThanOrEqualTo: Timestamp.fromDate(startOfToday),
        )
        .where(
          'prayerTime',
          isLessThanOrEqualTo: Timestamp.fromDate(endOfTomorrow),
        )
        .orderBy('prayerTime', descending: false)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => FuneralModel.fromFirestore(doc).toEntity())
              .toList(),
        );
  }

  @override
  Future<void> addFuneral(FuneralEntity funeral) async {
    final model = FuneralModel.fromEntity(funeral);
    await _firestore.collection(collection).add(model.toJson());
  }

  @override
  Future<void> incrementPrayCount(String funeralId) async {
    await _firestore.collection(collection).doc(funeralId).update({
      'prayedCount': FieldValue.increment(1),
    });
  }

  @override
  Future<void> reportDuplicate(String funeralId, String reason) async {
    await _firestore.collection('reports').add({
      'funeralId': funeralId,
      'reason': reason,
      'reportedAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<FuneralEntity?> getFuneralById(String id) async {
    final doc = await _firestore.collection(collection).doc(id).get();
    if (!doc.exists || doc.data() == null) return null;
    return FuneralModel.fromFirestore(doc).toEntity();
  }
}
