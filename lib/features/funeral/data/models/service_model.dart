import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/service_entity.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
abstract class ServiceModel with _$ServiceModel {
  const ServiceModel._();

  const factory ServiceModel({
    required String id,
    required ServiceType type,
    required String title,
    required String contactPhone,
    required String governorate,
    required String area,
    required bool isFree,
    required String status,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    required DateTime createdAt,
    String? details,
    String? approvedBy,
    @JsonKey(
      fromJson: _timestampFromJsonNullable,
      toJson: _timestampToJsonNullable,
    )
    DateTime? approvedAt,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  factory ServiceModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ServiceModel.fromJson({...data, 'id': doc.id});
  }

  ServiceEntity toEntity() {
    return ServiceEntity(
      id: id,
      type: type,
      title: title,
      contactPhone: contactPhone,
      governorate: governorate,
      area: area,
      details: details,
      isFree: isFree,
      status: status,
      createdAt: createdAt,
      approvedBy: approvedBy,
      approvedAt: approvedAt,
    );
  }

  factory ServiceModel.fromEntity(ServiceEntity entity) {
    return ServiceModel(
      id: entity.id,
      type: entity.type,
      title: entity.title,
      contactPhone: entity.contactPhone,
      governorate: entity.governorate,
      area: entity.area,
      details: entity.details,
      isFree: entity.isFree,
      status: entity.status,
      createdAt: entity.createdAt,
      approvedBy: entity.approvedBy,
      approvedAt: entity.approvedAt,
    );
  }
}

DateTime _timestampFromJson(dynamic timestamp) {
  if (timestamp is Timestamp) {
    return timestamp.toDate();
  } else if (timestamp is String) {
    return DateTime.parse(timestamp);
  }
  return DateTime.now();
}

dynamic _timestampToJson(DateTime dateTime) {
  return Timestamp.fromDate(dateTime);
}

DateTime? _timestampFromJsonNullable(dynamic timestamp) {
  if (timestamp == null) return null;
  if (timestamp is Timestamp) {
    return timestamp.toDate();
  } else if (timestamp is String) {
    return DateTime.parse(timestamp);
  }
  return null;
}

dynamic _timestampToJsonNullable(DateTime? dateTime) {
  return dateTime != null ? Timestamp.fromDate(dateTime) : null;
}
