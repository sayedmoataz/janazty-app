// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prayer_guide_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrayerGuideModel {

 String get id; String get title; String get textContent; int get order; String get category; String? get audioUrl;
/// Create a copy of PrayerGuideModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrayerGuideModelCopyWith<PrayerGuideModel> get copyWith => _$PrayerGuideModelCopyWithImpl<PrayerGuideModel>(this as PrayerGuideModel, _$identity);

  /// Serializes this PrayerGuideModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerGuideModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.textContent, textContent) || other.textContent == textContent)&&(identical(other.order, order) || other.order == order)&&(identical(other.category, category) || other.category == category)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,textContent,order,category,audioUrl);

@override
String toString() {
  return 'PrayerGuideModel(id: $id, title: $title, textContent: $textContent, order: $order, category: $category, audioUrl: $audioUrl)';
}


}

/// @nodoc
abstract mixin class $PrayerGuideModelCopyWith<$Res>  {
  factory $PrayerGuideModelCopyWith(PrayerGuideModel value, $Res Function(PrayerGuideModel) _then) = _$PrayerGuideModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String textContent, int order, String category, String? audioUrl
});




}
/// @nodoc
class _$PrayerGuideModelCopyWithImpl<$Res>
    implements $PrayerGuideModelCopyWith<$Res> {
  _$PrayerGuideModelCopyWithImpl(this._self, this._then);

  final PrayerGuideModel _self;
  final $Res Function(PrayerGuideModel) _then;

/// Create a copy of PrayerGuideModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? textContent = null,Object? order = null,Object? category = null,Object? audioUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,textContent: null == textContent ? _self.textContent : textContent // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrayerGuideModel].
extension PrayerGuideModelPatterns on PrayerGuideModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrayerGuideModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrayerGuideModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrayerGuideModel value)  $default,){
final _that = this;
switch (_that) {
case _PrayerGuideModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrayerGuideModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrayerGuideModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String textContent,  int order,  String category,  String? audioUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrayerGuideModel() when $default != null:
return $default(_that.id,_that.title,_that.textContent,_that.order,_that.category,_that.audioUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String textContent,  int order,  String category,  String? audioUrl)  $default,) {final _that = this;
switch (_that) {
case _PrayerGuideModel():
return $default(_that.id,_that.title,_that.textContent,_that.order,_that.category,_that.audioUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String textContent,  int order,  String category,  String? audioUrl)?  $default,) {final _that = this;
switch (_that) {
case _PrayerGuideModel() when $default != null:
return $default(_that.id,_that.title,_that.textContent,_that.order,_that.category,_that.audioUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrayerGuideModel extends PrayerGuideModel {
  const _PrayerGuideModel({required this.id, required this.title, required this.textContent, required this.order, required this.category, this.audioUrl}): super._();
  factory _PrayerGuideModel.fromJson(Map<String, dynamic> json) => _$PrayerGuideModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String textContent;
@override final  int order;
@override final  String category;
@override final  String? audioUrl;

/// Create a copy of PrayerGuideModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrayerGuideModelCopyWith<_PrayerGuideModel> get copyWith => __$PrayerGuideModelCopyWithImpl<_PrayerGuideModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrayerGuideModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrayerGuideModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.textContent, textContent) || other.textContent == textContent)&&(identical(other.order, order) || other.order == order)&&(identical(other.category, category) || other.category == category)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,textContent,order,category,audioUrl);

@override
String toString() {
  return 'PrayerGuideModel(id: $id, title: $title, textContent: $textContent, order: $order, category: $category, audioUrl: $audioUrl)';
}


}

/// @nodoc
abstract mixin class _$PrayerGuideModelCopyWith<$Res> implements $PrayerGuideModelCopyWith<$Res> {
  factory _$PrayerGuideModelCopyWith(_PrayerGuideModel value, $Res Function(_PrayerGuideModel) _then) = __$PrayerGuideModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String textContent, int order, String category, String? audioUrl
});




}
/// @nodoc
class __$PrayerGuideModelCopyWithImpl<$Res>
    implements _$PrayerGuideModelCopyWith<$Res> {
  __$PrayerGuideModelCopyWithImpl(this._self, this._then);

  final _PrayerGuideModel _self;
  final $Res Function(_PrayerGuideModel) _then;

/// Create a copy of PrayerGuideModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? textContent = null,Object? order = null,Object? category = null,Object? audioUrl = freezed,}) {
  return _then(_PrayerGuideModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,textContent: null == textContent ? _self.textContent : textContent // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
