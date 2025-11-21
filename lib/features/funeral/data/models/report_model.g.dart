// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => _ReportModel(
  id: json['id'] as String,
  funeralId: json['funeralId'] as String,
  reporterId: json['reporterId'] as String,
  reason: json['reason'] as String,
  createdAt: _timestampFromJson(json['createdAt']),
);

Map<String, dynamic> _$ReportModelToJson(_ReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'funeralId': instance.funeralId,
      'reporterId': instance.reporterId,
      'reason': instance.reason,
      'createdAt': _timestampToJson(instance.createdAt),
    };
