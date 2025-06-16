// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkResource {

 String? get src;
/// Create a copy of BookmarkResource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkResourceCopyWith<BookmarkResource> get copyWith => _$BookmarkResourceCopyWithImpl<BookmarkResource>(this as BookmarkResource, _$identity);

  /// Serializes this BookmarkResource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkResource&&(identical(other.src, src) || other.src == src));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,src);

@override
String toString() {
  return 'BookmarkResource(src: $src)';
}


}

/// @nodoc
abstract mixin class $BookmarkResourceCopyWith<$Res>  {
  factory $BookmarkResourceCopyWith(BookmarkResource value, $Res Function(BookmarkResource) _then) = _$BookmarkResourceCopyWithImpl;
@useResult
$Res call({
 String? src
});




}
/// @nodoc
class _$BookmarkResourceCopyWithImpl<$Res>
    implements $BookmarkResourceCopyWith<$Res> {
  _$BookmarkResourceCopyWithImpl(this._self, this._then);

  final BookmarkResource _self;
  final $Res Function(BookmarkResource) _then;

/// Create a copy of BookmarkResource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? src = freezed,}) {
  return _then(_self.copyWith(
src: freezed == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookmarkResource implements BookmarkResource {
  const _BookmarkResource({this.src});
  factory _BookmarkResource.fromJson(Map<String, dynamic> json) => _$BookmarkResourceFromJson(json);

@override final  String? src;

/// Create a copy of BookmarkResource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkResourceCopyWith<_BookmarkResource> get copyWith => __$BookmarkResourceCopyWithImpl<_BookmarkResource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkResourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkResource&&(identical(other.src, src) || other.src == src));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,src);

@override
String toString() {
  return 'BookmarkResource(src: $src)';
}


}

/// @nodoc
abstract mixin class _$BookmarkResourceCopyWith<$Res> implements $BookmarkResourceCopyWith<$Res> {
  factory _$BookmarkResourceCopyWith(_BookmarkResource value, $Res Function(_BookmarkResource) _then) = __$BookmarkResourceCopyWithImpl;
@override @useResult
$Res call({
 String? src
});




}
/// @nodoc
class __$BookmarkResourceCopyWithImpl<$Res>
    implements _$BookmarkResourceCopyWith<$Res> {
  __$BookmarkResourceCopyWithImpl(this._self, this._then);

  final _BookmarkResource _self;
  final $Res Function(_BookmarkResource) _then;

/// Create a copy of BookmarkResource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? src = freezed,}) {
  return _then(_BookmarkResource(
src: freezed == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BookmarkResourceImage {

 String? get src; int? get height; int? get width;
/// Create a copy of BookmarkResourceImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkResourceImageCopyWith<BookmarkResourceImage> get copyWith => _$BookmarkResourceImageCopyWithImpl<BookmarkResourceImage>(this as BookmarkResourceImage, _$identity);

  /// Serializes this BookmarkResourceImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkResourceImage&&(identical(other.src, src) || other.src == src)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,src,height,width);

@override
String toString() {
  return 'BookmarkResourceImage(src: $src, height: $height, width: $width)';
}


}

/// @nodoc
abstract mixin class $BookmarkResourceImageCopyWith<$Res>  {
  factory $BookmarkResourceImageCopyWith(BookmarkResourceImage value, $Res Function(BookmarkResourceImage) _then) = _$BookmarkResourceImageCopyWithImpl;
@useResult
$Res call({
 String? src, int? height, int? width
});




}
/// @nodoc
class _$BookmarkResourceImageCopyWithImpl<$Res>
    implements $BookmarkResourceImageCopyWith<$Res> {
  _$BookmarkResourceImageCopyWithImpl(this._self, this._then);

  final BookmarkResourceImage _self;
  final $Res Function(BookmarkResourceImage) _then;

/// Create a copy of BookmarkResourceImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? src = freezed,Object? height = freezed,Object? width = freezed,}) {
  return _then(_self.copyWith(
src: freezed == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookmarkResourceImage implements BookmarkResourceImage {
  const _BookmarkResourceImage({this.src, this.height, this.width});
  factory _BookmarkResourceImage.fromJson(Map<String, dynamic> json) => _$BookmarkResourceImageFromJson(json);

@override final  String? src;
@override final  int? height;
@override final  int? width;

/// Create a copy of BookmarkResourceImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkResourceImageCopyWith<_BookmarkResourceImage> get copyWith => __$BookmarkResourceImageCopyWithImpl<_BookmarkResourceImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkResourceImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkResourceImage&&(identical(other.src, src) || other.src == src)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,src,height,width);

@override
String toString() {
  return 'BookmarkResourceImage(src: $src, height: $height, width: $width)';
}


}

/// @nodoc
abstract mixin class _$BookmarkResourceImageCopyWith<$Res> implements $BookmarkResourceImageCopyWith<$Res> {
  factory _$BookmarkResourceImageCopyWith(_BookmarkResourceImage value, $Res Function(_BookmarkResourceImage) _then) = __$BookmarkResourceImageCopyWithImpl;
@override @useResult
$Res call({
 String? src, int? height, int? width
});




}
/// @nodoc
class __$BookmarkResourceImageCopyWithImpl<$Res>
    implements _$BookmarkResourceImageCopyWith<$Res> {
  __$BookmarkResourceImageCopyWithImpl(this._self, this._then);

  final _BookmarkResourceImage _self;
  final $Res Function(_BookmarkResourceImage) _then;

/// Create a copy of BookmarkResourceImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? src = freezed,Object? height = freezed,Object? width = freezed,}) {
  return _then(_BookmarkResourceImage(
src: freezed == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$BookmarkResources {

 BookmarkResourceImage? get icon; BookmarkResourceImage? get image; BookmarkResourceImage? get thumbnail; BookmarkResource? get article; BookmarkResource? get log; BookmarkResource? get props;
/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkResourcesCopyWith<BookmarkResources> get copyWith => _$BookmarkResourcesCopyWithImpl<BookmarkResources>(this as BookmarkResources, _$identity);

  /// Serializes this BookmarkResources to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkResources&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.image, image) || other.image == image)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.article, article) || other.article == article)&&(identical(other.log, log) || other.log == log)&&(identical(other.props, props) || other.props == props));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icon,image,thumbnail,article,log,props);

@override
String toString() {
  return 'BookmarkResources(icon: $icon, image: $image, thumbnail: $thumbnail, article: $article, log: $log, props: $props)';
}


}

/// @nodoc
abstract mixin class $BookmarkResourcesCopyWith<$Res>  {
  factory $BookmarkResourcesCopyWith(BookmarkResources value, $Res Function(BookmarkResources) _then) = _$BookmarkResourcesCopyWithImpl;
@useResult
$Res call({
 BookmarkResourceImage? icon, BookmarkResourceImage? image, BookmarkResourceImage? thumbnail, BookmarkResource? article, BookmarkResource? log, BookmarkResource? props
});


$BookmarkResourceImageCopyWith<$Res>? get icon;$BookmarkResourceImageCopyWith<$Res>? get image;$BookmarkResourceImageCopyWith<$Res>? get thumbnail;$BookmarkResourceCopyWith<$Res>? get article;$BookmarkResourceCopyWith<$Res>? get log;$BookmarkResourceCopyWith<$Res>? get props;

}
/// @nodoc
class _$BookmarkResourcesCopyWithImpl<$Res>
    implements $BookmarkResourcesCopyWith<$Res> {
  _$BookmarkResourcesCopyWithImpl(this._self, this._then);

  final BookmarkResources _self;
  final $Res Function(BookmarkResources) _then;

/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icon = freezed,Object? image = freezed,Object? thumbnail = freezed,Object? article = freezed,Object? log = freezed,Object? props = freezed,}) {
  return _then(_self.copyWith(
icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as BookmarkResourceImage?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as BookmarkResourceImage?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as BookmarkResourceImage?,article: freezed == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as BookmarkResource?,log: freezed == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as BookmarkResource?,props: freezed == props ? _self.props : props // ignore: cast_nullable_to_non_nullable
as BookmarkResource?,
  ));
}
/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourceImageCopyWith<$Res>? get icon {
    if (_self.icon == null) {
    return null;
  }

  return $BookmarkResourceImageCopyWith<$Res>(_self.icon!, (value) {
    return _then(_self.copyWith(icon: value));
  });
}/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourceImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $BookmarkResourceImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourceImageCopyWith<$Res>? get thumbnail {
    if (_self.thumbnail == null) {
    return null;
  }

  return $BookmarkResourceImageCopyWith<$Res>(_self.thumbnail!, (value) {
    return _then(_self.copyWith(thumbnail: value));
  });
}/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourceCopyWith<$Res>? get article {
    if (_self.article == null) {
    return null;
  }

  return $BookmarkResourceCopyWith<$Res>(_self.article!, (value) {
    return _then(_self.copyWith(article: value));
  });
}/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourceCopyWith<$Res>? get log {
    if (_self.log == null) {
    return null;
  }

  return $BookmarkResourceCopyWith<$Res>(_self.log!, (value) {
    return _then(_self.copyWith(log: value));
  });
}/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourceCopyWith<$Res>? get props {
    if (_self.props == null) {
    return null;
  }

  return $BookmarkResourceCopyWith<$Res>(_self.props!, (value) {
    return _then(_self.copyWith(props: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _BookmarkResources implements BookmarkResources {
  const _BookmarkResources({this.icon, this.image, this.thumbnail, this.article, this.log, this.props});
  factory _BookmarkResources.fromJson(Map<String, dynamic> json) => _$BookmarkResourcesFromJson(json);

@override final  BookmarkResourceImage? icon;
@override final  BookmarkResourceImage? image;
@override final  BookmarkResourceImage? thumbnail;
@override final  BookmarkResource? article;
@override final  BookmarkResource? log;
@override final  BookmarkResource? props;

/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkResourcesCopyWith<_BookmarkResources> get copyWith => __$BookmarkResourcesCopyWithImpl<_BookmarkResources>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkResourcesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkResources&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.image, image) || other.image == image)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.article, article) || other.article == article)&&(identical(other.log, log) || other.log == log)&&(identical(other.props, props) || other.props == props));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icon,image,thumbnail,article,log,props);

@override
String toString() {
  return 'BookmarkResources(icon: $icon, image: $image, thumbnail: $thumbnail, article: $article, log: $log, props: $props)';
}


}

/// @nodoc
abstract mixin class _$BookmarkResourcesCopyWith<$Res> implements $BookmarkResourcesCopyWith<$Res> {
  factory _$BookmarkResourcesCopyWith(_BookmarkResources value, $Res Function(_BookmarkResources) _then) = __$BookmarkResourcesCopyWithImpl;
@override @useResult
$Res call({
 BookmarkResourceImage? icon, BookmarkResourceImage? image, BookmarkResourceImage? thumbnail, BookmarkResource? article, BookmarkResource? log, BookmarkResource? props
});


@override $BookmarkResourceImageCopyWith<$Res>? get icon;@override $BookmarkResourceImageCopyWith<$Res>? get image;@override $BookmarkResourceImageCopyWith<$Res>? get thumbnail;@override $BookmarkResourceCopyWith<$Res>? get article;@override $BookmarkResourceCopyWith<$Res>? get log;@override $BookmarkResourceCopyWith<$Res>? get props;

}
/// @nodoc
class __$BookmarkResourcesCopyWithImpl<$Res>
    implements _$BookmarkResourcesCopyWith<$Res> {
  __$BookmarkResourcesCopyWithImpl(this._self, this._then);

  final _BookmarkResources _self;
  final $Res Function(_BookmarkResources) _then;

/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = freezed,Object? image = freezed,Object? thumbnail = freezed,Object? article = freezed,Object? log = freezed,Object? props = freezed,}) {
  return _then(_BookmarkResources(
icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as BookmarkResourceImage?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as BookmarkResourceImage?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as BookmarkResourceImage?,article: freezed == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as BookmarkResource?,log: freezed == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as BookmarkResource?,props: freezed == props ? _self.props : props // ignore: cast_nullable_to_non_nullable
as BookmarkResource?,
  ));
}

/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourceImageCopyWith<$Res>? get icon {
    if (_self.icon == null) {
    return null;
  }

  return $BookmarkResourceImageCopyWith<$Res>(_self.icon!, (value) {
    return _then(_self.copyWith(icon: value));
  });
}/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourceImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $BookmarkResourceImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourceImageCopyWith<$Res>? get thumbnail {
    if (_self.thumbnail == null) {
    return null;
  }

  return $BookmarkResourceImageCopyWith<$Res>(_self.thumbnail!, (value) {
    return _then(_self.copyWith(thumbnail: value));
  });
}/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourceCopyWith<$Res>? get article {
    if (_self.article == null) {
    return null;
  }

  return $BookmarkResourceCopyWith<$Res>(_self.article!, (value) {
    return _then(_self.copyWith(article: value));
  });
}/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourceCopyWith<$Res>? get log {
    if (_self.log == null) {
    return null;
  }

  return $BookmarkResourceCopyWith<$Res>(_self.log!, (value) {
    return _then(_self.copyWith(log: value));
  });
}/// Create a copy of BookmarkResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourceCopyWith<$Res>? get props {
    if (_self.props == null) {
    return null;
  }

  return $BookmarkResourceCopyWith<$Res>(_self.props!, (value) {
    return _then(_self.copyWith(props: value));
  });
}
}


/// @nodoc
mixin _$BookmarkSummary {

@override String? get id;@override String? get href;@override DateTime? get created;@override DateTime? get updated;@override int? get state;@override bool? get loaded;@override String? get url;@override String? get title;@override@JsonKey(name: 'site_name') String? get siteName;@override String? get site;@override DateTime? get published;@override List<String>? get authors;@override String? get lang;@override@JsonKey(name: 'text_direction') String? get textDirection;@override@JsonKey(name: 'document_type') String? get documentType;@override String? get type;@override@JsonKey(name: 'has_article') bool? get hasArticle;@override String? get description;@override@JsonKey(name: 'is_deleted') bool? get isDeleted;@override@JsonKey(name: 'is_marked') bool? get isMarked;@override@JsonKey(name: 'is_archived') bool? get isArchived;@override@JsonKey(name: 'read_progress') int? get readProgress;@override List<String>? get labels;@override@JsonKey(name: 'word_count') int? get wordCount;@override@JsonKey(name: 'reading_time') int? get readingTime;@override BookmarkResources? get resources;
/// Create a copy of BookmarkSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkSummaryCopyWith<BookmarkSummary> get copyWith => _$BookmarkSummaryCopyWithImpl<BookmarkSummary>(this as BookmarkSummary, _$identity);

  /// Serializes this BookmarkSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.href, href) || other.href == href)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.state, state) || other.state == state)&&(identical(other.loaded, loaded) || other.loaded == loaded)&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.siteName, siteName) || other.siteName == siteName)&&(identical(other.site, site) || other.site == site)&&(identical(other.published, published) || other.published == published)&&const DeepCollectionEquality().equals(other.authors, authors)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.textDirection, textDirection) || other.textDirection == textDirection)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.type, type) || other.type == type)&&(identical(other.hasArticle, hasArticle) || other.hasArticle == hasArticle)&&(identical(other.description, description) || other.description == description)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.readProgress, readProgress) || other.readProgress == readProgress)&&const DeepCollectionEquality().equals(other.labels, labels)&&(identical(other.wordCount, wordCount) || other.wordCount == wordCount)&&(identical(other.readingTime, readingTime) || other.readingTime == readingTime)&&(identical(other.resources, resources) || other.resources == resources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,href,created,updated,state,loaded,url,title,siteName,site,published,const DeepCollectionEquality().hash(authors),lang,textDirection,documentType,type,hasArticle,description,isDeleted,isMarked,isArchived,readProgress,const DeepCollectionEquality().hash(labels),wordCount,readingTime,resources]);

@override
String toString() {
  return 'BookmarkSummary(id: $id, href: $href, created: $created, updated: $updated, state: $state, loaded: $loaded, url: $url, title: $title, siteName: $siteName, site: $site, published: $published, authors: $authors, lang: $lang, textDirection: $textDirection, documentType: $documentType, type: $type, hasArticle: $hasArticle, description: $description, isDeleted: $isDeleted, isMarked: $isMarked, isArchived: $isArchived, readProgress: $readProgress, labels: $labels, wordCount: $wordCount, readingTime: $readingTime, resources: $resources)';
}


}

/// @nodoc
abstract mixin class $BookmarkSummaryCopyWith<$Res>  {
  factory $BookmarkSummaryCopyWith(BookmarkSummary value, $Res Function(BookmarkSummary) _then) = _$BookmarkSummaryCopyWithImpl;
@useResult
$Res call({
@override String? id,@override String? href,@override DateTime? created,@override DateTime? updated,@override int? state,@override bool? loaded,@override String? url,@override String? title,@override@JsonKey(name: 'site_name') String? siteName,@override String? site,@override DateTime? published,@override List<String>? authors,@override String? lang,@override@JsonKey(name: 'text_direction') String? textDirection,@override@JsonKey(name: 'document_type') String? documentType,@override String? type,@override@JsonKey(name: 'has_article') bool? hasArticle,@override String? description,@override@JsonKey(name: 'is_deleted') bool? isDeleted,@override@JsonKey(name: 'is_marked') bool? isMarked,@override@JsonKey(name: 'is_archived') bool? isArchived,@override@JsonKey(name: 'read_progress') int? readProgress,@override List<String>? labels,@override@JsonKey(name: 'word_count') int? wordCount,@override@JsonKey(name: 'reading_time') int? readingTime,@override BookmarkResources? resources
});


$BookmarkResourcesCopyWith<$Res>? get resources;

}
/// @nodoc
class _$BookmarkSummaryCopyWithImpl<$Res>
    implements $BookmarkSummaryCopyWith<$Res> {
  _$BookmarkSummaryCopyWithImpl(this._self, this._then);

  final BookmarkSummary _self;
  final $Res Function(BookmarkSummary) _then;

/// Create a copy of BookmarkSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? href = freezed,Object? created = freezed,Object? updated = freezed,Object? state = freezed,Object? loaded = freezed,Object? url = freezed,Object? title = freezed,Object? siteName = freezed,Object? site = freezed,Object? published = freezed,Object? authors = freezed,Object? lang = freezed,Object? textDirection = freezed,Object? documentType = freezed,Object? type = freezed,Object? hasArticle = freezed,Object? description = freezed,Object? isDeleted = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? readProgress = freezed,Object? labels = freezed,Object? wordCount = freezed,Object? readingTime = freezed,Object? resources = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as int?,loaded: freezed == loaded ? _self.loaded : loaded // ignore: cast_nullable_to_non_nullable
as bool?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,siteName: freezed == siteName ? _self.siteName : siteName // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,published: freezed == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as DateTime?,authors: freezed == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>?,lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,textDirection: freezed == textDirection ? _self.textDirection : textDirection // ignore: cast_nullable_to_non_nullable
as String?,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,hasArticle: freezed == hasArticle ? _self.hasArticle : hasArticle // ignore: cast_nullable_to_non_nullable
as bool?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,readProgress: freezed == readProgress ? _self.readProgress : readProgress // ignore: cast_nullable_to_non_nullable
as int?,labels: freezed == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,wordCount: freezed == wordCount ? _self.wordCount : wordCount // ignore: cast_nullable_to_non_nullable
as int?,readingTime: freezed == readingTime ? _self.readingTime : readingTime // ignore: cast_nullable_to_non_nullable
as int?,resources: freezed == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as BookmarkResources?,
  ));
}
/// Create a copy of BookmarkSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourcesCopyWith<$Res>? get resources {
    if (_self.resources == null) {
    return null;
  }

  return $BookmarkResourcesCopyWith<$Res>(_self.resources!, (value) {
    return _then(_self.copyWith(resources: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _BookmarkSummary implements BookmarkSummary {
  const _BookmarkSummary({@override this.id, @override this.href, @override this.created, @override this.updated, @override this.state, @override this.loaded, @override this.url, @override this.title, @override@JsonKey(name: 'site_name') this.siteName, @override this.site, @override this.published, @override final  List<String>? authors, @override this.lang, @override@JsonKey(name: 'text_direction') this.textDirection, @override@JsonKey(name: 'document_type') this.documentType, @override this.type, @override@JsonKey(name: 'has_article') this.hasArticle, @override this.description, @override@JsonKey(name: 'is_deleted') this.isDeleted, @override@JsonKey(name: 'is_marked') this.isMarked, @override@JsonKey(name: 'is_archived') this.isArchived, @override@JsonKey(name: 'read_progress') this.readProgress, @override final  List<String>? labels, @override@JsonKey(name: 'word_count') this.wordCount, @override@JsonKey(name: 'reading_time') this.readingTime, @override this.resources}): _authors = authors,_labels = labels;
  factory _BookmarkSummary.fromJson(Map<String, dynamic> json) => _$BookmarkSummaryFromJson(json);

@override@override final  String? id;
@override@override final  String? href;
@override@override final  DateTime? created;
@override@override final  DateTime? updated;
@override@override final  int? state;
@override@override final  bool? loaded;
@override@override final  String? url;
@override@override final  String? title;
@override@override@JsonKey(name: 'site_name') final  String? siteName;
@override@override final  String? site;
@override@override final  DateTime? published;
 final  List<String>? _authors;
@override@override List<String>? get authors {
  final value = _authors;
  if (value == null) return null;
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@override final  String? lang;
@override@override@JsonKey(name: 'text_direction') final  String? textDirection;
@override@override@JsonKey(name: 'document_type') final  String? documentType;
@override@override final  String? type;
@override@override@JsonKey(name: 'has_article') final  bool? hasArticle;
@override@override final  String? description;
@override@override@JsonKey(name: 'is_deleted') final  bool? isDeleted;
@override@override@JsonKey(name: 'is_marked') final  bool? isMarked;
@override@override@JsonKey(name: 'is_archived') final  bool? isArchived;
@override@override@JsonKey(name: 'read_progress') final  int? readProgress;
 final  List<String>? _labels;
@override@override List<String>? get labels {
  final value = _labels;
  if (value == null) return null;
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@override@JsonKey(name: 'word_count') final  int? wordCount;
@override@override@JsonKey(name: 'reading_time') final  int? readingTime;
@override@override final  BookmarkResources? resources;

/// Create a copy of BookmarkSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkSummaryCopyWith<_BookmarkSummary> get copyWith => __$BookmarkSummaryCopyWithImpl<_BookmarkSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.href, href) || other.href == href)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.state, state) || other.state == state)&&(identical(other.loaded, loaded) || other.loaded == loaded)&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.siteName, siteName) || other.siteName == siteName)&&(identical(other.site, site) || other.site == site)&&(identical(other.published, published) || other.published == published)&&const DeepCollectionEquality().equals(other._authors, _authors)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.textDirection, textDirection) || other.textDirection == textDirection)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.type, type) || other.type == type)&&(identical(other.hasArticle, hasArticle) || other.hasArticle == hasArticle)&&(identical(other.description, description) || other.description == description)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.readProgress, readProgress) || other.readProgress == readProgress)&&const DeepCollectionEquality().equals(other._labels, _labels)&&(identical(other.wordCount, wordCount) || other.wordCount == wordCount)&&(identical(other.readingTime, readingTime) || other.readingTime == readingTime)&&(identical(other.resources, resources) || other.resources == resources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,href,created,updated,state,loaded,url,title,siteName,site,published,const DeepCollectionEquality().hash(_authors),lang,textDirection,documentType,type,hasArticle,description,isDeleted,isMarked,isArchived,readProgress,const DeepCollectionEquality().hash(_labels),wordCount,readingTime,resources]);

@override
String toString() {
  return 'BookmarkSummary(id: $id, href: $href, created: $created, updated: $updated, state: $state, loaded: $loaded, url: $url, title: $title, siteName: $siteName, site: $site, published: $published, authors: $authors, lang: $lang, textDirection: $textDirection, documentType: $documentType, type: $type, hasArticle: $hasArticle, description: $description, isDeleted: $isDeleted, isMarked: $isMarked, isArchived: $isArchived, readProgress: $readProgress, labels: $labels, wordCount: $wordCount, readingTime: $readingTime, resources: $resources)';
}


}

/// @nodoc
abstract mixin class _$BookmarkSummaryCopyWith<$Res> implements $BookmarkSummaryCopyWith<$Res> {
  factory _$BookmarkSummaryCopyWith(_BookmarkSummary value, $Res Function(_BookmarkSummary) _then) = __$BookmarkSummaryCopyWithImpl;
@override @useResult
$Res call({
@override String? id,@override String? href,@override DateTime? created,@override DateTime? updated,@override int? state,@override bool? loaded,@override String? url,@override String? title,@override@JsonKey(name: 'site_name') String? siteName,@override String? site,@override DateTime? published,@override List<String>? authors,@override String? lang,@override@JsonKey(name: 'text_direction') String? textDirection,@override@JsonKey(name: 'document_type') String? documentType,@override String? type,@override@JsonKey(name: 'has_article') bool? hasArticle,@override String? description,@override@JsonKey(name: 'is_deleted') bool? isDeleted,@override@JsonKey(name: 'is_marked') bool? isMarked,@override@JsonKey(name: 'is_archived') bool? isArchived,@override@JsonKey(name: 'read_progress') int? readProgress,@override List<String>? labels,@override@JsonKey(name: 'word_count') int? wordCount,@override@JsonKey(name: 'reading_time') int? readingTime,@override BookmarkResources? resources
});


@override $BookmarkResourcesCopyWith<$Res>? get resources;

}
/// @nodoc
class __$BookmarkSummaryCopyWithImpl<$Res>
    implements _$BookmarkSummaryCopyWith<$Res> {
  __$BookmarkSummaryCopyWithImpl(this._self, this._then);

  final _BookmarkSummary _self;
  final $Res Function(_BookmarkSummary) _then;

/// Create a copy of BookmarkSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? href = freezed,Object? created = freezed,Object? updated = freezed,Object? state = freezed,Object? loaded = freezed,Object? url = freezed,Object? title = freezed,Object? siteName = freezed,Object? site = freezed,Object? published = freezed,Object? authors = freezed,Object? lang = freezed,Object? textDirection = freezed,Object? documentType = freezed,Object? type = freezed,Object? hasArticle = freezed,Object? description = freezed,Object? isDeleted = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? readProgress = freezed,Object? labels = freezed,Object? wordCount = freezed,Object? readingTime = freezed,Object? resources = freezed,}) {
  return _then(_BookmarkSummary(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as int?,loaded: freezed == loaded ? _self.loaded : loaded // ignore: cast_nullable_to_non_nullable
as bool?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,siteName: freezed == siteName ? _self.siteName : siteName // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,published: freezed == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as DateTime?,authors: freezed == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>?,lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,textDirection: freezed == textDirection ? _self.textDirection : textDirection // ignore: cast_nullable_to_non_nullable
as String?,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,hasArticle: freezed == hasArticle ? _self.hasArticle : hasArticle // ignore: cast_nullable_to_non_nullable
as bool?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,readProgress: freezed == readProgress ? _self.readProgress : readProgress // ignore: cast_nullable_to_non_nullable
as int?,labels: freezed == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,wordCount: freezed == wordCount ? _self.wordCount : wordCount // ignore: cast_nullable_to_non_nullable
as int?,readingTime: freezed == readingTime ? _self.readingTime : readingTime // ignore: cast_nullable_to_non_nullable
as int?,resources: freezed == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as BookmarkResources?,
  ));
}

/// Create a copy of BookmarkSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourcesCopyWith<$Res>? get resources {
    if (_self.resources == null) {
    return null;
  }

  return $BookmarkResourcesCopyWith<$Res>(_self.resources!, (value) {
    return _then(_self.copyWith(resources: value));
  });
}
}


/// @nodoc
mixin _$BookmarkLink {

 String? get url; String? get domain; String? get title;@JsonKey(name: 'is_page') bool? get isPage;@JsonKey(name: 'content_type') String? get contentType;
/// Create a copy of BookmarkLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkLinkCopyWith<BookmarkLink> get copyWith => _$BookmarkLinkCopyWithImpl<BookmarkLink>(this as BookmarkLink, _$identity);

  /// Serializes this BookmarkLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkLink&&(identical(other.url, url) || other.url == url)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.title, title) || other.title == title)&&(identical(other.isPage, isPage) || other.isPage == isPage)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,domain,title,isPage,contentType);

@override
String toString() {
  return 'BookmarkLink(url: $url, domain: $domain, title: $title, isPage: $isPage, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class $BookmarkLinkCopyWith<$Res>  {
  factory $BookmarkLinkCopyWith(BookmarkLink value, $Res Function(BookmarkLink) _then) = _$BookmarkLinkCopyWithImpl;
@useResult
$Res call({
 String? url, String? domain, String? title,@JsonKey(name: 'is_page') bool? isPage,@JsonKey(name: 'content_type') String? contentType
});




}
/// @nodoc
class _$BookmarkLinkCopyWithImpl<$Res>
    implements $BookmarkLinkCopyWith<$Res> {
  _$BookmarkLinkCopyWithImpl(this._self, this._then);

  final BookmarkLink _self;
  final $Res Function(BookmarkLink) _then;

/// Create a copy of BookmarkLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? domain = freezed,Object? title = freezed,Object? isPage = freezed,Object? contentType = freezed,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,domain: freezed == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,isPage: freezed == isPage ? _self.isPage : isPage // ignore: cast_nullable_to_non_nullable
as bool?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookmarkLink implements BookmarkLink {
  const _BookmarkLink({this.url, this.domain, this.title, @JsonKey(name: 'is_page') this.isPage, @JsonKey(name: 'content_type') this.contentType});
  factory _BookmarkLink.fromJson(Map<String, dynamic> json) => _$BookmarkLinkFromJson(json);

@override final  String? url;
@override final  String? domain;
@override final  String? title;
@override@JsonKey(name: 'is_page') final  bool? isPage;
@override@JsonKey(name: 'content_type') final  String? contentType;

/// Create a copy of BookmarkLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkLinkCopyWith<_BookmarkLink> get copyWith => __$BookmarkLinkCopyWithImpl<_BookmarkLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkLink&&(identical(other.url, url) || other.url == url)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.title, title) || other.title == title)&&(identical(other.isPage, isPage) || other.isPage == isPage)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,domain,title,isPage,contentType);

@override
String toString() {
  return 'BookmarkLink(url: $url, domain: $domain, title: $title, isPage: $isPage, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class _$BookmarkLinkCopyWith<$Res> implements $BookmarkLinkCopyWith<$Res> {
  factory _$BookmarkLinkCopyWith(_BookmarkLink value, $Res Function(_BookmarkLink) _then) = __$BookmarkLinkCopyWithImpl;
@override @useResult
$Res call({
 String? url, String? domain, String? title,@JsonKey(name: 'is_page') bool? isPage,@JsonKey(name: 'content_type') String? contentType
});




}
/// @nodoc
class __$BookmarkLinkCopyWithImpl<$Res>
    implements _$BookmarkLinkCopyWith<$Res> {
  __$BookmarkLinkCopyWithImpl(this._self, this._then);

  final _BookmarkLink _self;
  final $Res Function(_BookmarkLink) _then;

/// Create a copy of BookmarkLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? domain = freezed,Object? title = freezed,Object? isPage = freezed,Object? contentType = freezed,}) {
  return _then(_BookmarkLink(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,domain: freezed == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,isPage: freezed == isPage ? _self.isPage : isPage // ignore: cast_nullable_to_non_nullable
as bool?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BookmarkInfo {

// Fields from IBookmarkSummary
@override String? get id;@override String? get href;@override DateTime? get created;@override DateTime? get updated;@override int? get state;@override bool? get loaded;@override String? get url;@override String? get title;@override@JsonKey(name: 'site_name') String? get siteName;@override String? get site;@override DateTime? get published;@override List<String>? get authors;@override String? get lang;@override@JsonKey(name: 'text_direction') String? get textDirection;@override@JsonKey(name: 'document_type') String? get documentType;@override String? get type;@override@JsonKey(name: 'has_article') bool? get hasArticle;@override String? get description;@override@JsonKey(name: 'is_deleted') bool? get isDeleted;@override@JsonKey(name: 'is_marked') bool? get isMarked;@override@JsonKey(name: 'is_archived') bool? get isArchived;@override@JsonKey(name: 'read_progress') int? get readProgress;@override List<String>? get labels;@override@JsonKey(name: 'word_count') int? get wordCount;@override@JsonKey(name: 'reading_time') int? get readingTime;@override BookmarkResources? get resources;// BookmarkInfo specific fields
@JsonKey(name: 'omit_description') bool? get omitDescription;@JsonKey(name: 'read_anchor') String? get readAnchor; List<BookmarkLink>? get links;
/// Create a copy of BookmarkInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkInfoCopyWith<BookmarkInfo> get copyWith => _$BookmarkInfoCopyWithImpl<BookmarkInfo>(this as BookmarkInfo, _$identity);

  /// Serializes this BookmarkInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.href, href) || other.href == href)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.state, state) || other.state == state)&&(identical(other.loaded, loaded) || other.loaded == loaded)&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.siteName, siteName) || other.siteName == siteName)&&(identical(other.site, site) || other.site == site)&&(identical(other.published, published) || other.published == published)&&const DeepCollectionEquality().equals(other.authors, authors)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.textDirection, textDirection) || other.textDirection == textDirection)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.type, type) || other.type == type)&&(identical(other.hasArticle, hasArticle) || other.hasArticle == hasArticle)&&(identical(other.description, description) || other.description == description)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.readProgress, readProgress) || other.readProgress == readProgress)&&const DeepCollectionEquality().equals(other.labels, labels)&&(identical(other.wordCount, wordCount) || other.wordCount == wordCount)&&(identical(other.readingTime, readingTime) || other.readingTime == readingTime)&&(identical(other.resources, resources) || other.resources == resources)&&(identical(other.omitDescription, omitDescription) || other.omitDescription == omitDescription)&&(identical(other.readAnchor, readAnchor) || other.readAnchor == readAnchor)&&const DeepCollectionEquality().equals(other.links, links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,href,created,updated,state,loaded,url,title,siteName,site,published,const DeepCollectionEquality().hash(authors),lang,textDirection,documentType,type,hasArticle,description,isDeleted,isMarked,isArchived,readProgress,const DeepCollectionEquality().hash(labels),wordCount,readingTime,resources,omitDescription,readAnchor,const DeepCollectionEquality().hash(links)]);

@override
String toString() {
  return 'BookmarkInfo(id: $id, href: $href, created: $created, updated: $updated, state: $state, loaded: $loaded, url: $url, title: $title, siteName: $siteName, site: $site, published: $published, authors: $authors, lang: $lang, textDirection: $textDirection, documentType: $documentType, type: $type, hasArticle: $hasArticle, description: $description, isDeleted: $isDeleted, isMarked: $isMarked, isArchived: $isArchived, readProgress: $readProgress, labels: $labels, wordCount: $wordCount, readingTime: $readingTime, resources: $resources, omitDescription: $omitDescription, readAnchor: $readAnchor, links: $links)';
}


}

/// @nodoc
abstract mixin class $BookmarkInfoCopyWith<$Res>  {
  factory $BookmarkInfoCopyWith(BookmarkInfo value, $Res Function(BookmarkInfo) _then) = _$BookmarkInfoCopyWithImpl;
@useResult
$Res call({
@override String? id,@override String? href,@override DateTime? created,@override DateTime? updated,@override int? state,@override bool? loaded,@override String? url,@override String? title,@override@JsonKey(name: 'site_name') String? siteName,@override String? site,@override DateTime? published,@override List<String>? authors,@override String? lang,@override@JsonKey(name: 'text_direction') String? textDirection,@override@JsonKey(name: 'document_type') String? documentType,@override String? type,@override@JsonKey(name: 'has_article') bool? hasArticle,@override String? description,@override@JsonKey(name: 'is_deleted') bool? isDeleted,@override@JsonKey(name: 'is_marked') bool? isMarked,@override@JsonKey(name: 'is_archived') bool? isArchived,@override@JsonKey(name: 'read_progress') int? readProgress,@override List<String>? labels,@override@JsonKey(name: 'word_count') int? wordCount,@override@JsonKey(name: 'reading_time') int? readingTime,@override BookmarkResources? resources,@JsonKey(name: 'omit_description') bool? omitDescription,@JsonKey(name: 'read_anchor') String? readAnchor, List<BookmarkLink>? links
});


$BookmarkResourcesCopyWith<$Res>? get resources;

}
/// @nodoc
class _$BookmarkInfoCopyWithImpl<$Res>
    implements $BookmarkInfoCopyWith<$Res> {
  _$BookmarkInfoCopyWithImpl(this._self, this._then);

  final BookmarkInfo _self;
  final $Res Function(BookmarkInfo) _then;

/// Create a copy of BookmarkInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? href = freezed,Object? created = freezed,Object? updated = freezed,Object? state = freezed,Object? loaded = freezed,Object? url = freezed,Object? title = freezed,Object? siteName = freezed,Object? site = freezed,Object? published = freezed,Object? authors = freezed,Object? lang = freezed,Object? textDirection = freezed,Object? documentType = freezed,Object? type = freezed,Object? hasArticle = freezed,Object? description = freezed,Object? isDeleted = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? readProgress = freezed,Object? labels = freezed,Object? wordCount = freezed,Object? readingTime = freezed,Object? resources = freezed,Object? omitDescription = freezed,Object? readAnchor = freezed,Object? links = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as int?,loaded: freezed == loaded ? _self.loaded : loaded // ignore: cast_nullable_to_non_nullable
as bool?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,siteName: freezed == siteName ? _self.siteName : siteName // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,published: freezed == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as DateTime?,authors: freezed == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>?,lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,textDirection: freezed == textDirection ? _self.textDirection : textDirection // ignore: cast_nullable_to_non_nullable
as String?,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,hasArticle: freezed == hasArticle ? _self.hasArticle : hasArticle // ignore: cast_nullable_to_non_nullable
as bool?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,readProgress: freezed == readProgress ? _self.readProgress : readProgress // ignore: cast_nullable_to_non_nullable
as int?,labels: freezed == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,wordCount: freezed == wordCount ? _self.wordCount : wordCount // ignore: cast_nullable_to_non_nullable
as int?,readingTime: freezed == readingTime ? _self.readingTime : readingTime // ignore: cast_nullable_to_non_nullable
as int?,resources: freezed == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as BookmarkResources?,omitDescription: freezed == omitDescription ? _self.omitDescription : omitDescription // ignore: cast_nullable_to_non_nullable
as bool?,readAnchor: freezed == readAnchor ? _self.readAnchor : readAnchor // ignore: cast_nullable_to_non_nullable
as String?,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<BookmarkLink>?,
  ));
}
/// Create a copy of BookmarkInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourcesCopyWith<$Res>? get resources {
    if (_self.resources == null) {
    return null;
  }

  return $BookmarkResourcesCopyWith<$Res>(_self.resources!, (value) {
    return _then(_self.copyWith(resources: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _BookmarkInfo implements BookmarkInfo {
  const _BookmarkInfo({@override this.id, @override this.href, @override this.created, @override this.updated, @override this.state, @override this.loaded, @override this.url, @override this.title, @override@JsonKey(name: 'site_name') this.siteName, @override this.site, @override this.published, @override final  List<String>? authors, @override this.lang, @override@JsonKey(name: 'text_direction') this.textDirection, @override@JsonKey(name: 'document_type') this.documentType, @override this.type, @override@JsonKey(name: 'has_article') this.hasArticle, @override this.description, @override@JsonKey(name: 'is_deleted') this.isDeleted, @override@JsonKey(name: 'is_marked') this.isMarked, @override@JsonKey(name: 'is_archived') this.isArchived, @override@JsonKey(name: 'read_progress') this.readProgress, @override final  List<String>? labels, @override@JsonKey(name: 'word_count') this.wordCount, @override@JsonKey(name: 'reading_time') this.readingTime, @override this.resources, @JsonKey(name: 'omit_description') this.omitDescription, @JsonKey(name: 'read_anchor') this.readAnchor, final  List<BookmarkLink>? links}): _authors = authors,_labels = labels,_links = links;
  factory _BookmarkInfo.fromJson(Map<String, dynamic> json) => _$BookmarkInfoFromJson(json);

// Fields from IBookmarkSummary
@override@override final  String? id;
@override@override final  String? href;
@override@override final  DateTime? created;
@override@override final  DateTime? updated;
@override@override final  int? state;
@override@override final  bool? loaded;
@override@override final  String? url;
@override@override final  String? title;
@override@override@JsonKey(name: 'site_name') final  String? siteName;
@override@override final  String? site;
@override@override final  DateTime? published;
 final  List<String>? _authors;
@override@override List<String>? get authors {
  final value = _authors;
  if (value == null) return null;
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@override final  String? lang;
@override@override@JsonKey(name: 'text_direction') final  String? textDirection;
@override@override@JsonKey(name: 'document_type') final  String? documentType;
@override@override final  String? type;
@override@override@JsonKey(name: 'has_article') final  bool? hasArticle;
@override@override final  String? description;
@override@override@JsonKey(name: 'is_deleted') final  bool? isDeleted;
@override@override@JsonKey(name: 'is_marked') final  bool? isMarked;
@override@override@JsonKey(name: 'is_archived') final  bool? isArchived;
@override@override@JsonKey(name: 'read_progress') final  int? readProgress;
 final  List<String>? _labels;
@override@override List<String>? get labels {
  final value = _labels;
  if (value == null) return null;
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@override@JsonKey(name: 'word_count') final  int? wordCount;
@override@override@JsonKey(name: 'reading_time') final  int? readingTime;
@override@override final  BookmarkResources? resources;
// BookmarkInfo specific fields
@override@JsonKey(name: 'omit_description') final  bool? omitDescription;
@override@JsonKey(name: 'read_anchor') final  String? readAnchor;
 final  List<BookmarkLink>? _links;
@override List<BookmarkLink>? get links {
  final value = _links;
  if (value == null) return null;
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of BookmarkInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkInfoCopyWith<_BookmarkInfo> get copyWith => __$BookmarkInfoCopyWithImpl<_BookmarkInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.href, href) || other.href == href)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.state, state) || other.state == state)&&(identical(other.loaded, loaded) || other.loaded == loaded)&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.siteName, siteName) || other.siteName == siteName)&&(identical(other.site, site) || other.site == site)&&(identical(other.published, published) || other.published == published)&&const DeepCollectionEquality().equals(other._authors, _authors)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.textDirection, textDirection) || other.textDirection == textDirection)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.type, type) || other.type == type)&&(identical(other.hasArticle, hasArticle) || other.hasArticle == hasArticle)&&(identical(other.description, description) || other.description == description)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.readProgress, readProgress) || other.readProgress == readProgress)&&const DeepCollectionEquality().equals(other._labels, _labels)&&(identical(other.wordCount, wordCount) || other.wordCount == wordCount)&&(identical(other.readingTime, readingTime) || other.readingTime == readingTime)&&(identical(other.resources, resources) || other.resources == resources)&&(identical(other.omitDescription, omitDescription) || other.omitDescription == omitDescription)&&(identical(other.readAnchor, readAnchor) || other.readAnchor == readAnchor)&&const DeepCollectionEquality().equals(other._links, _links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,href,created,updated,state,loaded,url,title,siteName,site,published,const DeepCollectionEquality().hash(_authors),lang,textDirection,documentType,type,hasArticle,description,isDeleted,isMarked,isArchived,readProgress,const DeepCollectionEquality().hash(_labels),wordCount,readingTime,resources,omitDescription,readAnchor,const DeepCollectionEquality().hash(_links)]);

@override
String toString() {
  return 'BookmarkInfo(id: $id, href: $href, created: $created, updated: $updated, state: $state, loaded: $loaded, url: $url, title: $title, siteName: $siteName, site: $site, published: $published, authors: $authors, lang: $lang, textDirection: $textDirection, documentType: $documentType, type: $type, hasArticle: $hasArticle, description: $description, isDeleted: $isDeleted, isMarked: $isMarked, isArchived: $isArchived, readProgress: $readProgress, labels: $labels, wordCount: $wordCount, readingTime: $readingTime, resources: $resources, omitDescription: $omitDescription, readAnchor: $readAnchor, links: $links)';
}


}

/// @nodoc
abstract mixin class _$BookmarkInfoCopyWith<$Res> implements $BookmarkInfoCopyWith<$Res> {
  factory _$BookmarkInfoCopyWith(_BookmarkInfo value, $Res Function(_BookmarkInfo) _then) = __$BookmarkInfoCopyWithImpl;
@override @useResult
$Res call({
@override String? id,@override String? href,@override DateTime? created,@override DateTime? updated,@override int? state,@override bool? loaded,@override String? url,@override String? title,@override@JsonKey(name: 'site_name') String? siteName,@override String? site,@override DateTime? published,@override List<String>? authors,@override String? lang,@override@JsonKey(name: 'text_direction') String? textDirection,@override@JsonKey(name: 'document_type') String? documentType,@override String? type,@override@JsonKey(name: 'has_article') bool? hasArticle,@override String? description,@override@JsonKey(name: 'is_deleted') bool? isDeleted,@override@JsonKey(name: 'is_marked') bool? isMarked,@override@JsonKey(name: 'is_archived') bool? isArchived,@override@JsonKey(name: 'read_progress') int? readProgress,@override List<String>? labels,@override@JsonKey(name: 'word_count') int? wordCount,@override@JsonKey(name: 'reading_time') int? readingTime,@override BookmarkResources? resources,@JsonKey(name: 'omit_description') bool? omitDescription,@JsonKey(name: 'read_anchor') String? readAnchor, List<BookmarkLink>? links
});


@override $BookmarkResourcesCopyWith<$Res>? get resources;

}
/// @nodoc
class __$BookmarkInfoCopyWithImpl<$Res>
    implements _$BookmarkInfoCopyWith<$Res> {
  __$BookmarkInfoCopyWithImpl(this._self, this._then);

  final _BookmarkInfo _self;
  final $Res Function(_BookmarkInfo) _then;

/// Create a copy of BookmarkInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? href = freezed,Object? created = freezed,Object? updated = freezed,Object? state = freezed,Object? loaded = freezed,Object? url = freezed,Object? title = freezed,Object? siteName = freezed,Object? site = freezed,Object? published = freezed,Object? authors = freezed,Object? lang = freezed,Object? textDirection = freezed,Object? documentType = freezed,Object? type = freezed,Object? hasArticle = freezed,Object? description = freezed,Object? isDeleted = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? readProgress = freezed,Object? labels = freezed,Object? wordCount = freezed,Object? readingTime = freezed,Object? resources = freezed,Object? omitDescription = freezed,Object? readAnchor = freezed,Object? links = freezed,}) {
  return _then(_BookmarkInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as int?,loaded: freezed == loaded ? _self.loaded : loaded // ignore: cast_nullable_to_non_nullable
as bool?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,siteName: freezed == siteName ? _self.siteName : siteName // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,published: freezed == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as DateTime?,authors: freezed == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>?,lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,textDirection: freezed == textDirection ? _self.textDirection : textDirection // ignore: cast_nullable_to_non_nullable
as String?,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,hasArticle: freezed == hasArticle ? _self.hasArticle : hasArticle // ignore: cast_nullable_to_non_nullable
as bool?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,readProgress: freezed == readProgress ? _self.readProgress : readProgress // ignore: cast_nullable_to_non_nullable
as int?,labels: freezed == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,wordCount: freezed == wordCount ? _self.wordCount : wordCount // ignore: cast_nullable_to_non_nullable
as int?,readingTime: freezed == readingTime ? _self.readingTime : readingTime // ignore: cast_nullable_to_non_nullable
as int?,resources: freezed == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as BookmarkResources?,omitDescription: freezed == omitDescription ? _self.omitDescription : omitDescription // ignore: cast_nullable_to_non_nullable
as bool?,readAnchor: freezed == readAnchor ? _self.readAnchor : readAnchor // ignore: cast_nullable_to_non_nullable
as String?,links: freezed == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<BookmarkLink>?,
  ));
}

/// Create a copy of BookmarkInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkResourcesCopyWith<$Res>? get resources {
    if (_self.resources == null) {
    return null;
  }

  return $BookmarkResourcesCopyWith<$Res>(_self.resources!, (value) {
    return _then(_self.copyWith(resources: value));
  });
}
}


/// @nodoc
mixin _$BookmarkCreate {

 String get url; String? get title; List<String>? get labels;
/// Create a copy of BookmarkCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkCreateCopyWith<BookmarkCreate> get copyWith => _$BookmarkCreateCopyWithImpl<BookmarkCreate>(this as BookmarkCreate, _$identity);

  /// Serializes this BookmarkCreate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkCreate&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.labels, labels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,title,const DeepCollectionEquality().hash(labels));

@override
String toString() {
  return 'BookmarkCreate(url: $url, title: $title, labels: $labels)';
}


}

/// @nodoc
abstract mixin class $BookmarkCreateCopyWith<$Res>  {
  factory $BookmarkCreateCopyWith(BookmarkCreate value, $Res Function(BookmarkCreate) _then) = _$BookmarkCreateCopyWithImpl;
@useResult
$Res call({
 String url, String? title, List<String>? labels
});




}
/// @nodoc
class _$BookmarkCreateCopyWithImpl<$Res>
    implements $BookmarkCreateCopyWith<$Res> {
  _$BookmarkCreateCopyWithImpl(this._self, this._then);

  final BookmarkCreate _self;
  final $Res Function(BookmarkCreate) _then;

/// Create a copy of BookmarkCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? title = freezed,Object? labels = freezed,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,labels: freezed == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookmarkCreate implements BookmarkCreate {
  const _BookmarkCreate({required this.url, this.title, final  List<String>? labels}): _labels = labels;
  factory _BookmarkCreate.fromJson(Map<String, dynamic> json) => _$BookmarkCreateFromJson(json);

@override final  String url;
@override final  String? title;
 final  List<String>? _labels;
@override List<String>? get labels {
  final value = _labels;
  if (value == null) return null;
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of BookmarkCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkCreateCopyWith<_BookmarkCreate> get copyWith => __$BookmarkCreateCopyWithImpl<_BookmarkCreate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkCreateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkCreate&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._labels, _labels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,title,const DeepCollectionEquality().hash(_labels));

@override
String toString() {
  return 'BookmarkCreate(url: $url, title: $title, labels: $labels)';
}


}

/// @nodoc
abstract mixin class _$BookmarkCreateCopyWith<$Res> implements $BookmarkCreateCopyWith<$Res> {
  factory _$BookmarkCreateCopyWith(_BookmarkCreate value, $Res Function(_BookmarkCreate) _then) = __$BookmarkCreateCopyWithImpl;
@override @useResult
$Res call({
 String url, String? title, List<String>? labels
});




}
/// @nodoc
class __$BookmarkCreateCopyWithImpl<$Res>
    implements _$BookmarkCreateCopyWith<$Res> {
  __$BookmarkCreateCopyWithImpl(this._self, this._then);

  final _BookmarkCreate _self;
  final $Res Function(_BookmarkCreate) _then;

/// Create a copy of BookmarkCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? title = freezed,Object? labels = freezed,}) {
  return _then(_BookmarkCreate(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,labels: freezed == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$BookmarkUpdate {

 String? get title;@JsonKey(name: 'is_marked') bool? get isMarked;@JsonKey(name: 'is_archived') bool? get isArchived;@JsonKey(name: 'is_deleted') bool? get isDeleted;@JsonKey(name: 'read_progress') int? get readProgress;@JsonKey(name: 'read_anchor') String? get readAnchor; List<String>? get labels;@JsonKey(name: 'add_labels') List<String>? get addLabels;@JsonKey(name: 'remove_labels') List<String>? get removeLabels;
/// Create a copy of BookmarkUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkUpdateCopyWith<BookmarkUpdate> get copyWith => _$BookmarkUpdateCopyWithImpl<BookmarkUpdate>(this as BookmarkUpdate, _$identity);

  /// Serializes this BookmarkUpdate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkUpdate&&(identical(other.title, title) || other.title == title)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.readProgress, readProgress) || other.readProgress == readProgress)&&(identical(other.readAnchor, readAnchor) || other.readAnchor == readAnchor)&&const DeepCollectionEquality().equals(other.labels, labels)&&const DeepCollectionEquality().equals(other.addLabels, addLabels)&&const DeepCollectionEquality().equals(other.removeLabels, removeLabels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,isMarked,isArchived,isDeleted,readProgress,readAnchor,const DeepCollectionEquality().hash(labels),const DeepCollectionEquality().hash(addLabels),const DeepCollectionEquality().hash(removeLabels));

@override
String toString() {
  return 'BookmarkUpdate(title: $title, isMarked: $isMarked, isArchived: $isArchived, isDeleted: $isDeleted, readProgress: $readProgress, readAnchor: $readAnchor, labels: $labels, addLabels: $addLabels, removeLabels: $removeLabels)';
}


}

/// @nodoc
abstract mixin class $BookmarkUpdateCopyWith<$Res>  {
  factory $BookmarkUpdateCopyWith(BookmarkUpdate value, $Res Function(BookmarkUpdate) _then) = _$BookmarkUpdateCopyWithImpl;
@useResult
$Res call({
 String? title,@JsonKey(name: 'is_marked') bool? isMarked,@JsonKey(name: 'is_archived') bool? isArchived,@JsonKey(name: 'is_deleted') bool? isDeleted,@JsonKey(name: 'read_progress') int? readProgress,@JsonKey(name: 'read_anchor') String? readAnchor, List<String>? labels,@JsonKey(name: 'add_labels') List<String>? addLabels,@JsonKey(name: 'remove_labels') List<String>? removeLabels
});




}
/// @nodoc
class _$BookmarkUpdateCopyWithImpl<$Res>
    implements $BookmarkUpdateCopyWith<$Res> {
  _$BookmarkUpdateCopyWithImpl(this._self, this._then);

  final BookmarkUpdate _self;
  final $Res Function(BookmarkUpdate) _then;

/// Create a copy of BookmarkUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? isDeleted = freezed,Object? readProgress = freezed,Object? readAnchor = freezed,Object? labels = freezed,Object? addLabels = freezed,Object? removeLabels = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,readProgress: freezed == readProgress ? _self.readProgress : readProgress // ignore: cast_nullable_to_non_nullable
as int?,readAnchor: freezed == readAnchor ? _self.readAnchor : readAnchor // ignore: cast_nullable_to_non_nullable
as String?,labels: freezed == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,addLabels: freezed == addLabels ? _self.addLabels : addLabels // ignore: cast_nullable_to_non_nullable
as List<String>?,removeLabels: freezed == removeLabels ? _self.removeLabels : removeLabels // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookmarkUpdate implements BookmarkUpdate {
  const _BookmarkUpdate({this.title, @JsonKey(name: 'is_marked') this.isMarked, @JsonKey(name: 'is_archived') this.isArchived, @JsonKey(name: 'is_deleted') this.isDeleted, @JsonKey(name: 'read_progress') this.readProgress, @JsonKey(name: 'read_anchor') this.readAnchor, final  List<String>? labels, @JsonKey(name: 'add_labels') final  List<String>? addLabels, @JsonKey(name: 'remove_labels') final  List<String>? removeLabels}): _labels = labels,_addLabels = addLabels,_removeLabels = removeLabels;
  factory _BookmarkUpdate.fromJson(Map<String, dynamic> json) => _$BookmarkUpdateFromJson(json);

@override final  String? title;
@override@JsonKey(name: 'is_marked') final  bool? isMarked;
@override@JsonKey(name: 'is_archived') final  bool? isArchived;
@override@JsonKey(name: 'is_deleted') final  bool? isDeleted;
@override@JsonKey(name: 'read_progress') final  int? readProgress;
@override@JsonKey(name: 'read_anchor') final  String? readAnchor;
 final  List<String>? _labels;
@override List<String>? get labels {
  final value = _labels;
  if (value == null) return null;
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _addLabels;
@override@JsonKey(name: 'add_labels') List<String>? get addLabels {
  final value = _addLabels;
  if (value == null) return null;
  if (_addLabels is EqualUnmodifiableListView) return _addLabels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _removeLabels;
@override@JsonKey(name: 'remove_labels') List<String>? get removeLabels {
  final value = _removeLabels;
  if (value == null) return null;
  if (_removeLabels is EqualUnmodifiableListView) return _removeLabels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of BookmarkUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkUpdateCopyWith<_BookmarkUpdate> get copyWith => __$BookmarkUpdateCopyWithImpl<_BookmarkUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkUpdate&&(identical(other.title, title) || other.title == title)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.readProgress, readProgress) || other.readProgress == readProgress)&&(identical(other.readAnchor, readAnchor) || other.readAnchor == readAnchor)&&const DeepCollectionEquality().equals(other._labels, _labels)&&const DeepCollectionEquality().equals(other._addLabels, _addLabels)&&const DeepCollectionEquality().equals(other._removeLabels, _removeLabels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,isMarked,isArchived,isDeleted,readProgress,readAnchor,const DeepCollectionEquality().hash(_labels),const DeepCollectionEquality().hash(_addLabels),const DeepCollectionEquality().hash(_removeLabels));

@override
String toString() {
  return 'BookmarkUpdate(title: $title, isMarked: $isMarked, isArchived: $isArchived, isDeleted: $isDeleted, readProgress: $readProgress, readAnchor: $readAnchor, labels: $labels, addLabels: $addLabels, removeLabels: $removeLabels)';
}


}

/// @nodoc
abstract mixin class _$BookmarkUpdateCopyWith<$Res> implements $BookmarkUpdateCopyWith<$Res> {
  factory _$BookmarkUpdateCopyWith(_BookmarkUpdate value, $Res Function(_BookmarkUpdate) _then) = __$BookmarkUpdateCopyWithImpl;
@override @useResult
$Res call({
 String? title,@JsonKey(name: 'is_marked') bool? isMarked,@JsonKey(name: 'is_archived') bool? isArchived,@JsonKey(name: 'is_deleted') bool? isDeleted,@JsonKey(name: 'read_progress') int? readProgress,@JsonKey(name: 'read_anchor') String? readAnchor, List<String>? labels,@JsonKey(name: 'add_labels') List<String>? addLabels,@JsonKey(name: 'remove_labels') List<String>? removeLabels
});




}
/// @nodoc
class __$BookmarkUpdateCopyWithImpl<$Res>
    implements _$BookmarkUpdateCopyWith<$Res> {
  __$BookmarkUpdateCopyWithImpl(this._self, this._then);

  final _BookmarkUpdate _self;
  final $Res Function(_BookmarkUpdate) _then;

/// Create a copy of BookmarkUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? isDeleted = freezed,Object? readProgress = freezed,Object? readAnchor = freezed,Object? labels = freezed,Object? addLabels = freezed,Object? removeLabels = freezed,}) {
  return _then(_BookmarkUpdate(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,readProgress: freezed == readProgress ? _self.readProgress : readProgress // ignore: cast_nullable_to_non_nullable
as int?,readAnchor: freezed == readAnchor ? _self.readAnchor : readAnchor // ignore: cast_nullable_to_non_nullable
as String?,labels: freezed == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,addLabels: freezed == addLabels ? _self._addLabels : addLabels // ignore: cast_nullable_to_non_nullable
as List<String>?,removeLabels: freezed == removeLabels ? _self._removeLabels : removeLabels // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$BookmarkUpdated {

 String? get href; String? get id; DateTime? get updated; String? get title;@JsonKey(name: 'is_marked') bool? get isMarked;@JsonKey(name: 'is_archived') bool? get isArchived;@JsonKey(name: 'is_deleted') bool? get isDeleted;@JsonKey(name: 'read_progress') int? get readProgress;@JsonKey(name: 'read_anchor') String? get readAnchor; List<String>? get labels;
/// Create a copy of BookmarkUpdated
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkUpdatedCopyWith<BookmarkUpdated> get copyWith => _$BookmarkUpdatedCopyWithImpl<BookmarkUpdated>(this as BookmarkUpdated, _$identity);

  /// Serializes this BookmarkUpdated to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkUpdated&&(identical(other.href, href) || other.href == href)&&(identical(other.id, id) || other.id == id)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.title, title) || other.title == title)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.readProgress, readProgress) || other.readProgress == readProgress)&&(identical(other.readAnchor, readAnchor) || other.readAnchor == readAnchor)&&const DeepCollectionEquality().equals(other.labels, labels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,href,id,updated,title,isMarked,isArchived,isDeleted,readProgress,readAnchor,const DeepCollectionEquality().hash(labels));

@override
String toString() {
  return 'BookmarkUpdated(href: $href, id: $id, updated: $updated, title: $title, isMarked: $isMarked, isArchived: $isArchived, isDeleted: $isDeleted, readProgress: $readProgress, readAnchor: $readAnchor, labels: $labels)';
}


}

/// @nodoc
abstract mixin class $BookmarkUpdatedCopyWith<$Res>  {
  factory $BookmarkUpdatedCopyWith(BookmarkUpdated value, $Res Function(BookmarkUpdated) _then) = _$BookmarkUpdatedCopyWithImpl;
@useResult
$Res call({
 String? href, String? id, DateTime? updated, String? title,@JsonKey(name: 'is_marked') bool? isMarked,@JsonKey(name: 'is_archived') bool? isArchived,@JsonKey(name: 'is_deleted') bool? isDeleted,@JsonKey(name: 'read_progress') int? readProgress,@JsonKey(name: 'read_anchor') String? readAnchor, List<String>? labels
});




}
/// @nodoc
class _$BookmarkUpdatedCopyWithImpl<$Res>
    implements $BookmarkUpdatedCopyWith<$Res> {
  _$BookmarkUpdatedCopyWithImpl(this._self, this._then);

  final BookmarkUpdated _self;
  final $Res Function(BookmarkUpdated) _then;

/// Create a copy of BookmarkUpdated
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? href = freezed,Object? id = freezed,Object? updated = freezed,Object? title = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? isDeleted = freezed,Object? readProgress = freezed,Object? readAnchor = freezed,Object? labels = freezed,}) {
  return _then(_self.copyWith(
href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,readProgress: freezed == readProgress ? _self.readProgress : readProgress // ignore: cast_nullable_to_non_nullable
as int?,readAnchor: freezed == readAnchor ? _self.readAnchor : readAnchor // ignore: cast_nullable_to_non_nullable
as String?,labels: freezed == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookmarkUpdated implements BookmarkUpdated {
  const _BookmarkUpdated({this.href, this.id, this.updated, this.title, @JsonKey(name: 'is_marked') this.isMarked, @JsonKey(name: 'is_archived') this.isArchived, @JsonKey(name: 'is_deleted') this.isDeleted, @JsonKey(name: 'read_progress') this.readProgress, @JsonKey(name: 'read_anchor') this.readAnchor, final  List<String>? labels}): _labels = labels;
  factory _BookmarkUpdated.fromJson(Map<String, dynamic> json) => _$BookmarkUpdatedFromJson(json);

@override final  String? href;
@override final  String? id;
@override final  DateTime? updated;
@override final  String? title;
@override@JsonKey(name: 'is_marked') final  bool? isMarked;
@override@JsonKey(name: 'is_archived') final  bool? isArchived;
@override@JsonKey(name: 'is_deleted') final  bool? isDeleted;
@override@JsonKey(name: 'read_progress') final  int? readProgress;
@override@JsonKey(name: 'read_anchor') final  String? readAnchor;
 final  List<String>? _labels;
@override List<String>? get labels {
  final value = _labels;
  if (value == null) return null;
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of BookmarkUpdated
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkUpdatedCopyWith<_BookmarkUpdated> get copyWith => __$BookmarkUpdatedCopyWithImpl<_BookmarkUpdated>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkUpdatedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkUpdated&&(identical(other.href, href) || other.href == href)&&(identical(other.id, id) || other.id == id)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.title, title) || other.title == title)&&(identical(other.isMarked, isMarked) || other.isMarked == isMarked)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.readProgress, readProgress) || other.readProgress == readProgress)&&(identical(other.readAnchor, readAnchor) || other.readAnchor == readAnchor)&&const DeepCollectionEquality().equals(other._labels, _labels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,href,id,updated,title,isMarked,isArchived,isDeleted,readProgress,readAnchor,const DeepCollectionEquality().hash(_labels));

@override
String toString() {
  return 'BookmarkUpdated(href: $href, id: $id, updated: $updated, title: $title, isMarked: $isMarked, isArchived: $isArchived, isDeleted: $isDeleted, readProgress: $readProgress, readAnchor: $readAnchor, labels: $labels)';
}


}

/// @nodoc
abstract mixin class _$BookmarkUpdatedCopyWith<$Res> implements $BookmarkUpdatedCopyWith<$Res> {
  factory _$BookmarkUpdatedCopyWith(_BookmarkUpdated value, $Res Function(_BookmarkUpdated) _then) = __$BookmarkUpdatedCopyWithImpl;
@override @useResult
$Res call({
 String? href, String? id, DateTime? updated, String? title,@JsonKey(name: 'is_marked') bool? isMarked,@JsonKey(name: 'is_archived') bool? isArchived,@JsonKey(name: 'is_deleted') bool? isDeleted,@JsonKey(name: 'read_progress') int? readProgress,@JsonKey(name: 'read_anchor') String? readAnchor, List<String>? labels
});




}
/// @nodoc
class __$BookmarkUpdatedCopyWithImpl<$Res>
    implements _$BookmarkUpdatedCopyWith<$Res> {
  __$BookmarkUpdatedCopyWithImpl(this._self, this._then);

  final _BookmarkUpdated _self;
  final $Res Function(_BookmarkUpdated) _then;

/// Create a copy of BookmarkUpdated
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? href = freezed,Object? id = freezed,Object? updated = freezed,Object? title = freezed,Object? isMarked = freezed,Object? isArchived = freezed,Object? isDeleted = freezed,Object? readProgress = freezed,Object? readAnchor = freezed,Object? labels = freezed,}) {
  return _then(_BookmarkUpdated(
href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,isMarked: freezed == isMarked ? _self.isMarked : isMarked // ignore: cast_nullable_to_non_nullable
as bool?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,readProgress: freezed == readProgress ? _self.readProgress : readProgress // ignore: cast_nullable_to_non_nullable
as int?,readAnchor: freezed == readAnchor ? _self.readAnchor : readAnchor // ignore: cast_nullable_to_non_nullable
as String?,labels: freezed == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$BookmarkSync {

 String? get id; String? get href; DateTime? get created; DateTime? get updated;
/// Create a copy of BookmarkSync
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkSyncCopyWith<BookmarkSync> get copyWith => _$BookmarkSyncCopyWithImpl<BookmarkSync>(this as BookmarkSync, _$identity);

  /// Serializes this BookmarkSync to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkSync&&(identical(other.id, id) || other.id == id)&&(identical(other.href, href) || other.href == href)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,href,created,updated);

@override
String toString() {
  return 'BookmarkSync(id: $id, href: $href, created: $created, updated: $updated)';
}


}

/// @nodoc
abstract mixin class $BookmarkSyncCopyWith<$Res>  {
  factory $BookmarkSyncCopyWith(BookmarkSync value, $Res Function(BookmarkSync) _then) = _$BookmarkSyncCopyWithImpl;
@useResult
$Res call({
 String? id, String? href, DateTime? created, DateTime? updated
});




}
/// @nodoc
class _$BookmarkSyncCopyWithImpl<$Res>
    implements $BookmarkSyncCopyWith<$Res> {
  _$BookmarkSyncCopyWithImpl(this._self, this._then);

  final BookmarkSync _self;
  final $Res Function(BookmarkSync) _then;

/// Create a copy of BookmarkSync
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? href = freezed,Object? created = freezed,Object? updated = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookmarkSync implements BookmarkSync {
  const _BookmarkSync({this.id, this.href, this.created, this.updated});
  factory _BookmarkSync.fromJson(Map<String, dynamic> json) => _$BookmarkSyncFromJson(json);

@override final  String? id;
@override final  String? href;
@override final  DateTime? created;
@override final  DateTime? updated;

/// Create a copy of BookmarkSync
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkSyncCopyWith<_BookmarkSync> get copyWith => __$BookmarkSyncCopyWithImpl<_BookmarkSync>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkSyncToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkSync&&(identical(other.id, id) || other.id == id)&&(identical(other.href, href) || other.href == href)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,href,created,updated);

@override
String toString() {
  return 'BookmarkSync(id: $id, href: $href, created: $created, updated: $updated)';
}


}

/// @nodoc
abstract mixin class _$BookmarkSyncCopyWith<$Res> implements $BookmarkSyncCopyWith<$Res> {
  factory _$BookmarkSyncCopyWith(_BookmarkSync value, $Res Function(_BookmarkSync) _then) = __$BookmarkSyncCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? href, DateTime? created, DateTime? updated
});




}
/// @nodoc
class __$BookmarkSyncCopyWithImpl<$Res>
    implements _$BookmarkSyncCopyWith<$Res> {
  __$BookmarkSyncCopyWithImpl(this._self, this._then);

  final _BookmarkSync _self;
  final $Res Function(_BookmarkSync) _then;

/// Create a copy of BookmarkSync
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? href = freezed,Object? created = freezed,Object? updated = freezed,}) {
  return _then(_BookmarkSync(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$BookmarkShareLink {

 String? get url; DateTime? get expires; String? get title; String? get id;
/// Create a copy of BookmarkShareLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkShareLinkCopyWith<BookmarkShareLink> get copyWith => _$BookmarkShareLinkCopyWithImpl<BookmarkShareLink>(this as BookmarkShareLink, _$identity);

  /// Serializes this BookmarkShareLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkShareLink&&(identical(other.url, url) || other.url == url)&&(identical(other.expires, expires) || other.expires == expires)&&(identical(other.title, title) || other.title == title)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,expires,title,id);

@override
String toString() {
  return 'BookmarkShareLink(url: $url, expires: $expires, title: $title, id: $id)';
}


}

/// @nodoc
abstract mixin class $BookmarkShareLinkCopyWith<$Res>  {
  factory $BookmarkShareLinkCopyWith(BookmarkShareLink value, $Res Function(BookmarkShareLink) _then) = _$BookmarkShareLinkCopyWithImpl;
@useResult
$Res call({
 String? url, DateTime? expires, String? title, String? id
});




}
/// @nodoc
class _$BookmarkShareLinkCopyWithImpl<$Res>
    implements $BookmarkShareLinkCopyWith<$Res> {
  _$BookmarkShareLinkCopyWithImpl(this._self, this._then);

  final BookmarkShareLink _self;
  final $Res Function(BookmarkShareLink) _then;

/// Create a copy of BookmarkShareLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? expires = freezed,Object? title = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,expires: freezed == expires ? _self.expires : expires // ignore: cast_nullable_to_non_nullable
as DateTime?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookmarkShareLink implements BookmarkShareLink {
  const _BookmarkShareLink({this.url, this.expires, this.title, this.id});
  factory _BookmarkShareLink.fromJson(Map<String, dynamic> json) => _$BookmarkShareLinkFromJson(json);

@override final  String? url;
@override final  DateTime? expires;
@override final  String? title;
@override final  String? id;

/// Create a copy of BookmarkShareLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkShareLinkCopyWith<_BookmarkShareLink> get copyWith => __$BookmarkShareLinkCopyWithImpl<_BookmarkShareLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkShareLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkShareLink&&(identical(other.url, url) || other.url == url)&&(identical(other.expires, expires) || other.expires == expires)&&(identical(other.title, title) || other.title == title)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,expires,title,id);

@override
String toString() {
  return 'BookmarkShareLink(url: $url, expires: $expires, title: $title, id: $id)';
}


}

/// @nodoc
abstract mixin class _$BookmarkShareLinkCopyWith<$Res> implements $BookmarkShareLinkCopyWith<$Res> {
  factory _$BookmarkShareLinkCopyWith(_BookmarkShareLink value, $Res Function(_BookmarkShareLink) _then) = __$BookmarkShareLinkCopyWithImpl;
@override @useResult
$Res call({
 String? url, DateTime? expires, String? title, String? id
});




}
/// @nodoc
class __$BookmarkShareLinkCopyWithImpl<$Res>
    implements _$BookmarkShareLinkCopyWith<$Res> {
  __$BookmarkShareLinkCopyWithImpl(this._self, this._then);

  final _BookmarkShareLink _self;
  final $Res Function(_BookmarkShareLink) _then;

/// Create a copy of BookmarkShareLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? expires = freezed,Object? title = freezed,Object? id = freezed,}) {
  return _then(_BookmarkShareLink(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,expires: freezed == expires ? _self.expires : expires // ignore: cast_nullable_to_non_nullable
as DateTime?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BookmarkShareEmail {

 String get email; String get format;
/// Create a copy of BookmarkShareEmail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkShareEmailCopyWith<BookmarkShareEmail> get copyWith => _$BookmarkShareEmailCopyWithImpl<BookmarkShareEmail>(this as BookmarkShareEmail, _$identity);

  /// Serializes this BookmarkShareEmail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkShareEmail&&(identical(other.email, email) || other.email == email)&&(identical(other.format, format) || other.format == format));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,format);

@override
String toString() {
  return 'BookmarkShareEmail(email: $email, format: $format)';
}


}

/// @nodoc
abstract mixin class $BookmarkShareEmailCopyWith<$Res>  {
  factory $BookmarkShareEmailCopyWith(BookmarkShareEmail value, $Res Function(BookmarkShareEmail) _then) = _$BookmarkShareEmailCopyWithImpl;
@useResult
$Res call({
 String email, String format
});




}
/// @nodoc
class _$BookmarkShareEmailCopyWithImpl<$Res>
    implements $BookmarkShareEmailCopyWith<$Res> {
  _$BookmarkShareEmailCopyWithImpl(this._self, this._then);

  final BookmarkShareEmail _self;
  final $Res Function(BookmarkShareEmail) _then;

/// Create a copy of BookmarkShareEmail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? format = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookmarkShareEmail implements BookmarkShareEmail {
  const _BookmarkShareEmail({required this.email, required this.format});
  factory _BookmarkShareEmail.fromJson(Map<String, dynamic> json) => _$BookmarkShareEmailFromJson(json);

@override final  String email;
@override final  String format;

/// Create a copy of BookmarkShareEmail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkShareEmailCopyWith<_BookmarkShareEmail> get copyWith => __$BookmarkShareEmailCopyWithImpl<_BookmarkShareEmail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkShareEmailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkShareEmail&&(identical(other.email, email) || other.email == email)&&(identical(other.format, format) || other.format == format));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,format);

@override
String toString() {
  return 'BookmarkShareEmail(email: $email, format: $format)';
}


}

/// @nodoc
abstract mixin class _$BookmarkShareEmailCopyWith<$Res> implements $BookmarkShareEmailCopyWith<$Res> {
  factory _$BookmarkShareEmailCopyWith(_BookmarkShareEmail value, $Res Function(_BookmarkShareEmail) _then) = __$BookmarkShareEmailCopyWithImpl;
@override @useResult
$Res call({
 String email, String format
});




}
/// @nodoc
class __$BookmarkShareEmailCopyWithImpl<$Res>
    implements _$BookmarkShareEmailCopyWith<$Res> {
  __$BookmarkShareEmailCopyWithImpl(this._self, this._then);

  final _BookmarkShareEmail _self;
  final $Res Function(_BookmarkShareEmail) _then;

/// Create a copy of BookmarkShareEmail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? format = null,}) {
  return _then(_BookmarkShareEmail(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
