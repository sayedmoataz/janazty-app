import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/funeral_entity.dart';

part 'funeral_model.freezed.dart';
part 'funeral_model.g.dart';

@freezed
abstract class FuneralModel with _$FuneralModel {
  const FuneralModel._();

  const factory FuneralModel({
    required String id,
    required String deceasedName,
    required String gender,
    required String mosqueName,
    required String mosqueLocation,
    required double lat,
    required double lng,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    required DateTime prayerTime,
    required String publisherId,
    required bool isMosqueVerified,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    required DateTime createdAt,
    String? fatherName,
    String? burialLocation,
    String? ageType,
    String? funeralNotes,
    String? notes,
    String? photoUrl,
    int? prayedCount,
    int? reportCount,
  }) = _FuneralModel;

  factory FuneralModel.fromJson(Map<String, dynamic> json) =>
      _$FuneralModelFromJson(json);

  factory FuneralModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FuneralModel.fromJson({...data, 'id': doc.id});
  }

  FuneralEntity toEntity() {
    return FuneralEntity(
      id: id,
      deceasedName: deceasedName,
      gender: gender,
      mosqueName: mosqueName,
      mosqueLocation: mosqueLocation,
      lat: lat,
      lng: lng,
      prayerTime: prayerTime,
      publisherId: publisherId,
      isMosqueVerified: isMosqueVerified,
      createdAt: createdAt,
      fatherName: fatherName,
      burialLocation: burialLocation,
      ageType: ageType,
      funeralNotes: funeralNotes,
      notes: notes,
      photoUrl: photoUrl,
      prayedCount: prayedCount,
      reportCount: reportCount,
    );
  }

  factory FuneralModel.fromEntity(FuneralEntity entity) {
    return FuneralModel(
      id: entity.id,
      deceasedName: entity.deceasedName,
      gender: entity.gender,
      mosqueName: entity.mosqueName,
      mosqueLocation: entity.mosqueLocation,
      lat: entity.lat,
      lng: entity.lng,
      prayerTime: entity.prayerTime,
      publisherId: entity.publisherId,
      isMosqueVerified: entity.isMosqueVerified,
      createdAt: entity.createdAt,
      fatherName: entity.fatherName,
      burialLocation: entity.burialLocation,
      ageType: entity.ageType,
      funeralNotes: entity.funeralNotes,
      notes: entity.notes,
      photoUrl: entity.photoUrl,
      prayedCount: entity.prayedCount,
      reportCount: entity.reportCount,
    );
  }
}

// Helper functions for Timestamp conversion
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
