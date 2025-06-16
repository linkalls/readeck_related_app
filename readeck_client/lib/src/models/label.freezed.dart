// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'label.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LabelInfo {

 String? get name; int? get count; String? get href;@JsonKey(name: 'href_bookmarks') String? get hrefBookmarks;
/// Create a copy of LabelInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelInfoCopyWith<LabelInfo> get copyWith => _$LabelInfoCopyWithImpl<LabelInfo>(this as LabelInfo, _$identity);

  /// Serializes this LabelInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.count, count) || other.count == count)&&(identical(other.href, href) || other.href == href)&&(identical(other.hrefBookmarks, hrefBookmarks) || other.hrefBookmarks == hrefBookmarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,count,href,hrefBookmarks);

@override
String toString() {
  return 'LabelInfo(name: $name, count: $count, href: $href, hrefBookmarks: $hrefBookmarks)';
}


}

/// @nodoc
abstract mixin class $LabelInfoCopyWith<$Res>  {
  factory $LabelInfoCopyWith(LabelInfo value, $Res Function(LabelInfo) _then) = _$LabelInfoCopyWithImpl;
@useResult
$Res call({
 String? name, int? count, String? href,@JsonKey(name: 'href_bookmarks') String? hrefBookmarks
});




}
/// @nodoc
class _$LabelInfoCopyWithImpl<$Res>
    implements $LabelInfoCopyWith<$Res> {
  _$LabelInfoCopyWithImpl(this._self, this._then);

  final LabelInfo _self;
  final $Res Function(LabelInfo) _then;

/// Create a copy of LabelInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? count = freezed,Object? href = freezed,Object? hrefBookmarks = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,hrefBookmarks: freezed == hrefBookmarks ? _self.hrefBookmarks : hrefBookmarks // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LabelInfo implements LabelInfo {
  const _LabelInfo({this.name, this.count, this.href, @JsonKey(name: 'href_bookmarks') this.hrefBookmarks});
  factory _LabelInfo.fromJson(Map<String, dynamic> json) => _$LabelInfoFromJson(json);

@override final  String? name;
@override final  int? count;
@override final  String? href;
@override@JsonKey(name: 'href_bookmarks') final  String? hrefBookmarks;

/// Create a copy of LabelInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabelInfoCopyWith<_LabelInfo> get copyWith => __$LabelInfoCopyWithImpl<_LabelInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabelInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabelInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.count, count) || other.count == count)&&(identical(other.href, href) || other.href == href)&&(identical(other.hrefBookmarks, hrefBookmarks) || other.hrefBookmarks == hrefBookmarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,count,href,hrefBookmarks);

@override
String toString() {
  return 'LabelInfo(name: $name, count: $count, href: $href, hrefBookmarks: $hrefBookmarks)';
}


}

/// @nodoc
abstract mixin class _$LabelInfoCopyWith<$Res> implements $LabelInfoCopyWith<$Res> {
  factory _$LabelInfoCopyWith(_LabelInfo value, $Res Function(_LabelInfo) _then) = __$LabelInfoCopyWithImpl;
@override @useResult
$Res call({
 String? name, int? count, String? href,@JsonKey(name: 'href_bookmarks') String? hrefBookmarks
});




}
/// @nodoc
class __$LabelInfoCopyWithImpl<$Res>
    implements _$LabelInfoCopyWith<$Res> {
  __$LabelInfoCopyWithImpl(this._self, this._then);

  final _LabelInfo _self;
  final $Res Function(_LabelInfo) _then;

/// Create a copy of LabelInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? count = freezed,Object? href = freezed,Object? hrefBookmarks = freezed,}) {
  return _then(_LabelInfo(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,hrefBookmarks: freezed == hrefBookmarks ? _self.hrefBookmarks : hrefBookmarks // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LabelUpdate {

 String? get name;
/// Create a copy of LabelUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelUpdateCopyWith<LabelUpdate> get copyWith => _$LabelUpdateCopyWithImpl<LabelUpdate>(this as LabelUpdate, _$identity);

  /// Serializes this LabelUpdate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelUpdate&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'LabelUpdate(name: $name)';
}


}

/// @nodoc
abstract mixin class $LabelUpdateCopyWith<$Res>  {
  factory $LabelUpdateCopyWith(LabelUpdate value, $Res Function(LabelUpdate) _then) = _$LabelUpdateCopyWithImpl;
@useResult
$Res call({
 String? name
});




}
/// @nodoc
class _$LabelUpdateCopyWithImpl<$Res>
    implements $LabelUpdateCopyWith<$Res> {
  _$LabelUpdateCopyWithImpl(this._self, this._then);

  final LabelUpdate _self;
  final $Res Function(LabelUpdate) _then;

/// Create a copy of LabelUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LabelUpdate implements LabelUpdate {
  const _LabelUpdate({this.name});
  factory _LabelUpdate.fromJson(Map<String, dynamic> json) => _$LabelUpdateFromJson(json);

@override final  String? name;

/// Create a copy of LabelUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabelUpdateCopyWith<_LabelUpdate> get copyWith => __$LabelUpdateCopyWithImpl<_LabelUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabelUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabelUpdate&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'LabelUpdate(name: $name)';
}


}

/// @nodoc
abstract mixin class _$LabelUpdateCopyWith<$Res> implements $LabelUpdateCopyWith<$Res> {
  factory _$LabelUpdateCopyWith(_LabelUpdate value, $Res Function(_LabelUpdate) _then) = __$LabelUpdateCopyWithImpl;
@override @useResult
$Res call({
 String? name
});




}
/// @nodoc
class __$LabelUpdateCopyWithImpl<$Res>
    implements _$LabelUpdateCopyWith<$Res> {
  __$LabelUpdateCopyWithImpl(this._self, this._then);

  final _LabelUpdate _self;
  final $Res Function(_LabelUpdate) _then;

/// Create a copy of LabelUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,}) {
  return _then(_LabelUpdate(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
