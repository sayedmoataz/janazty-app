// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'funeral_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FuneralEntity {

 String get id; String get deceasedName; String get gender; String get mosqueName; String get mosqueLocation; double get lat; double get lng; DateTime get prayerTime; String get publisherId; bool get isMosqueVerified; DateTime get createdAt; String? get fatherName; String? get burialLocation; String? get ageType; String? get funeralNotes; String? get notes; String? get photoUrl; int? get prayedCount; int? get reportCount;
/// Create a copy of FuneralEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FuneralEntityCopyWith<FuneralEntity> get copyWith => _$FuneralEntityCopyWithImpl<FuneralEntity>(this as FuneralEntity, _$identity);

  /// Serializes this FuneralEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FuneralEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.deceasedName, deceasedName) || other.deceasedName == deceasedName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.mosqueName, mosqueName) || other.mosqueName == mosqueName)&&(identical(other.mosqueLocation, mosqueLocation) || other.mosqueLocation == mosqueLocation)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.prayerTime, prayerTime) || other.prayerTime == prayerTime)&&(identical(other.publisherId, publisherId) || other.publisherId == publisherId)&&(identical(other.isMosqueVerified, isMosqueVerified) || other.isMosqueVerified == isMosqueVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.burialLocation, burialLocation) || other.burialLocation == burialLocation)&&(identical(other.ageType, ageType) || other.ageType == ageType)&&(identical(other.funeralNotes, funeralNotes) || other.funeralNotes == funeralNotes)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.prayedCount, prayedCount) || other.prayedCount == prayedCount)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,deceasedName,gender,mosqueName,mosqueLocation,lat,lng,prayerTime,publisherId,isMosqueVerified,createdAt,fatherName,burialLocation,ageType,funeralNotes,notes,photoUrl,prayedCount,reportCount]);

@override
String toString() {
  return 'FuneralEntity(id: $id, deceasedName: $deceasedName, gender: $gender, mosqueName: $mosqueName, mosqueLocation: $mosqueLocation, lat: $lat, lng: $lng, prayerTime: $prayerTime, publisherId: $publisherId, isMosqueVerified: $isMosqueVerified, createdAt: $createdAt, fatherName: $fatherName, burialLocation: $burialLocation, ageType: $ageType, funeralNotes: $funeralNotes, notes: $notes, photoUrl: $photoUrl, prayedCount: $prayedCount, reportCount: $reportCount)';
}


}

