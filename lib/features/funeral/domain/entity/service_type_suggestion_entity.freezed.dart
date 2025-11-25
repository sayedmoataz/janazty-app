// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_type_suggestion_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceTypeSuggestionEntity {

 String get id; String get serviceName; String get description; String get example; DateTime get createdAt; String get status;
/// Create a copy of ServiceTypeSuggestionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceTypeSuggestionEntityCopyWith<ServiceTypeSuggestionEntity> get copyWith => _$ServiceTypeSuggestionEntityCopyWithImpl<ServiceTypeSuggestionEntity>(this as ServiceTypeSuggestionEntity, _$identity);

  /// Serializes this ServiceTypeSuggestionEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceTypeSuggestionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.description, description) || other.description == description)&&(identical(other.example, example) || other.example == example)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceName,description,example,createdAt,status);

@override
String toString() {
  return 'ServiceTypeSuggestionEntity(id: $id, serviceName: $serviceName, description: $description, example: $example, createdAt: $createdAt, status: $status)';
}


}

/// @nodoc
abstract mixin class $ServiceTypeSuggestionEntityCopyWith<$Res>  {
  factory $ServiceTypeSuggestionEntityCopyWith(ServiceTypeSuggestionEntity value, $Res Function(ServiceTypeSuggestionEntity) _then) = _$ServiceTypeSuggestionEntityCopyWithImpl;
@useResult
$Res call({
 String id, String serviceName, String description, String example, DateTime createdAt, String status
});




}
/// @nodoc
class _$ServiceTypeSuggestionEntityCopyWithImpl<$Res>
    implements $ServiceTypeSuggestionEntityCopyWith<$Res> {
  _$ServiceTypeSuggestionEntityCopyWithImpl(this._self, this._then);

  final ServiceTypeSuggestionEntity _self;
  final $Res Function(ServiceTypeSuggestionEntity) _then;

/// Create a copy of ServiceTypeSuggestionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serviceName = null,Object? description = null,Object? example = null,Object? createdAt = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceTypeSuggestionEntity].
extension ServiceTypeSuggestionEntityPatterns on ServiceTypeSuggestionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceTypeSuggestionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceTypeSuggestionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceTypeSuggestionEntity value)  $default,){
final _that = this;
switch (_that) {
case _ServiceTypeSuggestionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceTypeSuggestionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceTypeSuggestionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String serviceName,  String description,  String example,  DateTime createdAt,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceTypeSuggestionEntity() when $default != null:
return $default(_that.id,_that.serviceName,_that.description,_that.example,_that.createdAt,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String serviceName,  String description,  String example,  DateTime createdAt,  String status)  $default,) {final _that = this;
switch (_that) {
case _ServiceTypeSuggestionEntity():
return $default(_that.id,_that.serviceName,_that.description,_that.example,_that.createdAt,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String serviceName,  String description,  String example,  DateTime createdAt,  String status)?  $default,) {final _that = this;
switch (_that) {
case _ServiceTypeSuggestionEntity() when $default != null:
return $default(_that.id,_that.serviceName,_that.description,_that.example,_that.createdAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceTypeSuggestionEntity implements ServiceTypeSuggestionEntity {
  const _ServiceTypeSuggestionEntity({required this.id, required this.serviceName, required this.description, required this.example, required this.createdAt, required this.status});
  factory _ServiceTypeSuggestionEntity.fromJson(Map<String, dynamic> json) => _$ServiceTypeSuggestionEntityFromJson(json);

@override final  String id;
@override final  String serviceName;
@override final  String description;
@override final  String example;
@override final  DateTime createdAt;
@override final  String status;

/// Create a copy of ServiceTypeSuggestionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceTypeSuggestionEntityCopyWith<_ServiceTypeSuggestionEntity> get copyWith => __$ServiceTypeSuggestionEntityCopyWithImpl<_ServiceTypeSuggestionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceTypeSuggestionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceTypeSuggestionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.description, description) || other.description == description)&&(identical(other.example, example) || other.example == example)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceName,description,example,createdAt,status);

@override
String toString() {
  return 'ServiceTypeSuggestionEntity(id: $id, serviceName: $serviceName, description: $description, example: $example, createdAt: $createdAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ServiceTypeSuggestionEntityCopyWith<$Res> implements $ServiceTypeSuggestionEntityCopyWith<$Res> {
  factory _$ServiceTypeSuggestionEntityCopyWith(_ServiceTypeSuggestionEntity value, $Res Function(_ServiceTypeSuggestionEntity) _then) = __$ServiceTypeSuggestionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String serviceName, String description, String example, DateTime createdAt, String status
});




}
/// @nodoc
class __$ServiceTypeSuggestionEntityCopyWithImpl<$Res>
    implements _$ServiceTypeSuggestionEntityCopyWith<$Res> {
  __$ServiceTypeSuggestionEntityCopyWithImpl(this._self, this._then);

  final _ServiceTypeSuggestionEntity _self;
  final $Res Function(_ServiceTypeSuggestionEntity) _then;

/// Create a copy of ServiceTypeSuggestionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceName = null,Object? description = null,Object? example = null,Object? createdAt = null,Object? status = null,}) {
  return _then(_ServiceTypeSuggestionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
