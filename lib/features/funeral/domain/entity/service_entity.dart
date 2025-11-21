import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_entity.freezed.dart';
part 'service_entity.g.dart';

enum ServiceType { washer, transport, shroud, cemetery }

@freezed
abstract class ServiceEntity with _$ServiceEntity {
  const factory ServiceEntity({
    required String id,
    required ServiceType type,
    required String title,
    required String contactPhone,
    required String governorate,
    required String area,
    required bool isFree,
    required String status,
    required DateTime createdAt,
    String? details,
    String? approvedBy,
    DateTime? approvedAt,
  }) = _ServiceEntity;

  factory ServiceEntity.fromJson(Map<String, dynamic> json) =>
      _$ServiceEntityFromJson(json);
}
