// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funeral_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FuneralEntity _$FuneralEntityFromJson(Map<String, dynamic> json) =>
    _FuneralEntity(
      id: json['id'] as String,
      deceasedName: json['deceasedName'] as String,
      gender: json['gender'] as String,
      mosqueName: json['mosqueName'] as String,
      mosqueLocation: json['mosqueLocation'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      prayerTime: DateTime.parse(json['prayerTime'] as String),
      publisherId: json['publisherId'] as String,
      isMosqueVerified: json['isMosqueVerified'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      fatherName: json['fatherName'] as String?,
      burialLocation: json['burialLocation'] as String?,
      ageType: json['ageType'] as String?,
      funeralNotes: json['funeralNotes'] as String?,
      notes: json['notes'] as String?,
      photoUrl: json['photoUrl'] as String?,
      prayedCount: (json['prayedCount'] as num?)?.toInt(),
      reportCount: (json['reportCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FuneralEntityToJson(_FuneralEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deceasedName': instance.deceasedName,
      'gender': instance.gender,
      'mosqueName': instance.mosqueName,
      'mosqueLocation': instance.mosqueLocation,
      'lat': instance.lat,
      'lng': instance.lng,
      'prayerTime': instance.prayerTime.toIso8601String(),
      'publisherId': instance.publisherId,
      'isMosqueVerified': instance.isMosqueVerified,
      'createdAt': instance.createdAt.toIso8601String(),
      'fatherName': instance.fatherName,
      'burialLocation': instance.burialLocation,
      'ageType': instance.ageType,
      'funeralNotes': instance.funeralNotes,
      'notes': instance.notes,
      'photoUrl': instance.photoUrl,
      'prayedCount': instance.prayedCount,
      'reportCount': instance.reportCount,
    };
