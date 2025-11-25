import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_type_suggestion_entity.freezed.dart';
part 'service_type_suggestion_entity.g.dart';

@freezed
abstract class ServiceTypeSuggestionEntity with _$ServiceTypeSuggestionEntity {
  const factory ServiceTypeSuggestionEntity({
    required String id,
    required String serviceName,
    required String description,
    required String example,
    required DateTime createdAt,
    required String status, // 'pending', 'approved', 'rejected'
  }) = _ServiceTypeSuggestionEntity;

  factory ServiceTypeSuggestionEntity.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeSuggestionEntityFromJson(json);
}
