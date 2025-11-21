import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/prayer_guide_entity.dart';

part 'prayer_guide_model.freezed.dart';
part 'prayer_guide_model.g.dart';

@freezed
abstract class PrayerGuideModel with _$PrayerGuideModel {
  const PrayerGuideModel._();

  const factory PrayerGuideModel({
    required String id,
    required String title,
    required String textContent,
    required int order,
    required String category,
    String? audioUrl,
  }) = _PrayerGuideModel;

  factory PrayerGuideModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerGuideModelFromJson(json);

  factory PrayerGuideModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PrayerGuideModel.fromJson({...data, 'id': doc.id});
  }

  PrayerGuideEntity toEntity() {
    return PrayerGuideEntity(
      id: id,
      title: title,
      textContent: textContent,
      order: order,
      category: category,
      audioUrl: audioUrl,
    );
  }

  factory PrayerGuideModel.fromEntity(PrayerGuideEntity entity) {
    return PrayerGuideModel(
      id: entity.id,
      title: entity.title,
      textContent: entity.textContent,
      order: entity.order,
      category: entity.category,
      audioUrl: entity.audioUrl,
    );
  }
}
