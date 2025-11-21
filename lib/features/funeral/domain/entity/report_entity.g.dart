// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportEntity _$ReportEntityFromJson(Map<String, dynamic> json) =>
    _ReportEntity(
      id: json['id'] as String,
      funeralId: json['funeralId'] as String,
      reporterId: json['reporterId'] as String,
      reason: json['reason'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ReportEntityToJson(_ReportEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'funeralId': instance.funeralId,
      'reporterId': instance.reporterId,
      'reason': instance.reason,
      'createdAt': instance.createdAt.toIso8601String(),
    };
