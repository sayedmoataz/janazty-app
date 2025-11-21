// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceEntity _$ServiceEntityFromJson(Map<String, dynamic> json) =>
    _ServiceEntity(
      id: json['id'] as String,
      type: $enumDecode(_$ServiceTypeEnumMap, json['type']),
      title: json['title'] as String,
      contactPhone: json['contactPhone'] as String,
      governorate: json['governorate'] as String,
      area: json['area'] as String,
      isFree: json['isFree'] as bool,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      details: json['details'] as String?,
      approvedBy: json['approvedBy'] as String?,
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
    );

Map<String, dynamic> _$ServiceEntityToJson(_ServiceEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ServiceTypeEnumMap[instance.type]!,
      'title': instance.title,
      'contactPhone': instance.contactPhone,
      'governorate': instance.governorate,
      'area': instance.area,
      'isFree': instance.isFree,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'details': instance.details,
      'approvedBy': instance.approvedBy,
      'approvedAt': instance.approvedAt?.toIso8601String(),
    };

const _$ServiceTypeEnumMap = {
  ServiceType.washer: 'washer',
  ServiceType.transport: 'transport',
  ServiceType.shroud: 'shroud',
  ServiceType.cemetery: 'cemetery',
};
