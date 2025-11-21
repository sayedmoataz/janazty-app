import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_entity.freezed.dart';
part 'report_entity.g.dart';

@freezed
abstract class ReportEntity with _$ReportEntity {
  const factory ReportEntity({
    required String id,
    required String funeralId,
    required String reporterId,
    required String reason,
    required DateTime createdAt,
  }) = _ReportEntity;

  factory ReportEntity.fromJson(Map<String, dynamic> json) =>
      _$ReportEntityFromJson(json);
}
