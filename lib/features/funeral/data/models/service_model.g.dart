// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) =>
    _ServiceModel(
      id: json['id'] as String,
      type: $enumDecode(_$ServiceTypeEnumMap, json['type']),
      title: json['title'] as String,
      contactPhone: json['contactPhone'] as String,
      governorate: json['governorate'] as String,
      area: json['area'] as String,
      isFree: json['isFree'] as bool,
      status: json['status'] as String,
      createdAt: _timestampFromJson(json['createdAt']),
      details: json['details'] as String?,
      approvedBy: json['approvedBy'] as String?,
      approvedAt: _timestampFromJsonNullable(json['approvedAt']),
    );

Map<String, dynamic> _$ServiceModelToJson(_ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ServiceTypeEnumMap[instance.type]!,
      'title': instance.title,
      'contactPhone': instance.contactPhone,
      'governorate': instance.governorate,
      'area': instance.area,
      'isFree': instance.isFree,
      'status': instance.status,
      'createdAt': _timestampToJson(instance.createdAt),
      'details': instance.details,
      'approvedBy': instance.approvedBy,
      'approvedAt': _timestampToJsonNullable(instance.approvedAt),
    };

const _$ServiceTypeEnumMap = {
  ServiceType.washer: 'washer',
  ServiceType.transport: 'transport',
  ServiceType.shroud: 'shroud',
  ServiceType.cemetery: 'cemetery',
};
