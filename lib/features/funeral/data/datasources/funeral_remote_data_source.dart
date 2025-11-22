import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/funeral_entity.dart';
import '../models/funeral_model.dart';

abstract class FuneralRemoteDataSource {
  Stream<List<FuneralEntity>> getFunerals();
  Future<FuneralEntity?> getFuneralById(String id);
  Future<void> addFuneral(FuneralEntity funeral);
  Future<void> incrementPrayCount(String funeralId);
  Future<void> reportFuneral(String funeralId);
}

class FuneralRemoteDataSourceImpl implements FuneralRemoteDataSource {
  final FirebaseFirestore _firestore;

  FuneralRemoteDataSourceImpl(this._firestore);

  @override
  Stream<List<FuneralEntity>> getFunerals() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dayAfterTomorrow = today.add(const Duration(days: 2));

    return _firestore
        .collection('funerals')
        .where('hidden', isEqualTo: false)
        .where('prayerTime', isGreaterThanOrEqualTo: Timestamp.fromDate(today))
        .where('prayerTime', isLessThan: Timestamp.fromDate(dayAfterTomorrow))
        .snapshots()
        .map((snapshot) {
          // Sort in memory instead of orderBy to avoid composite index requirement
          final docs = snapshot.docs;
          docs.sort((a, b) {
            final timeA = (a.data()['prayerTime'] as Timestamp).toDate();
            final timeB = (b.data()['prayerTime'] as Timestamp).toDate();
            return timeA.compareTo(timeB);
          });

          return docs
              .map((doc) => FuneralModel.fromFirestore(doc).toEntity())
              .toList();
        });
  }

  @override
  Future<FuneralEntity?> getFuneralById(String id) async {
    final doc = await _firestore.collection('funerals').doc(id).get();
    if (!doc.exists) {
      return null;
    }
    return FuneralModel.fromFirestore(doc).toEntity();
  }

  @override
  Future<void> addFuneral(FuneralEntity funeral) async {
    final model = FuneralModel.fromEntity(funeral);
    final data = model.toJson();
    data.remove('id');
    await _firestore.collection('funerals').add(data);
  }

  @override
  Future<void> incrementPrayCount(String funeralId) async {
    await _firestore.collection('funerals').doc(funeralId).update({
      'prayedCount': FieldValue.increment(1),
    });
  }

  @override
  Future<void> reportFuneral(String funeralId) async {
    // Add report
    await _firestore.collection('reports').add({
      'funeralId': funeralId,
      'reportedAt': FieldValue.serverTimestamp(),
    });

    // Check report count
    final reports = await _firestore
        .collection('reports')
        .where('funeralId', isEqualTo: funeralId)
        .get();

    // Hide funeral if 3+ reports
    if (reports.docs.length >= 3) {
      await _firestore.collection('funerals').doc(funeralId).update({
        'hidden': true,
      });
    }
  }
}
