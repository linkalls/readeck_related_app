// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cookbook.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExtractionProperties {

@JsonKey(name: 'json-ld') List<Map<String, dynamic>>? get jsonLd;// List of JSON-LD objects
 List<Map<String, String>>? get link;// List of link attribute maps (each map is key-value, e.g. {"@rel":"...", "@href":"..."})
 List<Map<String, String>>? get meta;
/// Create a copy of ExtractionProperties
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtractionPropertiesCopyWith<ExtractionProperties> get copyWith => _$ExtractionPropertiesCopyWithImpl<ExtractionProperties>(this as ExtractionProperties, _$identity);

  /// Serializes this ExtractionProperties to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtractionProperties&&const DeepCollectionEquality().equals(other.jsonLd, jsonLd)&&const DeepCollectionEquality().equals(other.link, link)&&const DeepCollectionEquality().equals(other.meta, meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(jsonLd),const DeepCollectionEquality().hash(link),const DeepCollectionEquality().hash(meta));

@override
String toString() {
  return 'ExtractionProperties(jsonLd: $jsonLd, link: $link, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ExtractionPropertiesCopyWith<$Res>  {
  factory $ExtractionPropertiesCopyWith(ExtractionProperties value, $Res Function(ExtractionProperties) _then) = _$ExtractionPropertiesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'json-ld') List<Map<String, dynamic>>? jsonLd, List<Map<String, String>>? link, List<Map<String, String>>? meta
});




}
/// @nodoc
class _$ExtractionPropertiesCopyWithImpl<$Res>
    implements $ExtractionPropertiesCopyWith<$Res> {
  _$ExtractionPropertiesCopyWithImpl(this._self, this._then);

  final ExtractionProperties _self;
  final $Res Function(ExtractionProperties) _then;

/// Create a copy of ExtractionProperties
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jsonLd = freezed,Object? link = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
jsonLd: freezed == jsonLd ? _self.jsonLd : jsonLd // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ExtractionProperties implements ExtractionProperties {
  const _ExtractionProperties({@JsonKey(name: 'json-ld') final  List<Map<String, dynamic>>? jsonLd, final  List<Map<String, String>>? link, final  List<Map<String, String>>? meta}): _jsonLd = jsonLd,_link = link,_meta = meta;
  factory _ExtractionProperties.fromJson(Map<String, dynamic> json) => _$ExtractionPropertiesFromJson(json);

 final  List<Map<String, dynamic>>? _jsonLd;
@override@JsonKey(name: 'json-ld') List<Map<String, dynamic>>? get jsonLd {
  final value = _jsonLd;
  if (value == null) return null;
  if (_jsonLd is EqualUnmodifiableListView) return _jsonLd;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// List of JSON-LD objects
 final  List<Map<String, String>>? _link;
// List of JSON-LD objects
@override List<Map<String, String>>? get link {
  final value = _link;
  if (value == null) return null;
  if (_link is EqualUnmodifiableListView) return _link;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// List of link attribute maps (each map is key-value, e.g. {"@rel":"...", "@href":"..."})
 final  List<Map<String, String>>? _meta;
// List of link attribute maps (each map is key-value, e.g. {"@rel":"...", "@href":"..."})
@override List<Map<String, String>>? get meta {
  final value = _meta;
  if (value == null) return null;
  if (_meta is EqualUnmodifiableListView) return _meta;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ExtractionProperties
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtractionPropertiesCopyWith<_ExtractionProperties> get copyWith => __$ExtractionPropertiesCopyWithImpl<_ExtractionProperties>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtractionPropertiesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtractionProperties&&const DeepCollectionEquality().equals(other._jsonLd, _jsonLd)&&const DeepCollectionEquality().equals(other._link, _link)&&const DeepCollectionEquality().equals(other._meta, _meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_jsonLd),const DeepCollectionEquality().hash(_link),const DeepCollectionEquality().hash(_meta));

@override
String toString() {
  return 'ExtractionProperties(jsonLd: $jsonLd, link: $link, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ExtractionPropertiesCopyWith<$Res> implements $ExtractionPropertiesCopyWith<$Res> {
  factory _$ExtractionPropertiesCopyWith(_ExtractionProperties value, $Res Function(_ExtractionProperties) _then) = __$ExtractionPropertiesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'json-ld') List<Map<String, dynamic>>? jsonLd, List<Map<String, String>>? link, List<Map<String, String>>? meta
});




}
/// @nodoc
class __$ExtractionPropertiesCopyWithImpl<$Res>
    implements _$ExtractionPropertiesCopyWith<$Res> {
  __$ExtractionPropertiesCopyWithImpl(this._self, this._then);

  final _ExtractionProperties _self;
  final $Res Function(_ExtractionProperties) _then;

/// Create a copy of ExtractionProperties
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jsonLd = freezed,Object? link = freezed,Object? meta = freezed,}) {
  return _then(_ExtractionProperties(
jsonLd: freezed == jsonLd ? _self._jsonLd : jsonLd // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,link: freezed == link ? _self._link : link // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>?,meta: freezed == meta ? _self._meta : meta // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>?,
  ));
}


}


