// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annotation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnotationSummary {

 String? get id; String? get href; String? get text; DateTime? get created;@JsonKey(name: 'bookmark_id') String? get bookmarkId;@JsonKey(name: 'bookmark_href') String? get bookmarkHref;@JsonKey(name: 'bookmark_url') String? get bookmarkUrl;@JsonKey(name: 'bookmark_title') String? get bookmarkTitle;@JsonKey(name: 'bookmark_site_name') String? get bookmarkSiteName;
/// Create a copy of AnnotationSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnotationSummaryCopyWith<AnnotationSummary> get copyWith => _$AnnotationSummaryCopyWithImpl<AnnotationSummary>(this as AnnotationSummary, _$identity);

  /// Serializes this AnnotationSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnotationSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.href, href) || other.href == href)&&(identical(other.text, text) || other.text == text)&&(identical(other.created, created) || other.created == created)&&(identical(other.bookmarkId, bookmarkId) || other.bookmarkId == bookmarkId)&&(identical(other.bookmarkHref, bookmarkHref) || other.bookmarkHref == bookmarkHref)&&(identical(other.bookmarkUrl, bookmarkUrl) || other.bookmarkUrl == bookmarkUrl)&&(identical(other.bookmarkTitle, bookmarkTitle) || other.bookmarkTitle == bookmarkTitle)&&(identical(other.bookmarkSiteName, bookmarkSiteName) || other.bookmarkSiteName == bookmarkSiteName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,href,text,created,bookmarkId,bookmarkHref,bookmarkUrl,bookmarkTitle,bookmarkSiteName);

@override
String toString() {
  return 'AnnotationSummary(id: $id, href: $href, text: $text, created: $created, bookmarkId: $bookmarkId, bookmarkHref: $bookmarkHref, bookmarkUrl: $bookmarkUrl, bookmarkTitle: $bookmarkTitle, bookmarkSiteName: $bookmarkSiteName)';
}


}

