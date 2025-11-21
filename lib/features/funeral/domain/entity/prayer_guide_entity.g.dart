// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_guide_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrayerGuideEntity _$PrayerGuideEntityFromJson(Map<String, dynamic> json) =>
    _PrayerGuideEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      textContent: json['textContent'] as String,
      order: (json['order'] as num).toInt(),
      category: json['category'] as String,
      audioUrl: json['audioUrl'] as String?,
    );

Map<String, dynamic> _$PrayerGuideEntityToJson(_PrayerGuideEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'textContent': instance.textContent,
      'order': instance.order,
      'category': instance.category,
      'audioUrl': instance.audioUrl,
    };
