import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/service_type_suggestion_entity.dart';

part 'service_type_suggestion_model.freezed.dart';
part 'service_type_suggestion_model.g.dart';

@freezed
abstract class ServiceTypeSuggestionModel with _$ServiceTypeSuggestionModel {
  const ServiceTypeSuggestionModel._();

  const factory ServiceTypeSuggestionModel({
    required String id,
    required String serviceName,
    required String description,
    required String example,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    required DateTime createdAt,
    required String status,
  }) = _ServiceTypeSuggestionModel;

  factory ServiceTypeSuggestionModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeSuggestionModelFromJson(json);

  factory ServiceTypeSuggestionModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ServiceTypeSuggestionModel.fromJson({...data, 'id': doc.id});
  }

  ServiceTypeSuggestionEntity toEntity() {
    return ServiceTypeSuggestionEntity(
      id: id,
      serviceName: serviceName,
      description: description,
      example: example,
      createdAt: createdAt,
      status: status,
    );
  }

  factory ServiceTypeSuggestionModel.fromEntity(
    ServiceTypeSuggestionEntity entity,
  ) {
    return ServiceTypeSuggestionModel(
      id: entity.id,
      serviceName: entity.serviceName,
      description: entity.description,
      example: entity.example,
      createdAt: entity.createdAt,
      status: entity.status,
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
