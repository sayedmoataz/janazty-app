// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_type_suggestion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceTypeSuggestionModel _$ServiceTypeSuggestionModelFromJson(
  Map<String, dynamic> json,
) => _ServiceTypeSuggestionModel(
  id: json['id'] as String,
  serviceName: json['serviceName'] as String,
  description: json['description'] as String,
  example: json['example'] as String,
  createdAt: _timestampFromJson(json['createdAt']),
  status: json['status'] as String,
);

Map<String, dynamic> _$ServiceTypeSuggestionModelToJson(
  _ServiceTypeSuggestionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'serviceName': instance.serviceName,
  'description': instance.description,
  'example': instance.example,
  'createdAt': _timestampToJson(instance.createdAt),
  'status': instance.status,
};