/// @nodoc
abstract mixin class $FuneralEntityCopyWith<$Res>  {
  factory $FuneralEntityCopyWith(FuneralEntity value, $Res Function(FuneralEntity) _then) = _$FuneralEntityCopyWithImpl;
@useResult
$Res call({
 String id, String deceasedName, String gender, String mosqueName, String mosqueLocation, double lat, double lng, DateTime prayerTime, String publisherId, bool isMosqueVerified, DateTime createdAt, String? fatherName, String? burialLocation, String? ageType, String? funeralNotes, String? notes, String? photoUrl, int? prayedCount, int? reportCount
});




}
/// @nodoc
class _$FuneralEntityCopyWithImpl<$Res>
    implements $FuneralEntityCopyWith<$Res> {
  _$FuneralEntityCopyWithImpl(this._self, this._then);

  final FuneralEntity _self;
  final $Res Function(FuneralEntity) _then;

/// Create a copy of FuneralEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? deceasedName = null,Object? gender = null,Object? mosqueName = null,Object? mosqueLocation = null,Object? lat = null,Object? lng = null,Object? prayerTime = null,Object? publisherId = null,Object? isMosqueVerified = null,Object? createdAt = null,Object? fatherName = freezed,Object? burialLocation = freezed,Object? ageType = freezed,Object? funeralNotes = freezed,Object? notes = freezed,Object? photoUrl = freezed,Object? prayedCount = freezed,Object? reportCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deceasedName: null == deceasedName ? _self.deceasedName : deceasedName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,mosqueName: null == mosqueName ? _self.mosqueName : mosqueName // ignore: cast_nullable_to_non_nullable
as String,mosqueLocation: null == mosqueLocation ? _self.mosqueLocation : mosqueLocation // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,prayerTime: null == prayerTime ? _self.prayerTime : prayerTime // ignore: cast_nullable_to_non_nullable
as DateTime,publisherId: null == publisherId ? _self.publisherId : publisherId // ignore: cast_nullable_to_non_nullable
as String,isMosqueVerified: null == isMosqueVerified ? _self.isMosqueVerified : isMosqueVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,burialLocation: freezed == burialLocation ? _self.burialLocation : burialLocation // ignore: cast_nullable_to_non_nullable
as String?,ageType: freezed == ageType ? _self.ageType : ageType // ignore: cast_nullable_to_non_nullable
as String?,funeralNotes: freezed == funeralNotes ? _self.funeralNotes : funeralNotes // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,prayedCount: freezed == prayedCount ? _self.prayedCount : prayedCount // ignore: cast_nullable_to_non_nullable
as int?,reportCount: freezed == reportCount ? _self.reportCount : reportCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FuneralEntity].
extension FuneralEntityPatterns on FuneralEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FuneralEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FuneralEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FuneralEntity value)  $default,){
final _that = this;
switch (_that) {
case _FuneralEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FuneralEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FuneralEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String deceasedName,  String gender,  String mosqueName,  String mosqueLocation,  double lat,  double lng,  DateTime prayerTime,  String publisherId,  bool isMosqueVerified,  DateTime createdAt,  String? fatherName,  String? burialLocation,  String? ageType,  String? funeralNotes,  String? notes,  String? photoUrl,  int? prayedCount,  int? reportCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FuneralEntity() when $default != null:
return $default(_that.id,_that.deceasedName,_that.gender,_that.mosqueName,_that.mosqueLocation,_that.lat,_that.lng,_that.prayerTime,_that.publisherId,_that.isMosqueVerified,_that.createdAt,_that.fatherName,_that.burialLocation,_that.ageType,_that.funeralNotes,_that.notes,_that.photoUrl,_that.prayedCount,_that.reportCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String deceasedName,  String gender,  String mosqueName,  String mosqueLocation,  double lat,  double lng,  DateTime prayerTime,  String publisherId,  bool isMosqueVerified,  DateTime createdAt,  String? fatherName,  String? burialLocation,  String? ageType,  String? funeralNotes,  String? notes,  String? photoUrl,  int? prayedCount,  int? reportCount)  $default,) {final _that = this;
switch (_that) {
case _FuneralEntity():
return $default(_that.id,_that.deceasedName,_that.gender,_that.mosqueName,_that.mosqueLocation,_that.lat,_that.lng,_that.prayerTime,_that.publisherId,_that.isMosqueVerified,_that.createdAt,_that.fatherName,_that.burialLocation,_that.ageType,_that.funeralNotes,_that.notes,_that.photoUrl,_that.prayedCount,_that.reportCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String deceasedName,  String gender,  String mosqueName,  String mosqueLocation,  double lat,  double lng,  DateTime prayerTime,  String publisherId,  bool isMosqueVerified,  DateTime createdAt,  String? fatherName,  String? burialLocation,  String? ageType,  String? funeralNotes,  String? notes,  String? photoUrl,  int? prayedCount,  int? reportCount)?  $default,) {final _that = this;
switch (_that) {
case _FuneralEntity() when $default != null:
return $default(_that.id,_that.deceasedName,_that.gender,_that.mosqueName,_that.mosqueLocation,_that.lat,_that.lng,_that.prayerTime,_that.publisherId,_that.isMosqueVerified,_that.createdAt,_that.fatherName,_that.burialLocation,_that.ageType,_that.funeralNotes,_that.notes,_that.photoUrl,_that.prayedCount,_that.reportCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FuneralEntity implements FuneralEntity {
  const _FuneralEntity({required this.id, required this.deceasedName, required this.gender, required this.mosqueName, required this.mosqueLocation, required this.lat, required this.lng, required this.prayerTime, required this.publisherId, required this.isMosqueVerified, required this.createdAt, this.fatherName, this.burialLocation, this.ageType, this.funeralNotes, this.notes, this.photoUrl, this.prayedCount, this.reportCount});
  factory _FuneralEntity.fromJson(Map<String, dynamic> json) => _$FuneralEntityFromJson(json);

@override final  String id;
@override final  String deceasedName;
@override final  String gender;
@override final  String mosqueName;
@override final  String mosqueLocation;
@override final  double lat;
@override final  double lng;
@override final  DateTime prayerTime;
@override final  String publisherId;
@override final  bool isMosqueVerified;
@override final  DateTime createdAt;
@override final  String? fatherName;
@override final  String? burialLocation;
@override final  String? ageType;
@override final  String? funeralNotes;
@override final  String? notes;
@override final  String? photoUrl;
@override final  int? prayedCount;
@override final  int? reportCount;

/// Create a copy of FuneralEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FuneralEntityCopyWith<_FuneralEntity> get copyWith => __$FuneralEntityCopyWithImpl<_FuneralEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FuneralEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FuneralEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.deceasedName, deceasedName) || other.deceasedName == deceasedName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.mosqueName, mosqueName) || other.mosqueName == mosqueName)&&(identical(other.mosqueLocation, mosqueLocation) || other.mosqueLocation == mosqueLocation)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.prayerTime, prayerTime) || other.prayerTime == prayerTime)&&(identical(other.publisherId, publisherId) || other.publisherId == publisherId)&&(identical(other.isMosqueVerified, isMosqueVerified) || other.isMosqueVerified == isMosqueVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.burialLocation, burialLocation) || other.burialLocation == burialLocation)&&(identical(other.ageType, ageType) || other.ageType == ageType)&&(identical(other.funeralNotes, funeralNotes) || other.funeralNotes == funeralNotes)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.prayedCount, prayedCount) || other.prayedCount == prayedCount)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,deceasedName,gender,mosqueName,mosqueLocation,lat,lng,prayerTime,publisherId,isMosqueVerified,createdAt,fatherName,burialLocation,ageType,funeralNotes,notes,photoUrl,prayedCount,reportCount]);

@override
String toString() {
  return 'FuneralEntity(id: $id, deceasedName: $deceasedName, gender: $gender, mosqueName: $mosqueName, mosqueLocation: $mosqueLocation, lat: $lat, lng: $lng, prayerTime: $prayerTime, publisherId: $publisherId, isMosqueVerified: $isMosqueVerified, createdAt: $createdAt, fatherName: $fatherName, burialLocation: $burialLocation, ageType: $ageType, funeralNotes: $funeralNotes, notes: $notes, photoUrl: $photoUrl, prayedCount: $prayedCount, reportCount: $reportCount)';
}


}

/// @nodoc
abstract mixin class _$FuneralEntityCopyWith<$Res> implements $FuneralEntityCopyWith<$Res> {
  factory _$FuneralEntityCopyWith(_FuneralEntity value, $Res Function(_FuneralEntity) _then) = __$FuneralEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String deceasedName, String gender, String mosqueName, String mosqueLocation, double lat, double lng, DateTime prayerTime, String publisherId, bool isMosqueVerified, DateTime createdAt, String? fatherName, String? burialLocation, String? ageType, String? funeralNotes, String? notes, String? photoUrl, int? prayedCount, int? reportCount
});




}
/// @nodoc
class __$FuneralEntityCopyWithImpl<$Res>
    implements _$FuneralEntityCopyWith<$Res> {
  __$FuneralEntityCopyWithImpl(this._self, this._then);

  final _FuneralEntity _self;
  final $Res Function(_FuneralEntity) _then;

/// Create a copy of FuneralEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deceasedName = null,Object? gender = null,Object? mosqueName = null,Object? mosqueLocation = null,Object? lat = null,Object? lng = null,Object? prayerTime = null,Object? publisherId = null,Object? isMosqueVerified = null,Object? createdAt = null,Object? fatherName = freezed,Object? burialLocation = freezed,Object? ageType = freezed,Object? funeralNotes = freezed,Object? notes = freezed,Object? photoUrl = freezed,Object? prayedCount = freezed,Object? reportCount = freezed,}) {
  return _then(_FuneralEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deceasedName: null == deceasedName ? _self.deceasedName : deceasedName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,mosqueName: null == mosqueName ? _self.mosqueName : mosqueName // ignore: cast_nullable_to_non_nullable
as String,mosqueLocation: null == mosqueLocation ? _self.mosqueLocation : mosqueLocation // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,prayerTime: null == prayerTime ? _self.prayerTime : prayerTime // ignore: cast_nullable_to_non_nullable
as DateTime,publisherId: null == publisherId ? _self.publisherId : publisherId // ignore: cast_nullable_to_non_nullable
as String,isMosqueVerified: null == isMosqueVerified ? _self.isMosqueVerified : isMosqueVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,burialLocation: freezed == burialLocation ? _self.burialLocation : burialLocation // ignore: cast_nullable_to_non_nullable
as String?,ageType: freezed == ageType ? _self.ageType : ageType // ignore: cast_nullable_to_non_nullable
as String?,funeralNotes: freezed == funeralNotes ? _self.funeralNotes : funeralNotes // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,prayedCount: freezed == prayedCount ? _self.prayedCount : prayedCount // ignore: cast_nullable_to_non_nullable
as int?,reportCount: freezed == reportCount ? _self.reportCount : reportCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
