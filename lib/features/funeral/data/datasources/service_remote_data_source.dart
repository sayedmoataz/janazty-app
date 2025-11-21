import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/service_entity.dart';
import '../models/service_model.dart';

abstract class ServiceRemoteDataSource {
  Stream<List<ServiceEntity>> getApprovedServices();
  Stream<List<ServiceEntity>> getServicesByType(ServiceType type);
  Future<void> suggestService(ServiceEntity service);
  Future<List<ServiceEntity>> getPendingServices();
  Future<void> approveService(String serviceId, String approvedBy);
}

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final FirebaseFirestore _firestore;

  ServiceRemoteDataSourceImpl(this._firestore);

  @override
  Stream<List<ServiceEntity>> getApprovedServices() {
    return _firestore
        .collection('services')
        .where('status', isEqualTo: 'approved')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ServiceModel.fromFirestore(doc).toEntity())
              .toList(),
        );
  }

  @override
  Stream<List<ServiceEntity>> getServicesByType(ServiceType type) {
    return _firestore
        .collection('services')
        .where('status', isEqualTo: 'approved')
        .where('type', isEqualTo: type.name)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ServiceModel.fromFirestore(doc).toEntity())
              .toList(),
        );
  }

  @override
  Future<void> suggestService(ServiceEntity service) async {
    final model = ServiceModel.fromEntity(service);
    final data = model.toJson();
    data['status'] = 'pending';
    await _firestore.collection('pending_services').add(data);
  }

  @override
  Future<List<ServiceEntity>> getPendingServices() async {
    final snapshot = await _firestore
        .collection('pending_services')
        .where('status', isEqualTo: 'pending')
        .get();

    return snapshot.docs
        .map((doc) => ServiceModel.fromFirestore(doc).toEntity())
        .toList();
  }

  @override
  Future<void> approveService(String serviceId, String approvedBy) async {
    final pendingDoc = await _firestore
        .collection('pending_services')
        .doc(serviceId)
        .get();

    if (pendingDoc.exists) {
      final data = pendingDoc.data()!;
      data['status'] = 'approved';
      data['approvedBy'] = approvedBy;
      data['approvedAt'] = FieldValue.serverTimestamp();

      // Move to services collection
      await _firestore.collection('services').add(data);

      // Delete from pending
      await _firestore.collection('pending_services').doc(serviceId).delete();
    }
  }
}
