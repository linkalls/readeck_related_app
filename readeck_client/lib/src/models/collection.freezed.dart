// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CollectionSummary {

@override DateTime? get updated;@override String? get name;@override@JsonKey(name: 'is_pinned') bool? get isPinned;@override@JsonKey(name: 'is_deleted') bool? get isDeleted;@override String? get search;@override String? get title;@override String? get author;@override String? get site;@override List<String>? get type;@override List<String>? get labels;@override@JsonKey(name: 'read_status') List<String>? get readStatus;@override@JsonKey(name: 'is_marked') bool? get isMarked;@override@JsonKey(name: 'is_archived') bool? get isArchived;@override@JsonKey(name: 'range_start') String? get rangeStart;@override@JsonKey(name: 'range_end') String? get rangeEnd;
/// Create a copy of CollectionSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectionSummaryCopyWith<CollectionSummary> get copyWith => _$CollectionSummaryCopyWithImpl<CollectionSummary>(this as CollectionSummary, _$identity);

  /// Serializes this CollectionSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionSummary&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.name, name) || other.name == name)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.search, search) || other.search == search)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.site, site) || other.site == site)&&const DeepCollectionEquality().equals(other.type, type)&&const DeepCollectionEquality().equals(other.labels, labels)&&const DeepCollectionEquality().equals(other.readStatus, readStatus)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.rangeStart, rangeStart) || other.rangeStart == rangeStart)&&(identical(other.rangeEnd, rangeEnd) || other.rangeEnd == rangeEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updated,name,isPinned,isDeleted,search,title,author,site,const DeepCollectionEquality().hash(type),const DeepCollectionEquality().hash(labels),const DeepCollectionEquality().hash(readStatus),isMarked,isArchived,rangeStart,rangeEnd);

@override
String toString() {
  return 'CollectionSummary(updated: $updated, name: $name, isPinned: $isPinned, isDeleted: $isDeleted, search: $search, title: $title, author: $author, site: $site, type: $type, labels: $labels, readStatus: $readStatus, isMarked: $isMarked, isArchived: $isArchived, rangeStart: $rangeStart, rangeEnd: $rangeEnd)';
}


}

