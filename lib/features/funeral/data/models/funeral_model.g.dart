// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funeral_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FuneralModel _$FuneralModelFromJson(Map<String, dynamic> json) =>
    _FuneralModel(
      id: json['id'] as String,
      deceasedName: json['deceasedName'] as String,
      gender: json['gender'] as String,
      mosqueName: json['mosqueName'] as String,
      mosqueLocation: json['mosqueLocation'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      prayerTime: _timestampFromJson(json['prayerTime']),
      publisherId: json['publisherId'] as String,
      isMosqueVerified: json['isMosqueVerified'] as bool,
      createdAt: _timestampFromJson(json['createdAt']),
      fatherName: json['fatherName'] as String?,
      burialLocation: json['burialLocation'] as String?,
      notes: json['notes'] as String?,
      photoUrl: json['photoUrl'] as String?,
      prayedCount: (json['prayedCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FuneralModelToJson(_FuneralModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deceasedName': instance.deceasedName,
      'gender': instance.gender,
      'mosqueName': instance.mosqueName,
      'mosqueLocation': instance.mosqueLocation,
      'lat': instance.lat,
      'lng': instance.lng,
      'prayerTime': _timestampToJson(instance.prayerTime),
      'publisherId': instance.publisherId,
      'isMosqueVerified': instance.isMosqueVerified,
      'createdAt': _timestampToJson(instance.createdAt),
      'fatherName': instance.fatherName,
      'burialLocation': instance.burialLocation,
      'notes': instance.notes,
      'photoUrl': instance.photoUrl,
      'prayedCount': instance.prayedCount,
    };
