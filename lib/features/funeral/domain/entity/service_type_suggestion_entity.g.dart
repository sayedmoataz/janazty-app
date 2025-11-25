// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_type_suggestion_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceTypeSuggestionEntity _$ServiceTypeSuggestionEntityFromJson(
  Map<String, dynamic> json,
) => _ServiceTypeSuggestionEntity(
  id: json['id'] as String,
  serviceName: json['serviceName'] as String,
  description: json['description'] as String,
  example: json['example'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  status: json['status'] as String,
);

Map<String, dynamic> _$ServiceTypeSuggestionEntityToJson(
  _ServiceTypeSuggestionEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'serviceName': instance.serviceName,
  'description': instance.description,
  'example': instance.example,
  'createdAt': instance.createdAt.toIso8601String(),
  'status': instance.status,
};
