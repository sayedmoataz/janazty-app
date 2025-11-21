import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayer_guide_entity.freezed.dart';
part 'prayer_guide_entity.g.dart';

@freezed
abstract class PrayerGuideEntity with _$PrayerGuideEntity {
  const factory PrayerGuideEntity({
    required String id,
    required String title,
    required String textContent,
    required int order,
    required String category,
    String? audioUrl,
  }) = _PrayerGuideEntity;

  factory PrayerGuideEntity.fromJson(Map<String, dynamic> json) =>
      _$PrayerGuideEntityFromJson(json);
}
