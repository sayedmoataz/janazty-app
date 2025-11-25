// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_type_suggestion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceTypeSuggestionModel {

 String get id; String get serviceName; String get description; String get example;@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) DateTime get createdAt; String get status;
/// Create a copy of ServiceTypeSuggestionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceTypeSuggestionModelCopyWith<ServiceTypeSuggestionModel> get copyWith => _$ServiceTypeSuggestionModelCopyWithImpl<ServiceTypeSuggestionModel>(this as ServiceTypeSuggestionModel, _$identity);

  /// Serializes this ServiceTypeSuggestionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceTypeSuggestionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.description, description) || other.description == description)&&(identical(other.example, example) || other.example == example)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceName,description,example,createdAt,status);

@override
String toString() {
  return 'ServiceTypeSuggestionModel(id: $id, serviceName: $serviceName, description: $description, example: $example, createdAt: $createdAt, status: $status)';
}


}

/// @nodoc
abstract mixin class $ServiceTypeSuggestionModelCopyWith<$Res>  {
  factory $ServiceTypeSuggestionModelCopyWith(ServiceTypeSuggestionModel value, $Res Function(ServiceTypeSuggestionModel) _then) = _$ServiceTypeSuggestionModelCopyWithImpl;
@useResult
$Res call({
 String id, String serviceName, String description, String example,@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) DateTime createdAt, String status
});




}
/// @nodoc
class _$ServiceTypeSuggestionModelCopyWithImpl<$Res>
    implements $ServiceTypeSuggestionModelCopyWith<$Res> {
  _$ServiceTypeSuggestionModelCopyWithImpl(this._self, this._then);

  final ServiceTypeSuggestionModel _self;
  final $Res Function(ServiceTypeSuggestionModel) _then;

/// Create a copy of ServiceTypeSuggestionModel
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


/// Adds pattern-matching-related methods to [ServiceTypeSuggestionModel].
extension ServiceTypeSuggestionModelPatterns on ServiceTypeSuggestionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceTypeSuggestionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceTypeSuggestionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceTypeSuggestionModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceTypeSuggestionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceTypeSuggestionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceTypeSuggestionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String serviceName,  String description,  String example, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)  DateTime createdAt,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceTypeSuggestionModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String serviceName,  String description,  String example, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)  DateTime createdAt,  String status)  $default,) {final _that = this;
switch (_that) {
case _ServiceTypeSuggestionModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String serviceName,  String description,  String example, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)  DateTime createdAt,  String status)?  $default,) {final _that = this;
switch (_that) {
case _ServiceTypeSuggestionModel() when $default != null:
return $default(_that.id,_that.serviceName,_that.description,_that.example,_that.createdAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceTypeSuggestionModel extends ServiceTypeSuggestionModel {
  const _ServiceTypeSuggestionModel({required this.id, required this.serviceName, required this.description, required this.example, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) required this.createdAt, required this.status}): super._();
  factory _ServiceTypeSuggestionModel.fromJson(Map<String, dynamic> json) => _$ServiceTypeSuggestionModelFromJson(json);

@override final  String id;
@override final  String serviceName;
@override final  String description;
@override final  String example;
@override@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) final  DateTime createdAt;
@override final  String status;

/// Create a copy of ServiceTypeSuggestionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceTypeSuggestionModelCopyWith<_ServiceTypeSuggestionModel> get copyWith => __$ServiceTypeSuggestionModelCopyWithImpl<_ServiceTypeSuggestionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceTypeSuggestionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceTypeSuggestionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.description, description) || other.description == description)&&(identical(other.example, example) || other.example == example)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceName,description,example,createdAt,status);

@override
String toString() {
  return 'ServiceTypeSuggestionModel(id: $id, serviceName: $serviceName, description: $description, example: $example, createdAt: $createdAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ServiceTypeSuggestionModelCopyWith<$Res> implements $ServiceTypeSuggestionModelCopyWith<$Res> {
  factory _$ServiceTypeSuggestionModelCopyWith(_ServiceTypeSuggestionModel value, $Res Function(_ServiceTypeSuggestionModel) _then) = __$ServiceTypeSuggestionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String serviceName, String description, String example,@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) DateTime createdAt, String status
});




}
/// @nodoc
class __$ServiceTypeSuggestionModelCopyWithImpl<$Res>
    implements _$ServiceTypeSuggestionModelCopyWith<$Res> {
  __$ServiceTypeSuggestionModelCopyWithImpl(this._self, this._then);

  final _ServiceTypeSuggestionModel _self;
  final $Res Function(_ServiceTypeSuggestionModel) _then;

/// Create a copy of ServiceTypeSuggestionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceName = null,Object? description = null,Object? example = null,Object? createdAt = null,Object? status = null,}) {
  return _then(_ServiceTypeSuggestionModel(
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
