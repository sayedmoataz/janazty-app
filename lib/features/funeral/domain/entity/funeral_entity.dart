import 'package:freezed_annotation/freezed_annotation.dart';

part 'funeral_entity.freezed.dart';
part 'funeral_entity.g.dart';

@freezed
abstract class FuneralEntity with _$FuneralEntity {
  const factory FuneralEntity({
    required String id,
    required String deceasedName,
    required String gender,
    required String mosqueName,
    required String mosqueLocation,
    required double lat,
    required double lng,
    required DateTime prayerTime,
    required String publisherId,
    required bool isMosqueVerified,
    required DateTime createdAt,
    String? fatherName,
    String? burialLocation,
    String? notes,
    String? photoUrl,
    int? prayedCount,
  }) = _FuneralEntity;

  factory FuneralEntity.fromJson(Map<String, dynamic> json) =>
      _$FuneralEntityFromJson(json);
}