/// @nodoc
abstract mixin class $AnnotationSummaryCopyWith<$Res>  {
  factory $AnnotationSummaryCopyWith(AnnotationSummary value, $Res Function(AnnotationSummary) _then) = _$AnnotationSummaryCopyWithImpl;
@useResult
$Res call({
 String? id, String? href, String? text, DateTime? created,@JsonKey(name: 'bookmark_id') String? bookmarkId,@JsonKey(name: 'bookmark_href') String? bookmarkHref,@JsonKey(name: 'bookmark_url') String? bookmarkUrl,@JsonKey(name: 'bookmark_title') String? bookmarkTitle,@JsonKey(name: 'bookmark_site_name') String? bookmarkSiteName
});




}
/// @nodoc
class _$AnnotationSummaryCopyWithImpl<$Res>
    implements $AnnotationSummaryCopyWith<$Res> {
  _$AnnotationSummaryCopyWithImpl(this._self, this._then);

  final AnnotationSummary _self;
  final $Res Function(AnnotationSummary) _then;

/// Create a copy of AnnotationSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? href = freezed,Object? text = freezed,Object? created = freezed,Object? bookmarkId = freezed,Object? bookmarkHref = freezed,Object? bookmarkUrl = freezed,Object? bookmarkTitle = freezed,Object? bookmarkSiteName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,bookmarkId: freezed == bookmarkId ? _self.bookmarkId : bookmarkId // ignore: cast_nullable_to_non_nullable
as String?,bookmarkHref: freezed == bookmarkHref ? _self.bookmarkHref : bookmarkHref // ignore: cast_nullable_to_non_nullable
as String?,bookmarkUrl: freezed == bookmarkUrl ? _self.bookmarkUrl : bookmarkUrl // ignore: cast_nullable_to_non_nullable
as String?,bookmarkTitle: freezed == bookmarkTitle ? _self.bookmarkTitle : bookmarkTitle // ignore: cast_nullable_to_non_nullable
as String?,bookmarkSiteName: freezed == bookmarkSiteName ? _self.bookmarkSiteName : bookmarkSiteName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AnnotationSummary implements AnnotationSummary {
  const _AnnotationSummary({this.id, this.href, this.text, this.created, @JsonKey(name: 'bookmark_id') this.bookmarkId, @JsonKey(name: 'bookmark_href') this.bookmarkHref, @JsonKey(name: 'bookmark_url') this.bookmarkUrl, @JsonKey(name: 'bookmark_title') this.bookmarkTitle, @JsonKey(name: 'bookmark_site_name') this.bookmarkSiteName});
  factory _AnnotationSummary.fromJson(Map<String, dynamic> json) => _$AnnotationSummaryFromJson(json);

@override final  String? id;
@override final  String? href;
@override final  String? text;
@override final  DateTime? created;
@override@JsonKey(name: 'bookmark_id') final  String? bookmarkId;
@override@JsonKey(name: 'bookmark_href') final  String? bookmarkHref;
@override@JsonKey(name: 'bookmark_url') final  String? bookmarkUrl;
@override@JsonKey(name: 'bookmark_title') final  String? bookmarkTitle;
@override@JsonKey(name: 'bookmark_site_name') final  String? bookmarkSiteName;

/// Create a copy of AnnotationSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnotationSummaryCopyWith<_AnnotationSummary> get copyWith => __$AnnotationSummaryCopyWithImpl<_AnnotationSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnotationSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnotationSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.href, href) || other.href == href)&&(identical(other.text, text) || other.text == text)&&(identical(other.created, created) || other.created == created)&&(identical(other.bookmarkId, bookmarkId) || other.bookmarkId == bookmarkId)&&(identical(other.bookmarkHref, bookmarkHref) || other.bookmarkHref == bookmarkHref)&&(identical(other.bookmarkUrl, bookmarkUrl) || other.bookmarkUrl == bookmarkUrl)&&(identical(other.bookmarkTitle, bookmarkTitle) || other.bookmarkTitle == bookmarkTitle)&&(identical(other.bookmarkSiteName, bookmarkSiteName) || other.bookmarkSiteName == bookmarkSiteName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,href,text,created,bookmarkId,bookmarkHref,bookmarkUrl,bookmarkTitle,bookmarkSiteName);

@override
String toString() {
  return 'AnnotationSummary(id: $id, href: $href, text: $text, created: $created, bookmarkId: $bookmarkId, bookmarkHref: $bookmarkHref, bookmarkUrl: $bookmarkUrl, bookmarkTitle: $bookmarkTitle, bookmarkSiteName: $bookmarkSiteName)';
}


}

/// @nodoc
abstract mixin class _$AnnotationSummaryCopyWith<$Res> implements $AnnotationSummaryCopyWith<$Res> {
  factory _$AnnotationSummaryCopyWith(_AnnotationSummary value, $Res Function(_AnnotationSummary) _then) = __$AnnotationSummaryCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? href, String? text, DateTime? created,@JsonKey(name: 'bookmark_id') String? bookmarkId,@JsonKey(name: 'bookmark_href') String? bookmarkHref,@JsonKey(name: 'bookmark_url') String? bookmarkUrl,@JsonKey(name: 'bookmark_title') String? bookmarkTitle,@JsonKey(name: 'bookmark_site_name') String? bookmarkSiteName
});




}
/// @nodoc
class __$AnnotationSummaryCopyWithImpl<$Res>
    implements _$AnnotationSummaryCopyWith<$Res> {
  __$AnnotationSummaryCopyWithImpl(this._self, this._then);

  final _AnnotationSummary _self;
  final $Res Function(_AnnotationSummary) _then;

/// Create a copy of AnnotationSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? href = freezed,Object? text = freezed,Object? created = freezed,Object? bookmarkId = freezed,Object? bookmarkHref = freezed,Object? bookmarkUrl = freezed,Object? bookmarkTitle = freezed,Object? bookmarkSiteName = freezed,}) {
  return _then(_AnnotationSummary(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,bookmarkId: freezed == bookmarkId ? _self.bookmarkId : bookmarkId // ignore: cast_nullable_to_non_nullable
as String?,bookmarkHref: freezed == bookmarkHref ? _self.bookmarkHref : bookmarkHref // ignore: cast_nullable_to_non_nullable
as String?,bookmarkUrl: freezed == bookmarkUrl ? _self.bookmarkUrl : bookmarkUrl // ignore: cast_nullable_to_non_nullable
as String?,bookmarkTitle: freezed == bookmarkTitle ? _self.bookmarkTitle : bookmarkTitle // ignore: cast_nullable_to_non_nullable
as String?,bookmarkSiteName: freezed == bookmarkSiteName ? _self.bookmarkSiteName : bookmarkSiteName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AnnotationInfo {

 String? get id;@JsonKey(name: 'start_selector') String? get startSelector;@JsonKey(name: 'start_offset') int? get startOffset;@JsonKey(name: 'end_selector') String? get endSelector;@JsonKey(name: 'end_offset') int? get endOffset; DateTime? get created; String? get text; String? get color;
/// Create a copy of AnnotationInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnotationInfoCopyWith<AnnotationInfo> get copyWith => _$AnnotationInfoCopyWithImpl<AnnotationInfo>(this as AnnotationInfo, _$identity);

  /// Serializes this AnnotationInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnotationInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.startSelector, startSelector) || other.startSelector == startSelector)&&(identical(other.startOffset, startOffset) || other.startOffset == startOffset)&&(identical(other.endSelector, endSelector) || other.endSelector == endSelector)&&(identical(other.endOffset, endOffset) || other.endOffset == endOffset)&&(identical(other.created, created) || other.created == created)&&(identical(other.text, text) || other.text == text)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startSelector,startOffset,endSelector,endOffset,created,text,color);

@override
String toString() {
  return 'AnnotationInfo(id: $id, startSelector: $startSelector, startOffset: $startOffset, endSelector: $endSelector, endOffset: $endOffset, created: $created, text: $text, color: $color)';
}


}

/// @nodoc
abstract mixin class $AnnotationInfoCopyWith<$Res>  {
  factory $AnnotationInfoCopyWith(AnnotationInfo value, $Res Function(AnnotationInfo) _then) = _$AnnotationInfoCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'start_selector') String? startSelector,@JsonKey(name: 'start_offset') int? startOffset,@JsonKey(name: 'end_selector') String? endSelector,@JsonKey(name: 'end_offset') int? endOffset, DateTime? created, String? text, String? color
});




}
/// @nodoc
class _$AnnotationInfoCopyWithImpl<$Res>
    implements $AnnotationInfoCopyWith<$Res> {
  _$AnnotationInfoCopyWithImpl(this._self, this._then);

  final AnnotationInfo _self;
  final $Res Function(AnnotationInfo) _then;

/// Create a copy of AnnotationInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? startSelector = freezed,Object? startOffset = freezed,Object? endSelector = freezed,Object? endOffset = freezed,Object? created = freezed,Object? text = freezed,Object? color = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,startSelector: freezed == startSelector ? _self.startSelector : startSelector // ignore: cast_nullable_to_non_nullable
as String?,startOffset: freezed == startOffset ? _self.startOffset : startOffset // ignore: cast_nullable_to_non_nullable
as int?,endSelector: freezed == endSelector ? _self.endSelector : endSelector // ignore: cast_nullable_to_non_nullable
as String?,endOffset: freezed == endOffset ? _self.endOffset : endOffset // ignore: cast_nullable_to_non_nullable
as int?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AnnotationInfo implements AnnotationInfo {
  const _AnnotationInfo({this.id, @JsonKey(name: 'start_selector') this.startSelector, @JsonKey(name: 'start_offset') this.startOffset, @JsonKey(name: 'end_selector') this.endSelector, @JsonKey(name: 'end_offset') this.endOffset, this.created, this.text, this.color});
  factory _AnnotationInfo.fromJson(Map<String, dynamic> json) => _$AnnotationInfoFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'start_selector') final  String? startSelector;
@override@JsonKey(name: 'start_offset') final  int? startOffset;
@override@JsonKey(name: 'end_selector') final  String? endSelector;
@override@JsonKey(name: 'end_offset') final  int? endOffset;
@override final  DateTime? created;
@override final  String? text;
@override final  String? color;

/// Create a copy of AnnotationInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnotationInfoCopyWith<_AnnotationInfo> get copyWith => __$AnnotationInfoCopyWithImpl<_AnnotationInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnotationInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnotationInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.startSelector, startSelector) || other.startSelector == startSelector)&&(identical(other.startOffset, startOffset) || other.startOffset == startOffset)&&(identical(other.endSelector, endSelector) || other.endSelector == endSelector)&&(identical(other.endOffset, endOffset) || other.endOffset == endOffset)&&(identical(other.created, created) || other.created == created)&&(identical(other.text, text) || other.text == text)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startSelector,startOffset,endSelector,endOffset,created,text,color);

@override
String toString() {
  return 'AnnotationInfo(id: $id, startSelector: $startSelector, startOffset: $startOffset, endSelector: $endSelector, endOffset: $endOffset, created: $created, text: $text, color: $color)';
}


}