/// @nodoc
mixin _$ExtractionImageDetails {

 List<int>? get size;// [width, height]
 String? get encoded;
/// Create a copy of ExtractionImageDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtractionImageDetailsCopyWith<ExtractionImageDetails> get copyWith => _$ExtractionImageDetailsCopyWithImpl<ExtractionImageDetails>(this as ExtractionImageDetails, _$identity);

  /// Serializes this ExtractionImageDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtractionImageDetails&&const DeepCollectionEquality().equals(other.size, size)&&(identical(other.encoded, encoded) || other.encoded == encoded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(size),encoded);

@override
String toString() {
  return 'ExtractionImageDetails(size: $size, encoded: $encoded)';
}


}

/// @nodoc
abstract mixin class $ExtractionImageDetailsCopyWith<$Res>  {
  factory $ExtractionImageDetailsCopyWith(ExtractionImageDetails value, $Res Function(ExtractionImageDetails) _then) = _$ExtractionImageDetailsCopyWithImpl;
@useResult
$Res call({
 List<int>? size, String? encoded
});




}
/// @nodoc
class _$ExtractionImageDetailsCopyWithImpl<$Res>
    implements $ExtractionImageDetailsCopyWith<$Res> {
  _$ExtractionImageDetailsCopyWithImpl(this._self, this._then);

  final ExtractionImageDetails _self;
  final $Res Function(ExtractionImageDetails) _then;

/// Create a copy of ExtractionImageDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = freezed,Object? encoded = freezed,}) {
  return _then(_self.copyWith(
size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as List<int>?,encoded: freezed == encoded ? _self.encoded : encoded // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ExtractionImageDetails implements ExtractionImageDetails {
  const _ExtractionImageDetails({final  List<int>? size, this.encoded}): _size = size;
  factory _ExtractionImageDetails.fromJson(Map<String, dynamic> json) => _$ExtractionImageDetailsFromJson(json);

 final  List<int>? _size;
@override List<int>? get size {
  final value = _size;
  if (value == null) return null;
  if (_size is EqualUnmodifiableListView) return _size;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// [width, height]
@override final  String? encoded;

/// Create a copy of ExtractionImageDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtractionImageDetailsCopyWith<_ExtractionImageDetails> get copyWith => __$ExtractionImageDetailsCopyWithImpl<_ExtractionImageDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtractionImageDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtractionImageDetails&&const DeepCollectionEquality().equals(other._size, _size)&&(identical(other.encoded, encoded) || other.encoded == encoded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_size),encoded);

@override
String toString() {
  return 'ExtractionImageDetails(size: $size, encoded: $encoded)';
}


}

/// @nodoc
abstract mixin class _$ExtractionImageDetailsCopyWith<$Res> implements $ExtractionImageDetailsCopyWith<$Res> {
  factory _$ExtractionImageDetailsCopyWith(_ExtractionImageDetails value, $Res Function(_ExtractionImageDetails) _then) = __$ExtractionImageDetailsCopyWithImpl;
@override @useResult
$Res call({
 List<int>? size, String? encoded
});




}
/// @nodoc
class __$ExtractionImageDetailsCopyWithImpl<$Res>
    implements _$ExtractionImageDetailsCopyWith<$Res> {
  __$ExtractionImageDetailsCopyWithImpl(this._self, this._then);

  final _ExtractionImageDetails _self;
  final $Res Function(_ExtractionImageDetails) _then;

/// Create a copy of ExtractionImageDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = freezed,Object? encoded = freezed,}) {
  return _then(_ExtractionImageDetails(
size: freezed == size ? _self._size : size // ignore: cast_nullable_to_non_nullable
as List<int>?,encoded: freezed == encoded ? _self.encoded : encoded // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ExtractionResult {

 String? get url; List<String>? get logs; List<String>? get errors; Map<String, List<String>>? get meta;// "meta tags extracted", schema: {additionalProperties: {type: array, items: {type: string}}}
 ExtractionProperties? get properties; String? get domain; String? get title; List<String>? get authors; String? get site;@JsonKey(name: 'site_name') String? get siteName; String? get lang;@JsonKey(name: 'text_direction') String? get textDirection;// rtl, ltr
 DateTime? get date;@JsonKey(name: 'document_type') String? get documentType; String? get description; String? get html;// HTML content after processing
 String? get embed;// oembed HTML fragment
 Map<String, ExtractionImageDetails>? get images;
/// Create a copy of ExtractionResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtractionResultCopyWith<ExtractionResult> get copyWith => _$ExtractionResultCopyWithImpl<ExtractionResult>(this as ExtractionResult, _$identity);

  /// Serializes this ExtractionResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtractionResult&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.logs, logs)&&const DeepCollectionEquality().equals(other.errors, errors)&&const DeepCollectionEquality().equals(other.meta, meta)&&(identical(other.properties, properties) || other.properties == properties)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.authors, authors)&&(identical(other.site, site) || other.site == site)&&(identical(other.siteName, siteName) || other.siteName == siteName)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.textDirection, textDirection) || other.textDirection == textDirection)&&(identical(other.date, date) || other.date == date)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.description, description) || other.description == description)&&(identical(other.html, html) || other.html == html)&&(identical(other.embed, embed) || other.embed == embed)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,const DeepCollectionEquality().hash(logs),const DeepCollectionEquality().hash(errors),const DeepCollectionEquality().hash(meta),properties,domain,title,const DeepCollectionEquality().hash(authors),site,siteName,lang,textDirection,date,documentType,description,html,embed,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'ExtractionResult(url: $url, logs: $logs, errors: $errors, meta: $meta, properties: $properties, domain: $domain, title: $title, authors: $authors, site: $site, siteName: $siteName, lang: $lang, textDirection: $textDirection, date: $date, documentType: $documentType, description: $description, html: $html, embed: $embed, images: $images)';
}


}

/// @nodoc
abstract mixin class $ExtractionResultCopyWith<$Res>  {
  factory $ExtractionResultCopyWith(ExtractionResult value, $Res Function(ExtractionResult) _then) = _$ExtractionResultCopyWithImpl;
@useResult
$Res call({
 String? url, List<String>? logs, List<String>? errors, Map<String, List<String>>? meta, ExtractionProperties? properties, String? domain, String? title, List<String>? authors, String? site,@JsonKey(name: 'site_name') String? siteName, String? lang,@JsonKey(name: 'text_direction') String? textDirection, DateTime? date,@JsonKey(name: 'document_type') String? documentType, String? description, String? html, String? embed, Map<String, ExtractionImageDetails>? images
});


$ExtractionPropertiesCopyWith<$Res>? get properties;

}
/// @nodoc
class _$ExtractionResultCopyWithImpl<$Res>
    implements $ExtractionResultCopyWith<$Res> {
  _$ExtractionResultCopyWithImpl(this._self, this._then);

  final ExtractionResult _self;
  final $Res Function(ExtractionResult) _then;

/// Create a copy of ExtractionResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? logs = freezed,Object? errors = freezed,Object? meta = freezed,Object? properties = freezed,Object? domain = freezed,Object? title = freezed,Object? authors = freezed,Object? site = freezed,Object? siteName = freezed,Object? lang = freezed,Object? textDirection = freezed,Object? date = freezed,Object? documentType = freezed,Object? description = freezed,Object? html = freezed,Object? embed = freezed,Object? images = freezed,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,logs: freezed == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as List<String>?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<String>?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>?,properties: freezed == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as ExtractionProperties?,domain: freezed == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,authors: freezed == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,siteName: freezed == siteName ? _self.siteName : siteName // ignore: cast_nullable_to_non_nullable
as String?,lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,textDirection: freezed == textDirection ? _self.textDirection : textDirection // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,html: freezed == html ? _self.html : html // ignore: cast_nullable_to_non_nullable
as String?,embed: freezed == embed ? _self.embed : embed // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as Map<String, ExtractionImageDetails>?,
  ));
}
/// Create a copy of ExtractionResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExtractionPropertiesCopyWith<$Res>? get properties {
    if (_self.properties == null) {
    return null;
  }

  return $ExtractionPropertiesCopyWith<$Res>(_self.properties!, (value) {
    return _then(_self.copyWith(properties: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ExtractionResult implements ExtractionResult {
  const _ExtractionResult({this.url, final  List<String>? logs, final  List<String>? errors, final  Map<String, List<String>>? meta, this.properties, this.domain, this.title, final  List<String>? authors, this.site, @JsonKey(name: 'site_name') this.siteName, this.lang, @JsonKey(name: 'text_direction') this.textDirection, this.date, @JsonKey(name: 'document_type') this.documentType, this.description, this.html, this.embed, final  Map<String, ExtractionImageDetails>? images}): _logs = logs,_errors = errors,_meta = meta,_authors = authors,_images = images;
  factory _ExtractionResult.fromJson(Map<String, dynamic> json) => _$ExtractionResultFromJson(json);

@override final  String? url;
 final  List<String>? _logs;
@override List<String>? get logs {
  final value = _logs;
  if (value == null) return null;
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _errors;
@override List<String>? get errors {
  final value = _errors;
  if (value == null) return null;
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, List<String>>? _meta;
@override Map<String, List<String>>? get meta {
  final value = _meta;
  if (value == null) return null;
  if (_meta is EqualUnmodifiableMapView) return _meta;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

// "meta tags extracted", schema: {additionalProperties: {type: array, items: {type: string}}}
@override final  ExtractionProperties? properties;
@override final  String? domain;
@override final  String? title;
 final  List<String>? _authors;
@override List<String>? get authors {
  final value = _authors;
  if (value == null) return null;
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? site;
@override@JsonKey(name: 'site_name') final  String? siteName;
@override final  String? lang;
@override@JsonKey(name: 'text_direction') final  String? textDirection;
// rtl, ltr
@override final  DateTime? date;
@override@JsonKey(name: 'document_type') final  String? documentType;
@override final  String? description;
@override final  String? html;
// HTML content after processing
@override final  String? embed;
// oembed HTML fragment
 final  Map<String, ExtractionImageDetails>? _images;
// oembed HTML fragment
@override Map<String, ExtractionImageDetails>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableMapView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ExtractionResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtractionResultCopyWith<_ExtractionResult> get copyWith => __$ExtractionResultCopyWithImpl<_ExtractionResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtractionResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtractionResult&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._logs, _logs)&&const DeepCollectionEquality().equals(other._errors, _errors)&&const DeepCollectionEquality().equals(other._meta, _meta)&&(identical(other.properties, properties) || other.properties == properties)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._authors, _authors)&&(identical(other.site, site) || other.site == site)&&(identical(other.siteName, siteName) || other.siteName == siteName)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.textDirection, textDirection) || other.textDirection == textDirection)&&(identical(other.date, date) || other.date == date)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.description, description) || other.description == description)&&(identical(other.html, html) || other.html == html)&&(identical(other.embed, embed) || other.embed == embed)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,const DeepCollectionEquality().hash(_logs),const DeepCollectionEquality().hash(_errors),const DeepCollectionEquality().hash(_meta),properties,domain,title,const DeepCollectionEquality().hash(_authors),site,siteName,lang,textDirection,date,documentType,description,html,embed,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'ExtractionResult(url: $url, logs: $logs, errors: $errors, meta: $meta, properties: $properties, domain: $domain, title: $title, authors: $authors, site: $site, siteName: $siteName, lang: $lang, textDirection: $textDirection, date: $date, documentType: $documentType, description: $description, html: $html, embed: $embed, images: $images)';
}


}

/// @nodoc
abstract mixin class _$ExtractionResultCopyWith<$Res> implements $ExtractionResultCopyWith<$Res> {
  factory _$ExtractionResultCopyWith(_ExtractionResult value, $Res Function(_ExtractionResult) _then) = __$ExtractionResultCopyWithImpl;
@override @useResult
$Res call({
 String? url, List<String>? logs, List<String>? errors, Map<String, List<String>>? meta, ExtractionProperties? properties, String? domain, String? title, List<String>? authors, String? site,@JsonKey(name: 'site_name') String? siteName, String? lang,@JsonKey(name: 'text_direction') String? textDirection, DateTime? date,@JsonKey(name: 'document_type') String? documentType, String? description, String? html, String? embed, Map<String, ExtractionImageDetails>? images
});


@override $ExtractionPropertiesCopyWith<$Res>? get properties;

}
/// @nodoc
class __$ExtractionResultCopyWithImpl<$Res>
    implements _$ExtractionResultCopyWith<$Res> {
  __$ExtractionResultCopyWithImpl(this._self, this._then);

  final _ExtractionResult _self;
  final $Res Function(_ExtractionResult) _then;

/// Create a copy of ExtractionResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? logs = freezed,Object? errors = freezed,Object? meta = freezed,Object? properties = freezed,Object? domain = freezed,Object? title = freezed,Object? authors = freezed,Object? site = freezed,Object? siteName = freezed,Object? lang = freezed,Object? textDirection = freezed,Object? date = freezed,Object? documentType = freezed,Object? description = freezed,Object? html = freezed,Object? embed = freezed,Object? images = freezed,}) {
  return _then(_ExtractionResult(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,logs: freezed == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<String>?,errors: freezed == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<String>?,meta: freezed == meta ? _self._meta : meta // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>?,properties: freezed == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as ExtractionProperties?,domain: freezed == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,authors: freezed == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,siteName: freezed == siteName ? _self.siteName : siteName // ignore: cast_nullable_to_non_nullable
as String?,lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,textDirection: freezed == textDirection ? _self.textDirection : textDirection // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,html: freezed == html ? _self.html : html // ignore: cast_nullable_to_non_nullable
as String?,embed: freezed == embed ? _self.embed : embed // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as Map<String, ExtractionImageDetails>?,
  ));
}

/// Create a copy of ExtractionResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExtractionPropertiesCopyWith<$Res>? get properties {
    if (_self.properties == null) {
    return null;
  }

  return $ExtractionPropertiesCopyWith<$Res>(_self.properties!, (value) {
    return _then(_self.copyWith(properties: value));
  });
}
}

// dart format on
