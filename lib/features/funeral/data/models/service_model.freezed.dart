// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceModel {

 String get id; ServiceType get type; String get title; String get contactPhone; String get governorate; String get area; bool get isFree; String get status;@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) DateTime get createdAt; String? get details; String? get approvedBy;@JsonKey(fromJson: _timestampFromJsonNullable, toJson: _timestampToJsonNullable) DateTime? get approvedAt;
/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceModelCopyWith<ServiceModel> get copyWith => _$ServiceModelCopyWithImpl<ServiceModel>(this as ServiceModel, _$identity);

  /// Serializes this ServiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.governorate, governorate) || other.governorate == governorate)&&(identical(other.area, area) || other.area == area)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.details, details) || other.details == details)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,contactPhone,governorate,area,isFree,status,createdAt,details,approvedBy,approvedAt);

@override
String toString() {
  return 'ServiceModel(id: $id, type: $type, title: $title, contactPhone: $contactPhone, governorate: $governorate, area: $area, isFree: $isFree, status: $status, createdAt: $createdAt, details: $details, approvedBy: $approvedBy, approvedAt: $approvedAt)';
}


}

/// @nodoc
abstract mixin class $ServiceModelCopyWith<$Res>  {
  factory $ServiceModelCopyWith(ServiceModel value, $Res Function(ServiceModel) _then) = _$ServiceModelCopyWithImpl;
@useResult
$Res call({
 String id, ServiceType type, String title, String contactPhone, String governorate, String area, bool isFree, String status,@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) DateTime createdAt, String? details, String? approvedBy,@JsonKey(fromJson: _timestampFromJsonNullable, toJson: _timestampToJsonNullable) DateTime? approvedAt
});




}
/// @nodoc
class _$ServiceModelCopyWithImpl<$Res>
    implements $ServiceModelCopyWith<$Res> {
  _$ServiceModelCopyWithImpl(this._self, this._then);

  final ServiceModel _self;
  final $Res Function(ServiceModel) _then;

/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? contactPhone = null,Object? governorate = null,Object? area = null,Object? isFree = null,Object? status = null,Object? createdAt = null,Object? details = freezed,Object? approvedBy = freezed,Object? approvedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ServiceType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,governorate: null == governorate ? _self.governorate : governorate // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceModel].
extension ServiceModelPatterns on ServiceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ServiceType type,  String title,  String contactPhone,  String governorate,  String area,  bool isFree,  String status, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)  DateTime createdAt,  String? details,  String? approvedBy, @JsonKey(fromJson: _timestampFromJsonNullable, toJson: _timestampToJsonNullable)  DateTime? approvedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceModel() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.contactPhone,_that.governorate,_that.area,_that.isFree,_that.status,_that.createdAt,_that.details,_that.approvedBy,_that.approvedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ServiceType type,  String title,  String contactPhone,  String governorate,  String area,  bool isFree,  String status, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)  DateTime createdAt,  String? details,  String? approvedBy, @JsonKey(fromJson: _timestampFromJsonNullable, toJson: _timestampToJsonNullable)  DateTime? approvedAt)  $default,) {final _that = this;
switch (_that) {
case _ServiceModel():
return $default(_that.id,_that.type,_that.title,_that.contactPhone,_that.governorate,_that.area,_that.isFree,_that.status,_that.createdAt,_that.details,_that.approvedBy,_that.approvedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ServiceType type,  String title,  String contactPhone,  String governorate,  String area,  bool isFree,  String status, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)  DateTime createdAt,  String? details,  String? approvedBy, @JsonKey(fromJson: _timestampFromJsonNullable, toJson: _timestampToJsonNullable)  DateTime? approvedAt)?  $default,) {final _that = this;
switch (_that) {
case _ServiceModel() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.contactPhone,_that.governorate,_that.area,_that.isFree,_that.status,_that.createdAt,_that.details,_that.approvedBy,_that.approvedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceModel extends ServiceModel {
  const _ServiceModel({required this.id, required this.type, required this.title, required this.contactPhone, required this.governorate, required this.area, required this.isFree, required this.status, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) required this.createdAt, this.details, this.approvedBy, @JsonKey(fromJson: _timestampFromJsonNullable, toJson: _timestampToJsonNullable) this.approvedAt}): super._();
  factory _ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

@override final  String id;
@override final  ServiceType type;
@override final  String title;
@override final  String contactPhone;
@override final  String governorate;
@override final  String area;
@override final  bool isFree;
@override final  String status;
@override@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) final  DateTime createdAt;
@override final  String? details;
@override final  String? approvedBy;
@override@JsonKey(fromJson: _timestampFromJsonNullable, toJson: _timestampToJsonNullable) final  DateTime? approvedAt;

/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceModelCopyWith<_ServiceModel> get copyWith => __$ServiceModelCopyWithImpl<_ServiceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.governorate, governorate) || other.governorate == governorate)&&(identical(other.area, area) || other.area == area)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.details, details) || other.details == details)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,contactPhone,governorate,area,isFree,status,createdAt,details,approvedBy,approvedAt);

@override
String toString() {
  return 'ServiceModel(id: $id, type: $type, title: $title, contactPhone: $contactPhone, governorate: $governorate, area: $area, isFree: $isFree, status: $status, createdAt: $createdAt, details: $details, approvedBy: $approvedBy, approvedAt: $approvedAt)';
}


}

/// @nodoc
abstract mixin class _$ServiceModelCopyWith<$Res> implements $ServiceModelCopyWith<$Res> {
  factory _$ServiceModelCopyWith(_ServiceModel value, $Res Function(_ServiceModel) _then) = __$ServiceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, ServiceType type, String title, String contactPhone, String governorate, String area, bool isFree, String status,@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) DateTime createdAt, String? details, String? approvedBy,@JsonKey(fromJson: _timestampFromJsonNullable, toJson: _timestampToJsonNullable) DateTime? approvedAt
});




}
/// @nodoc
class __$ServiceModelCopyWithImpl<$Res>
    implements _$ServiceModelCopyWith<$Res> {
  __$ServiceModelCopyWithImpl(this._self, this._then);

  final _ServiceModel _self;
  final $Res Function(_ServiceModel) _then;

/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? contactPhone = null,Object? governorate = null,Object? area = null,Object? isFree = null,Object? status = null,Object? createdAt = null,Object? details = freezed,Object? approvedBy = freezed,Object? approvedAt = freezed,}) {
  return _then(_ServiceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ServiceType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,governorate: null == governorate ? _self.governorate : governorate // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
