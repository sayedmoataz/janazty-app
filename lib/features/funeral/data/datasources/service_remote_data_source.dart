import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/service_entity.dart';
import '../models/service_model.dart';

abstract class ServiceRemoteDataSource {
  Stream<List<ServiceEntity>> getApprovedServices();
  Stream<List<ServiceEntity>> getServicesByType(ServiceType type);
  Future<void> suggestService(ServiceEntity service);
  Future<void> suggestNewServiceType(
    String serviceName,
    String description,
    String example,
  );
  Future<List<ServiceEntity>> getPendingServices();
  Future<void> approveService(String serviceId, String approvedBy);
}

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final FirebaseFirestore _firestore;

  ServiceRemoteDataSourceImpl(this._firestore);

  @override
  Stream<List<ServiceEntity>> getApprovedServices() {
    // Listen to approved services from 'services' collection
    final approvedStream = _firestore
        .collection('services')
        .where('status', isEqualTo: 'approved')
        .snapshots();

    // Listen to approved services from 'pending_services' collection
    final pendingCollectionStream = _firestore
        .collection('pending_services')
        .where('status', isEqualTo: 'approved')
        .snapshots();

    // Combine both streams
    return approvedStream.asyncMap((approvedSnapshot) async {
      final pendingSnapshot = await pendingCollectionStream.first;

      // Combine documents from both collections
      final allDocs = [...approvedSnapshot.docs, ...pendingSnapshot.docs];

      // Sort in memory by createdAt
      allDocs.sort((a, b) {
        final timeA = (a.data()['createdAt'] as Timestamp).toDate();
        final timeB = (b.data()['createdAt'] as Timestamp).toDate();
        return timeB.compareTo(timeA); // descending order
      });

      return allDocs
          .map((doc) => ServiceModel.fromFirestore(doc).toEntity())
          .toList();
    });
  }

  @override
  Stream<List<ServiceEntity>> getServicesByType(ServiceType type) {
    // Listen to approved services from 'services' collection
    final approvedStream = _firestore
        .collection('services')
        .where('status', isEqualTo: 'approved')
        .where('type', isEqualTo: type.name)
        .snapshots();

    // Listen to approved services from 'pending_services' collection
    final pendingStream = _firestore
        .collection('pending_services')
        .where('status', isEqualTo: 'approved')
        .where('type', isEqualTo: type.name)
        .snapshots();

    // Combine both streams
    return approvedStream.asyncMap((approvedSnapshot) async {
      final pendingSnapshot = await pendingStream.first;

      // Combine documents from both collections
      final allDocs = [...approvedSnapshot.docs, ...pendingSnapshot.docs];

      // Sort in memory by createdAt
      allDocs.sort((a, b) {
        final timeA = (a.data()['createdAt'] as Timestamp).toDate();
        final timeB = (b.data()['createdAt'] as Timestamp).toDate();
        return timeB.compareTo(timeA); // descending order
      });

      return allDocs
          .map((doc) => ServiceModel.fromFirestore(doc).toEntity())
          .toList();
    });
  }

  @override
  Future<void> suggestService(ServiceEntity service) async {
    // Manually construct the data to avoid serialization issues
    final data = <String, dynamic>{
      'type': service.type.name,
      'title': service.title,
      'contactPhone': service.contactPhone,
      'governorate': service.governorate,
      'area': service.area,
      'isFree': service.isFree,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    };

    // Add optional fields if present
    if (service.details != null && service.details!.isNotEmpty) {
      data['details'] = service.details;
    }

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

  @override
  Future<void> suggestNewServiceType(
    String serviceName,
    String description,
    String example,
  ) async {
    await _firestore.collection('service_type_suggestions').add({
      'serviceName': serviceName,
      'description': description,
      'example': example,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
