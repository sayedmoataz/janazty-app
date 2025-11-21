import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/funeral_entity.dart';
import '../models/funeral_model.dart';

abstract class FuneralRemoteDataSource {
  Stream<List<FuneralEntity>> getTodayAndTomorrowFunerals();
  Future<void> addFuneral(FuneralEntity funeral);
  Future<void> incrementPrayCount(String funeralId);
  Future<void> reportDuplicate(String funeralId, String reason);
  Future<FuneralEntity?> getFuneralById(String id);
}

class FuneralRemoteDataSourceImpl implements FuneralRemoteDataSource {
  final FirebaseFirestore _firestore;

  FuneralRemoteDataSourceImpl(this._firestore);

  @override
  Stream<List<FuneralEntity>> getTodayAndTomorrowFunerals() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dayAfterTomorrow = today.add(const Duration(days: 3));

    return _firestore
        .collection('funerals')
        .where('prayerTime', isGreaterThanOrEqualTo: Timestamp.fromDate(today))
        .where('prayerTime', isLessThan: Timestamp.fromDate(dayAfterTomorrow))
        .orderBy('prayerTime')
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
    await _firestore.collection('funerals').add(model.toJson());
  }

  @override
  Future<void> incrementPrayCount(String funeralId) async {
    await _firestore.collection('funerals').doc(funeralId).update({
      'prayedCount': FieldValue.increment(1),
    });
  }

  @override
  Future<void> reportDuplicate(String funeralId, String reason) async {
    await _firestore.collection('reports').add({
      'funeralId': funeralId,
      'reason': reason,
      'createdAt': FieldValue.serverTimestamp(),
    });

    // Get current report count
    final reports = await _firestore
        .collection('reports')
        .where('funeralId', isEqualTo: funeralId)
        .get();

    // If 3 or more reports, hide the funeral
    if (reports.docs.length >= 3) {
      await _firestore.collection('funerals').doc(funeralId).update({
        'hidden': true,
      });
    }
  }

  @override
  Future<FuneralEntity?> getFuneralById(String id) async {
    final doc = await _firestore.collection('funerals').doc(id).get();
    if (!doc.exists) return null;
    return FuneralModel.fromFirestore(doc).toEntity();
  }
}
