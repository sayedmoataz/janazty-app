import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/report_entity.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
abstract class ReportModel with _$ReportModel {
  const ReportModel._();

  const factory ReportModel({
    required String id,
    required String funeralId,
    required String reporterId,
    required String reason,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    required DateTime createdAt,
  }) = _ReportModel;

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  factory ReportModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ReportModel.fromJson({...data, 'id': doc.id});
  }

  ReportEntity toEntity() {
    return ReportEntity(
      id: id,
      funeralId: funeralId,
      reporterId: reporterId,
      reason: reason,
      createdAt: createdAt,
    );
  }

  factory ReportModel.fromEntity(ReportEntity entity) {
    return ReportModel(
      id: entity.id,
      funeralId: entity.funeralId,
      reporterId: entity.reporterId,
      reason: entity.reason,
      createdAt: entity.createdAt,
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