/// @nodoc
abstract mixin class _$AnnotationInfoCopyWith<$Res> implements $AnnotationInfoCopyWith<$Res> {
  factory _$AnnotationInfoCopyWith(_AnnotationInfo value, $Res Function(_AnnotationInfo) _then) = __$AnnotationInfoCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'start_selector') String? startSelector,@JsonKey(name: 'start_offset') int? startOffset,@JsonKey(name: 'end_selector') String? endSelector,@JsonKey(name: 'end_offset') int? endOffset, DateTime? created, String? text, String? color
});




}
/// @nodoc
class __$AnnotationInfoCopyWithImpl<$Res>
    implements _$AnnotationInfoCopyWith<$Res> {
  __$AnnotationInfoCopyWithImpl(this._self, this._then);

  final _AnnotationInfo _self;
  final $Res Function(_AnnotationInfo) _then;

/// Create a copy of AnnotationInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? startSelector = freezed,Object? startOffset = freezed,Object? endSelector = freezed,Object? endOffset = freezed,Object? created = freezed,Object? text = freezed,Object? color = freezed,}) {
  return _then(_AnnotationInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,startSelector: freezed == startSelector ? _self.startSelector : startSelector // ignore: cast_nullable_to_non_nullable
as String?,startOffset: freezed == startOffset ? _self.startOffset : startOffset // ignore: cast_nullable_to_non_nullable
as int?,endSelector: freezed == endSelector ? _self.endSelector : endSelector // ignore: cast_nullable_to_non_nullable
as String?,endOffset: freezed == endOffset ? _self.endOffset : endOffset // ignore: cast_nullable_to_non_nullable
as int?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AnnotationCreate {

@JsonKey(name: 'start_selector') String get startSelector;@JsonKey(name: 'start_offset') int get startOffset;@JsonKey(name: 'end_selector') String get endSelector;@JsonKey(name: 'end_offset') int get endOffset; String get color;
/// Create a copy of AnnotationCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnotationCreateCopyWith<AnnotationCreate> get copyWith => _$AnnotationCreateCopyWithImpl<AnnotationCreate>(this as AnnotationCreate, _$identity);

  /// Serializes this AnnotationCreate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnotationCreate&&(identical(other.startSelector, startSelector) || other.startSelector == startSelector)&&(identical(other.startOffset, startOffset) || other.startOffset == startOffset)&&(identical(other.endSelector, endSelector) || other.endSelector == endSelector)&&(identical(other.endOffset, endOffset) || other.endOffset == endOffset)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startSelector,startOffset,endSelector,endOffset,color);

@override
String toString() {
  return 'AnnotationCreate(startSelector: $startSelector, startOffset: $startOffset, endSelector: $endSelector, endOffset: $endOffset, color: $color)';
}


}

/// @nodoc
abstract mixin class $AnnotationCreateCopyWith<$Res>  {
  factory $AnnotationCreateCopyWith(AnnotationCreate value, $Res Function(AnnotationCreate) _then) = _$AnnotationCreateCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'start_selector') String startSelector,@JsonKey(name: 'start_offset') int startOffset,@JsonKey(name: 'end_selector') String endSelector,@JsonKey(name: 'end_offset') int endOffset, String color
});




}
/// @nodoc
class _$AnnotationCreateCopyWithImpl<$Res>
    implements $AnnotationCreateCopyWith<$Res> {
  _$AnnotationCreateCopyWithImpl(this._self, this._then);

  final AnnotationCreate _self;
  final $Res Function(AnnotationCreate) _then;

/// Create a copy of AnnotationCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startSelector = null,Object? startOffset = null,Object? endSelector = null,Object? endOffset = null,Object? color = null,}) {
  return _then(_self.copyWith(
startSelector: null == startSelector ? _self.startSelector : startSelector // ignore: cast_nullable_to_non_nullable
as String,startOffset: null == startOffset ? _self.startOffset : startOffset // ignore: cast_nullable_to_non_nullable
as int,endSelector: null == endSelector ? _self.endSelector : endSelector // ignore: cast_nullable_to_non_nullable
as String,endOffset: null == endOffset ? _self.endOffset : endOffset // ignore: cast_nullable_to_non_nullable
as int,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AnnotationCreate implements AnnotationCreate {
  const _AnnotationCreate({@JsonKey(name: 'start_selector') required this.startSelector, @JsonKey(name: 'start_offset') required this.startOffset, @JsonKey(name: 'end_selector') required this.endSelector, @JsonKey(name: 'end_offset') required this.endOffset, required this.color});
  factory _AnnotationCreate.fromJson(Map<String, dynamic> json) => _$AnnotationCreateFromJson(json);

@override@JsonKey(name: 'start_selector') final  String startSelector;
@override@JsonKey(name: 'start_offset') final  int startOffset;
@override@JsonKey(name: 'end_selector') final  String endSelector;
@override@JsonKey(name: 'end_offset') final  int endOffset;
@override final  String color;

/// Create a copy of AnnotationCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnotationCreateCopyWith<_AnnotationCreate> get copyWith => __$AnnotationCreateCopyWithImpl<_AnnotationCreate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnotationCreateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnotationCreate&&(identical(other.startSelector, startSelector) || other.startSelector == startSelector)&&(identical(other.startOffset, startOffset) || other.startOffset == startOffset)&&(identical(other.endSelector, endSelector) || other.endSelector == endSelector)&&(identical(other.endOffset, endOffset) || other.endOffset == endOffset)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startSelector,startOffset,endSelector,endOffset,color);

@override
String toString() {
  return 'AnnotationCreate(startSelector: $startSelector, startOffset: $startOffset, endSelector: $endSelector, endOffset: $endOffset, color: $color)';
}


}

/// @nodoc
abstract mixin class _$AnnotationCreateCopyWith<$Res> implements $AnnotationCreateCopyWith<$Res> {
  factory _$AnnotationCreateCopyWith(_AnnotationCreate value, $Res Function(_AnnotationCreate) _then) = __$AnnotationCreateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'start_selector') String startSelector,@JsonKey(name: 'start_offset') int startOffset,@JsonKey(name: 'end_selector') String endSelector,@JsonKey(name: 'end_offset') int endOffset, String color
});




}
/// @nodoc
class __$AnnotationCreateCopyWithImpl<$Res>
    implements _$AnnotationCreateCopyWith<$Res> {
  __$AnnotationCreateCopyWithImpl(this._self, this._then);

  final _AnnotationCreate _self;
  final $Res Function(_AnnotationCreate) _then;

/// Create a copy of AnnotationCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startSelector = null,Object? startOffset = null,Object? endSelector = null,Object? endOffset = null,Object? color = null,}) {
  return _then(_AnnotationCreate(
startSelector: null == startSelector ? _self.startSelector : startSelector // ignore: cast_nullable_to_non_nullable
as String,startOffset: null == startOffset ? _self.startOffset : startOffset // ignore: cast_nullable_to_non_nullable
as int,endSelector: null == endSelector ? _self.endSelector : endSelector // ignore: cast_nullable_to_non_nullable
as String,endOffset: null == endOffset ? _self.endOffset : endOffset // ignore: cast_nullable_to_non_nullable
as int,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AnnotationUpdate {

 String get color;
/// Create a copy of AnnotationUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnotationUpdateCopyWith<AnnotationUpdate> get copyWith => _$AnnotationUpdateCopyWithImpl<AnnotationUpdate>(this as AnnotationUpdate, _$identity);

  /// Serializes this AnnotationUpdate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnotationUpdate&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'AnnotationUpdate(color: $color)';
}


}

/// @nodoc
abstract mixin class $AnnotationUpdateCopyWith<$Res>  {
  factory $AnnotationUpdateCopyWith(AnnotationUpdate value, $Res Function(AnnotationUpdate) _then) = _$AnnotationUpdateCopyWithImpl;
@useResult
$Res call({
 String color
});




}
/// @nodoc
class _$AnnotationUpdateCopyWithImpl<$Res>
    implements $AnnotationUpdateCopyWith<$Res> {
  _$AnnotationUpdateCopyWithImpl(this._self, this._then);

  final AnnotationUpdate _self;
  final $Res Function(AnnotationUpdate) _then;

/// Create a copy of AnnotationUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = null,}) {
  return _then(_self.copyWith(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AnnotationUpdate implements AnnotationUpdate {
  const _AnnotationUpdate({required this.color});
  factory _AnnotationUpdate.fromJson(Map<String, dynamic> json) => _$AnnotationUpdateFromJson(json);

@override final  String color;

/// Create a copy of AnnotationUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnotationUpdateCopyWith<_AnnotationUpdate> get copyWith => __$AnnotationUpdateCopyWithImpl<_AnnotationUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnotationUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnotationUpdate&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'AnnotationUpdate(color: $color)';
}


}

/// @nodoc
abstract mixin class _$AnnotationUpdateCopyWith<$Res> implements $AnnotationUpdateCopyWith<$Res> {
  factory _$AnnotationUpdateCopyWith(_AnnotationUpdate value, $Res Function(_AnnotationUpdate) _then) = __$AnnotationUpdateCopyWithImpl;
@override @useResult
$Res call({
 String color
});




}
/// @nodoc
class __$AnnotationUpdateCopyWithImpl<$Res>
    implements _$AnnotationUpdateCopyWith<$Res> {
  __$AnnotationUpdateCopyWithImpl(this._self, this._then);

  final _AnnotationUpdate _self;
  final $Res Function(_AnnotationUpdate) _then;

/// Create a copy of AnnotationUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_AnnotationUpdate(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AnnotationUpdateResponse {

 DateTime? get updated; List<AnnotationInfo>? get annotations;
/// Create a copy of AnnotationUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnotationUpdateResponseCopyWith<AnnotationUpdateResponse> get copyWith => _$AnnotationUpdateResponseCopyWithImpl<AnnotationUpdateResponse>(this as AnnotationUpdateResponse, _$identity);

  /// Serializes this AnnotationUpdateResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnotationUpdateResponse&&(identical(other.updated, updated) || other.updated == updated)&&const DeepCollectionEquality().equals(other.annotations, annotations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updated,const DeepCollectionEquality().hash(annotations));

@override
String toString() {
  return 'AnnotationUpdateResponse(updated: $updated, annotations: $annotations)';
}


}

/// @nodoc
abstract mixin class $AnnotationUpdateResponseCopyWith<$Res>  {
  factory $AnnotationUpdateResponseCopyWith(AnnotationUpdateResponse value, $Res Function(AnnotationUpdateResponse) _then) = _$AnnotationUpdateResponseCopyWithImpl;
@useResult
$Res call({
 DateTime? updated, List<AnnotationInfo>? annotations
});




}
/// @nodoc
class _$AnnotationUpdateResponseCopyWithImpl<$Res>
    implements $AnnotationUpdateResponseCopyWith<$Res> {
  _$AnnotationUpdateResponseCopyWithImpl(this._self, this._then);

  final AnnotationUpdateResponse _self;
  final $Res Function(AnnotationUpdateResponse) _then;

/// Create a copy of AnnotationUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updated = freezed,Object? annotations = freezed,}) {
  return _then(_self.copyWith(
updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,annotations: freezed == annotations ? _self.annotations : annotations // ignore: cast_nullable_to_non_nullable
as List<AnnotationInfo>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AnnotationUpdateResponse implements AnnotationUpdateResponse {
  const _AnnotationUpdateResponse({this.updated, final  List<AnnotationInfo>? annotations}): _annotations = annotations;
  factory _AnnotationUpdateResponse.fromJson(Map<String, dynamic> json) => _$AnnotationUpdateResponseFromJson(json);

@override final  DateTime? updated;
 final  List<AnnotationInfo>? _annotations;
@override List<AnnotationInfo>? get annotations {
  final value = _annotations;
  if (value == null) return null;
  if (_annotations is EqualUnmodifiableListView) return _annotations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AnnotationUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnotationUpdateResponseCopyWith<_AnnotationUpdateResponse> get copyWith => __$AnnotationUpdateResponseCopyWithImpl<_AnnotationUpdateResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnotationUpdateResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnotationUpdateResponse&&(identical(other.updated, updated) || other.updated == updated)&&const DeepCollectionEquality().equals(other._annotations, _annotations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updated,const DeepCollectionEquality().hash(_annotations));

@override
String toString() {
  return 'AnnotationUpdateResponse(updated: $updated, annotations: $annotations)';
}


}

/// @nodoc
abstract mixin class _$AnnotationUpdateResponseCopyWith<$Res> implements $AnnotationUpdateResponseCopyWith<$Res> {
  factory _$AnnotationUpdateResponseCopyWith(_AnnotationUpdateResponse value, $Res Function(_AnnotationUpdateResponse) _then) = __$AnnotationUpdateResponseCopyWithImpl;
@override @useResult
$Res call({
 DateTime? updated, List<AnnotationInfo>? annotations
});




}
/// @nodoc
class __$AnnotationUpdateResponseCopyWithImpl<$Res>
    implements _$AnnotationUpdateResponseCopyWith<$Res> {
  __$AnnotationUpdateResponseCopyWithImpl(this._self, this._then);

  final _AnnotationUpdateResponse _self;
  final $Res Function(_AnnotationUpdateResponse) _then;

/// Create a copy of AnnotationUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updated = freezed,Object? annotations = freezed,}) {
  return _then(_AnnotationUpdateResponse(
updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,annotations: freezed == annotations ? _self._annotations : annotations // ignore: cast_nullable_to_non_nullable
as List<AnnotationInfo>?,
  ));
}


}

// dart format on