/// @nodoc
abstract mixin class $CollectionSummaryCopyWith<$Res>  {
  factory $CollectionSummaryCopyWith(CollectionSummary value, $Res Function(CollectionSummary) _then) = _$CollectionSummaryCopyWithImpl;
@useResult
$Res call({
@override DateTime? updated,@override String? name,@override@JsonKey(name: 'is_pinned') bool? isPinned,@override@JsonKey(name: 'is_deleted') bool? isDeleted,@override String? search,@override String? title,@override String? author,@override String? site,@override List<String>? type,@override List<String>? labels,@override@JsonKey(name: 'read_status') List<String>? readStatus,@override@JsonKey(name: 'is_marked') bool? isMarked,@override@JsonKey(name: 'is_archived') bool? isArchived,@override@JsonKey(name: 'range_start') String? rangeStart,@override@JsonKey(name: 'range_end') String? rangeEnd
});




}
/// @nodoc
class _$CollectionSummaryCopyWithImpl<$Res>
    implements $CollectionSummaryCopyWith<$Res> {
  _$CollectionSummaryCopyWithImpl(this._self, this._then);

  final CollectionSummary _self;
  final $Res Function(CollectionSummary) _then;

/// Create a copy of CollectionSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updated = freezed,Object? name = freezed,Object? isPinned = freezed,Object? isDeleted = freezed,Object? search = freezed,Object? title = freezed,Object? author = freezed,Object? site = freezed,Object? type = freezed,Object? labels = freezed,Object? readStatus = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? rangeStart = freezed,Object? rangeEnd = freezed,}) {
  return _then(_self.copyWith(
updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isPinned: freezed == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as List<String>?,labels: freezed == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,readStatus: freezed == readStatus ? _self.readStatus : readStatus // ignore: cast_nullable_to_non_nullable
as List<String>?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,rangeStart: freezed == rangeStart ? _self.rangeStart : rangeStart // ignore: cast_nullable_to_non_nullable
as String?,rangeEnd: freezed == rangeEnd ? _self.rangeEnd : rangeEnd // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CollectionSummary implements CollectionSummary {
  const _CollectionSummary({@override this.updated, @override this.name, @override@JsonKey(name: 'is_pinned') this.isPinned, @override@JsonKey(name: 'is_deleted') this.isDeleted, @override this.search, @override this.title, @override this.author, @override this.site, @override final  List<String>? type, @override final  List<String>? labels, @override@JsonKey(name: 'read_status') final  List<String>? readStatus, @override@JsonKey(name: 'is_marked') this.isMarked, @override@JsonKey(name: 'is_archived') this.isArchived, @override@JsonKey(name: 'range_start') this.rangeStart, @override@JsonKey(name: 'range_end') this.rangeEnd}): _type = type,_labels = labels,_readStatus = readStatus;
  factory _CollectionSummary.fromJson(Map<String, dynamic> json) => _$CollectionSummaryFromJson(json);

@override@override final  DateTime? updated;
@override@override final  String? name;
@override@override@JsonKey(name: 'is_pinned') final  bool? isPinned;
@override@override@JsonKey(name: 'is_deleted') final  bool? isDeleted;
@override@override final  String? search;
@override@override final  String? title;
@override@override final  String? author;
@override@override final  String? site;
 final  List<String>? _type;
@override@override List<String>? get type {
  final value = _type;
  if (value == null) return null;
  if (_type is EqualUnmodifiableListView) return _type;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _labels;
@override@override List<String>? get labels {
  final value = _labels;
  if (value == null) return null;
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _readStatus;
@override@override@JsonKey(name: 'read_status') List<String>? get readStatus {
  final value = _readStatus;
  if (value == null) return null;
  if (_readStatus is EqualUnmodifiableListView) return _readStatus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@override@JsonKey(name: 'is_marked') final  bool? isMarked;
@override@override@JsonKey(name: 'is_archived') final  bool? isArchived;
@override@override@JsonKey(name: 'range_start') final  String? rangeStart;
@override@override@JsonKey(name: 'range_end') final  String? rangeEnd;

/// Create a copy of CollectionSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectionSummaryCopyWith<_CollectionSummary> get copyWith => __$CollectionSummaryCopyWithImpl<_CollectionSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollectionSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollectionSummary&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.name, name) || other.name == name)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.search, search) || other.search == search)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.site, site) || other.site == site)&&const DeepCollectionEquality().equals(other._type, _type)&&const DeepCollectionEquality().equals(other._labels, _labels)&&const DeepCollectionEquality().equals(other._readStatus, _readStatus)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.rangeStart, rangeStart) || other.rangeStart == rangeStart)&&(identical(other.rangeEnd, rangeEnd) || other.rangeEnd == rangeEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updated,name,isPinned,isDeleted,search,title,author,site,const DeepCollectionEquality().hash(_type),const DeepCollectionEquality().hash(_labels),const DeepCollectionEquality().hash(_readStatus),isMarked,isArchived,rangeStart,rangeEnd);

@override
String toString() {
  return 'CollectionSummary(updated: $updated, name: $name, isPinned: $isPinned, isDeleted: $isDeleted, search: $search, title: $title, author: $author, site: $site, type: $type, labels: $labels, readStatus: $readStatus, isMarked: $isMarked, isArchived: $isArchived, rangeStart: $rangeStart, rangeEnd: $rangeEnd)';
}


}

/// @nodoc
abstract mixin class _$CollectionSummaryCopyWith<$Res> implements $CollectionSummaryCopyWith<$Res> {
  factory _$CollectionSummaryCopyWith(_CollectionSummary value, $Res Function(_CollectionSummary) _then) = __$CollectionSummaryCopyWithImpl;
@override @useResult
$Res call({
@override DateTime? updated,@override String? name,@override@JsonKey(name: 'is_pinned') bool? isPinned,@override@JsonKey(name: 'is_deleted') bool? isDeleted,@override String? search,@override String? title,@override String? author,@override String? site,@override List<String>? type,@override List<String>? labels,@override@JsonKey(name: 'read_status') List<String>? readStatus,@override@JsonKey(name: 'is_marked') bool? isMarked,@override@JsonKey(name: 'is_archived') bool? isArchived,@override@JsonKey(name: 'range_start') String? rangeStart,@override@JsonKey(name: 'range_end') String? rangeEnd
});




}
/// @nodoc
class __$CollectionSummaryCopyWithImpl<$Res>
    implements _$CollectionSummaryCopyWith<$Res> {
  __$CollectionSummaryCopyWithImpl(this._self, this._then);

  final _CollectionSummary _self;
  final $Res Function(_CollectionSummary) _then;

/// Create a copy of CollectionSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updated = freezed,Object? name = freezed,Object? isPinned = freezed,Object? isDeleted = freezed,Object? search = freezed,Object? title = freezed,Object? author = freezed,Object? site = freezed,Object? type = freezed,Object? labels = freezed,Object? readStatus = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? rangeStart = freezed,Object? rangeEnd = freezed,}) {
  return _then(_CollectionSummary(
updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isPinned: freezed == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self._type : type // ignore: cast_nullable_to_non_nullable
as List<String>?,labels: freezed == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,readStatus: freezed == readStatus ? _self._readStatus : readStatus // ignore: cast_nullable_to_non_nullable
as List<String>?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,rangeStart: freezed == rangeStart ? _self.rangeStart : rangeStart // ignore: cast_nullable_to_non_nullable
as String?,rangeEnd: freezed == rangeEnd ? _self.rangeEnd : rangeEnd // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CollectionInfo {

// Fields from ICollectionSummary
@override DateTime? get updated;@override String? get name;@override@JsonKey(name: 'is_pinned') bool? get isPinned;@override@JsonKey(name: 'is_deleted') bool? get isDeleted;@override String? get search;@override String? get title;@override String? get author;@override String? get site;@override List<String>? get type;@override List<String>? get labels;@override@JsonKey(name: 'read_status') List<String>? get readStatus;@override@JsonKey(name: 'is_marked') bool? get isMarked;@override@JsonKey(name: 'is_archived') bool? get isArchived;@override@JsonKey(name: 'range_start') String? get rangeStart;@override@JsonKey(name: 'range_end') String? get rangeEnd;// CollectionInfo specific fields
 String? get id; String? get href; DateTime? get created;
/// Create a copy of CollectionInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectionInfoCopyWith<CollectionInfo> get copyWith => _$CollectionInfoCopyWithImpl<CollectionInfo>(this as CollectionInfo, _$identity);

  /// Serializes this CollectionInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionInfo&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.name, name) || other.name == name)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.search, search) || other.search == search)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.site, site) || other.site == site)&&const DeepCollectionEquality().equals(other.type, type)&&const DeepCollectionEquality().equals(other.labels, labels)&&const DeepCollectionEquality().equals(other.readStatus, readStatus)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.rangeStart, rangeStart) || other.rangeStart == rangeStart)&&(identical(other.rangeEnd, rangeEnd) || other.rangeEnd == rangeEnd)&&(identical(other.id, id) || other.id == id)&&(identical(other.href, href) || other.href == href)&&(identical(other.created, created) || other.created == created));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updated,name,isPinned,isDeleted,search,title,author,site,const DeepCollectionEquality().hash(type),const DeepCollectionEquality().hash(labels),const DeepCollectionEquality().hash(readStatus),isMarked,isArchived,rangeStart,rangeEnd,id,href,created);

@override
String toString() {
  return 'CollectionInfo(updated: $updated, name: $name, isPinned: $isPinned, isDeleted: $isDeleted, search: $search, title: $title, author: $author, site: $site, type: $type, labels: $labels, readStatus: $readStatus, isMarked: $isMarked, isArchived: $isArchived, rangeStart: $rangeStart, rangeEnd: $rangeEnd, id: $id, href: $href, created: $created)';
}


}

/// @nodoc
abstract mixin class $CollectionInfoCopyWith<$Res>  {
  factory $CollectionInfoCopyWith(CollectionInfo value, $Res Function(CollectionInfo) _then) = _$CollectionInfoCopyWithImpl;
@useResult
$Res call({
@override DateTime? updated,@override String? name,@override@JsonKey(name: 'is_pinned') bool? isPinned,@override@JsonKey(name: 'is_deleted') bool? isDeleted,@override String? search,@override String? title,@override String? author,@override String? site,@override List<String>? type,@override List<String>? labels,@override@JsonKey(name: 'read_status') List<String>? readStatus,@override@JsonKey(name: 'is_marked') bool? isMarked,@override@JsonKey(name: 'is_archived') bool? isArchived,@override@JsonKey(name: 'range_start') String? rangeStart,@override@JsonKey(name: 'range_end') String? rangeEnd, String? id, String? href, DateTime? created
});




}
/// @nodoc
class _$CollectionInfoCopyWithImpl<$Res>
    implements $CollectionInfoCopyWith<$Res> {
  _$CollectionInfoCopyWithImpl(this._self, this._then);

  final CollectionInfo _self;
  final $Res Function(CollectionInfo) _then;

/// Create a copy of CollectionInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updated = freezed,Object? name = freezed,Object? isPinned = freezed,Object? isDeleted = freezed,Object? search = freezed,Object? title = freezed,Object? author = freezed,Object? site = freezed,Object? type = freezed,Object? labels = freezed,Object? readStatus = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? rangeStart = freezed,Object? rangeEnd = freezed,Object? id = freezed,Object? href = freezed,Object? created = freezed,}) {
  return _then(_self.copyWith(
updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isPinned: freezed == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as List<String>?,labels: freezed == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,readStatus: freezed == readStatus ? _self.readStatus : readStatus // ignore: cast_nullable_to_non_nullable
as List<String>?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,rangeStart: freezed == rangeStart ? _self.rangeStart : rangeStart // ignore: cast_nullable_to_non_nullable
as String?,rangeEnd: freezed == rangeEnd ? _self.rangeEnd : rangeEnd // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CollectionInfo implements CollectionInfo {
  const _CollectionInfo({@override this.updated, @override this.name, @override@JsonKey(name: 'is_pinned') this.isPinned, @override@JsonKey(name: 'is_deleted') this.isDeleted, @override this.search, @override this.title, @override this.author, @override this.site, @override final  List<String>? type, @override final  List<String>? labels, @override@JsonKey(name: 'read_status') final  List<String>? readStatus, @override@JsonKey(name: 'is_marked') this.isMarked, @override@JsonKey(name: 'is_archived') this.isArchived, @override@JsonKey(name: 'range_start') this.rangeStart, @override@JsonKey(name: 'range_end') this.rangeEnd, this.id, this.href, this.created}): _type = type,_labels = labels,_readStatus = readStatus;
  factory _CollectionInfo.fromJson(Map<String, dynamic> json) => _$CollectionInfoFromJson(json);

// Fields from ICollectionSummary
@override@override final  DateTime? updated;
@override@override final  String? name;
@override@override@JsonKey(name: 'is_pinned') final  bool? isPinned;
@override@override@JsonKey(name: 'is_deleted') final  bool? isDeleted;
@override@override final  String? search;
@override@override final  String? title;
@override@override final  String? author;
@override@override final  String? site;
 final  List<String>? _type;
@override@override List<String>? get type {
  final value = _type;
  if (value == null) return null;
  if (_type is EqualUnmodifiableListView) return _type;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _labels;
@override@override List<String>? get labels {
  final value = _labels;
  if (value == null) return null;
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _readStatus;
@override@override@JsonKey(name: 'read_status') List<String>? get readStatus {
  final value = _readStatus;
  if (value == null) return null;
  if (_readStatus is EqualUnmodifiableListView) return _readStatus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@override@JsonKey(name: 'is_marked') final  bool? isMarked;
@override@override@JsonKey(name: 'is_archived') final  bool? isArchived;
@override@override@JsonKey(name: 'range_start') final  String? rangeStart;
@override@override@JsonKey(name: 'range_end') final  String? rangeEnd;
// CollectionInfo specific fields
@override final  String? id;
@override final  String? href;
@override final  DateTime? created;

/// Create a copy of CollectionInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectionInfoCopyWith<_CollectionInfo> get copyWith => __$CollectionInfoCopyWithImpl<_CollectionInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollectionInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollectionInfo&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.name, name) || other.name == name)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.search, search) || other.search == search)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.site, site) || other.site == site)&&const DeepCollectionEquality().equals(other._type, _type)&&const DeepCollectionEquality().equals(other._labels, _labels)&&const DeepCollectionEquality().equals(other._readStatus, _readStatus)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.rangeStart, rangeStart) || other.rangeStart == rangeStart)&&(identical(other.rangeEnd, rangeEnd) || other.rangeEnd == rangeEnd)&&(identical(other.id, id) || other.id == id)&&(identical(other.href, href) || other.href == href)&&(identical(other.created, created) || other.created == created));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updated,name,isPinned,isDeleted,search,title,author,site,const DeepCollectionEquality().hash(_type),const DeepCollectionEquality().hash(_labels),const DeepCollectionEquality().hash(_readStatus),isMarked,isArchived,rangeStart,rangeEnd,id,href,created);

@override
String toString() {
  return 'CollectionInfo(updated: $updated, name: $name, isPinned: $isPinned, isDeleted: $isDeleted, search: $search, title: $title, author: $author, site: $site, type: $type, labels: $labels, readStatus: $readStatus, isMarked: $isMarked, isArchived: $isArchived, rangeStart: $rangeStart, rangeEnd: $rangeEnd, id: $id, href: $href, created: $created)';
}


}

/// @nodoc
abstract mixin class _$CollectionInfoCopyWith<$Res> implements $CollectionInfoCopyWith<$Res> {
  factory _$CollectionInfoCopyWith(_CollectionInfo value, $Res Function(_CollectionInfo) _then) = __$CollectionInfoCopyWithImpl;
@override @useResult
$Res call({
@override DateTime? updated,@override String? name,@override@JsonKey(name: 'is_pinned') bool? isPinned,@override@JsonKey(name: 'is_deleted') bool? isDeleted,@override String? search,@override String? title,@override String? author,@override String? site,@override List<String>? type,@override List<String>? labels,@override@JsonKey(name: 'read_status') List<String>? readStatus,@override@JsonKey(name: 'is_marked') bool? isMarked,@override@JsonKey(name: 'is_archived') bool? isArchived,@override@JsonKey(name: 'range_start') String? rangeStart,@override@JsonKey(name: 'range_end') String? rangeEnd, String? id, String? href, DateTime? created
});




}
/// @nodoc
class __$CollectionInfoCopyWithImpl<$Res>
    implements _$CollectionInfoCopyWith<$Res> {
  __$CollectionInfoCopyWithImpl(this._self, this._then);

  final _CollectionInfo _self;
  final $Res Function(_CollectionInfo) _then;

/// Create a copy of CollectionInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updated = freezed,Object? name = freezed,Object? isPinned = freezed,Object? isDeleted = freezed,Object? search = freezed,Object? title = freezed,Object? author = freezed,Object? site = freezed,Object? type = freezed,Object? labels = freezed,Object? readStatus = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? rangeStart = freezed,Object? rangeEnd = freezed,Object? id = freezed,Object? href = freezed,Object? created = freezed,}) {
  return _then(_CollectionInfo(
updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isPinned: freezed == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self._type : type // ignore: cast_nullable_to_non_nullable
as List<String>?,labels: freezed == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,readStatus: freezed == readStatus ? _self._readStatus : readStatus // ignore: cast_nullable_to_non_nullable
as List<String>?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,rangeStart: freezed == rangeStart ? _self.rangeStart : rangeStart // ignore: cast_nullable_to_non_nullable
as String?,rangeEnd: freezed == rangeEnd ? _self.rangeEnd : rangeEnd // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CollectionCreateOrUpdate {

 String? get name;@JsonKey(name: 'is_pinned') bool? get isPinned;@JsonKey(name: 'is_deleted') bool? get isDeleted; String? get search; String? get title; String? get author; String? get site; List<String>? get type; List<String>? get labels;@JsonKey(name: 'read_status') List<String>? get readStatus;@JsonKey(name: 'is_marked') bool? get isMarked;@JsonKey(name: 'is_archived') bool? get isArchived;@JsonKey(name: 'range_start') String? get rangeStart;@JsonKey(name: 'range_end') String? get rangeEnd;
/// Create a copy of CollectionCreateOrUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectionCreateOrUpdateCopyWith<CollectionCreateOrUpdate> get copyWith => _$CollectionCreateOrUpdateCopyWithImpl<CollectionCreateOrUpdate>(this as CollectionCreateOrUpdate, _$identity);

  /// Serializes this CollectionCreateOrUpdate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionCreateOrUpdate&&(identical(other.name, name) || other.name == name)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.search, search) || other.search == search)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.site, site) || other.site == site)&&const DeepCollectionEquality().equals(other.type, type)&&const DeepCollectionEquality().equals(other.labels, labels)&&const DeepCollectionEquality().equals(other.readStatus, readStatus)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.rangeStart, rangeStart) || other.rangeStart == rangeStart)&&(identical(other.rangeEnd, rangeEnd) || other.rangeEnd == rangeEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,isPinned,isDeleted,search,title,author,site,const DeepCollectionEquality().hash(type),const DeepCollectionEquality().hash(labels),const DeepCollectionEquality().hash(readStatus),isMarked,isArchived,rangeStart,rangeEnd);

@override
String toString() {
  return 'CollectionCreateOrUpdate(name: $name, isPinned: $isPinned, isDeleted: $isDeleted, search: $search, title: $title, author: $author, site: $site, type: $type, labels: $labels, readStatus: $readStatus, isMarked: $isMarked, isArchived: $isArchived, rangeStart: $rangeStart, rangeEnd: $rangeEnd)';
}


}

/// @nodoc
abstract mixin class $CollectionCreateOrUpdateCopyWith<$Res>  {
  factory $CollectionCreateOrUpdateCopyWith(CollectionCreateOrUpdate value, $Res Function(CollectionCreateOrUpdate) _then) = _$CollectionCreateOrUpdateCopyWithImpl;
@useResult
$Res call({
 String? name,@JsonKey(name: 'is_pinned') bool? isPinned,@JsonKey(name: 'is_deleted') bool? isDeleted, String? search, String? title, String? author, String? site, List<String>? type, List<String>? labels,@JsonKey(name: 'read_status') List<String>? readStatus,@JsonKey(name: 'is_marked') bool? isMarked,@JsonKey(name: 'is_archived') bool? isArchived,@JsonKey(name: 'range_start') String? rangeStart,@JsonKey(name: 'range_end') String? rangeEnd
});




}
/// @nodoc
class _$CollectionCreateOrUpdateCopyWithImpl<$Res>
    implements $CollectionCreateOrUpdateCopyWith<$Res> {
  _$CollectionCreateOrUpdateCopyWithImpl(this._self, this._then);

  final CollectionCreateOrUpdate _self;
  final $Res Function(CollectionCreateOrUpdate) _then;

/// Create a copy of CollectionCreateOrUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? isPinned = freezed,Object? isDeleted = freezed,Object? search = freezed,Object? title = freezed,Object? author = freezed,Object? site = freezed,Object? type = freezed,Object? labels = freezed,Object? readStatus = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? rangeStart = freezed,Object? rangeEnd = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isPinned: freezed == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as List<String>?,labels: freezed == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,readStatus: freezed == readStatus ? _self.readStatus : readStatus // ignore: cast_nullable_to_non_nullable
as List<String>?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,rangeStart: freezed == rangeStart ? _self.rangeStart : rangeStart // ignore: cast_nullable_to_non_nullable
as String?,rangeEnd: freezed == rangeEnd ? _self.rangeEnd : rangeEnd // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CollectionCreateOrUpdate implements CollectionCreateOrUpdate {
  const _CollectionCreateOrUpdate({this.name, @JsonKey(name: 'is_pinned') this.isPinned, @JsonKey(name: 'is_deleted') this.isDeleted, this.search, this.title, this.author, this.site, final  List<String>? type, final  List<String>? labels, @JsonKey(name: 'read_status') final  List<String>? readStatus, @JsonKey(name: 'is_marked') this.isMarked, @JsonKey(name: 'is_archived') this.isArchived, @JsonKey(name: 'range_start') this.rangeStart, @JsonKey(name: 'range_end') this.rangeEnd}): _type = type,_labels = labels,_readStatus = readStatus;
  factory _CollectionCreateOrUpdate.fromJson(Map<String, dynamic> json) => _$CollectionCreateOrUpdateFromJson(json);

@override final  String? name;
@override@JsonKey(name: 'is_pinned') final  bool? isPinned;
@override@JsonKey(name: 'is_deleted') final  bool? isDeleted;
@override final  String? search;
@override final  String? title;
@override final  String? author;
@override final  String? site;
 final  List<String>? _type;
@override List<String>? get type {
  final value = _type;
  if (value == null) return null;
  if (_type is EqualUnmodifiableListView) return _type;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _labels;
@override List<String>? get labels {
  final value = _labels;
  if (value == null) return null;
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _readStatus;
@override@JsonKey(name: 'read_status') List<String>? get readStatus {
  final value = _readStatus;
  if (value == null) return null;
  if (_readStatus is EqualUnmodifiableListView) return _readStatus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'is_marked') final  bool? isMarked;
@override@JsonKey(name: 'is_archived') final  bool? isArchived;
@override@JsonKey(name: 'range_start') final  String? rangeStart;
@override@JsonKey(name: 'range_end') final  String? rangeEnd;

/// Create a copy of CollectionCreateOrUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectionCreateOrUpdateCopyWith<_CollectionCreateOrUpdate> get copyWith => __$CollectionCreateOrUpdateCopyWithImpl<_CollectionCreateOrUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollectionCreateOrUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollectionCreateOrUpdate&&(identical(other.name, name) || other.name == name)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.search, search) || other.search == search)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.site, site) || other.site == site)&&const DeepCollectionEquality().equals(other._type, _type)&&const DeepCollectionEquality().equals(other._labels, _labels)&&const DeepCollectionEquality().equals(other._readStatus, _readStatus)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.rangeStart, rangeStart) || other.rangeStart == rangeStart)&&(identical(other.rangeEnd, rangeEnd) || other.rangeEnd == rangeEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,isPinned,isDeleted,search,title,author,site,const DeepCollectionEquality().hash(_type),const DeepCollectionEquality().hash(_labels),const DeepCollectionEquality().hash(_readStatus),isMarked,isArchived,rangeStart,rangeEnd);

@override
String toString() {
  return 'CollectionCreateOrUpdate(name: $name, isPinned: $isPinned, isDeleted: $isDeleted, search: $search, title: $title, author: $author, site: $site, type: $type, labels: $labels, readStatus: $readStatus, isMarked: $isMarked, isArchived: $isArchived, rangeStart: $rangeStart, rangeEnd: $rangeEnd)';
}


}

/// @nodoc
abstract mixin class _$CollectionCreateOrUpdateCopyWith<$Res> implements $CollectionCreateOrUpdateCopyWith<$Res> {
  factory _$CollectionCreateOrUpdateCopyWith(_CollectionCreateOrUpdate value, $Res Function(_CollectionCreateOrUpdate) _then) = __$CollectionCreateOrUpdateCopyWithImpl;
@override @useResult
$Res call({
 String? name,@JsonKey(name: 'is_pinned') bool? isPinned,@JsonKey(name: 'is_deleted') bool? isDeleted, String? search, String? title, String? author, String? site, List<String>? type, List<String>? labels,@JsonKey(name: 'read_status') List<String>? readStatus,@JsonKey(name: 'is_marked') bool? isMarked,@JsonKey(name: 'is_archived') bool? isArchived,@JsonKey(name: 'range_start') String? rangeStart,@JsonKey(name: 'range_end') String? rangeEnd
});




}
/// @nodoc
class __$CollectionCreateOrUpdateCopyWithImpl<$Res>
    implements _$CollectionCreateOrUpdateCopyWith<$Res> {
  __$CollectionCreateOrUpdateCopyWithImpl(this._self, this._then);

  final _CollectionCreateOrUpdate _self;
  final $Res Function(_CollectionCreateOrUpdate) _then;

/// Create a copy of CollectionCreateOrUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? isPinned = freezed,Object? isDeleted = freezed,Object? search = freezed,Object? title = freezed,Object? author = freezed,Object? site = freezed,Object? type = freezed,Object? labels = freezed,Object? readStatus = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? rangeStart = freezed,Object? rangeEnd = freezed,}) {
  return _then(_CollectionCreateOrUpdate(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isPinned: freezed == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self._type : type // ignore: cast_nullable_to_non_nullable
as List<String>?,labels: freezed == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,readStatus: freezed == readStatus ? _self._readStatus : readStatus // ignore: cast_nullable_to_non_nullable
as List<String>?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,rangeStart: freezed == rangeStart ? _self.rangeStart : rangeStart // ignore: cast_nullable_to_non_nullable
as String?,rangeEnd: freezed == rangeEnd ? _self.rangeEnd : rangeEnd // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
