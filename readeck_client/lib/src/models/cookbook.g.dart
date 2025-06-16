// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cookbook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExtractionProperties _$ExtractionPropertiesFromJson(
  Map<String, dynamic> json,
) => _ExtractionProperties(
  jsonLd: (json['json-ld'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
  link: (json['link'] as List<dynamic>?)
      ?.map((e) => Map<String, String>.from(e as Map))
      .toList(),
  meta: (json['meta'] as List<dynamic>?)
      ?.map((e) => Map<String, String>.from(e as Map))
      .toList(),
);

Map<String, dynamic> _$ExtractionPropertiesToJson(
  _ExtractionProperties instance,
) => <String, dynamic>{
  'json-ld': instance.jsonLd,
  'link': instance.link,
  'meta': instance.meta,
};

_ExtractionImageDetails _$ExtractionImageDetailsFromJson(
  Map<String, dynamic> json,
) => _ExtractionImageDetails(
  size: (json['size'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  encoded: json['encoded'] as String?,
);

Map<String, dynamic> _$ExtractionImageDetailsToJson(
  _ExtractionImageDetails instance,
) => <String, dynamic>{'size': instance.size, 'encoded': instance.encoded};

_ExtractionResult _$ExtractionResultFromJson(
  Map<String, dynamic> json,
) => _ExtractionResult(
  url: json['url'] as String?,
  logs: (json['logs'] as List<dynamic>?)?.map((e) => e as String).toList(),
  errors: (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  meta: (json['meta'] as Map<String, dynamic>?)?.map(
    (k, e) =>
        MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
  ),
  properties: json['properties'] == null
      ? null
      : ExtractionProperties.fromJson(
          json['properties'] as Map<String, dynamic>,
        ),
  domain: json['domain'] as String?,
  title: json['title'] as String?,
  authors: (json['authors'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  site: json['site'] as String?,
  siteName: json['site_name'] as String?,
  lang: json['lang'] as String?,
  textDirection: json['text_direction'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  documentType: json['document_type'] as String?,
  description: json['description'] as String?,
  html: json['html'] as String?,
  embed: json['embed'] as String?,
  images: (json['images'] as Map<String, dynamic>?)?.map(
    (k, e) =>
        MapEntry(k, ExtractionImageDetails.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$ExtractionResultToJson(_ExtractionResult instance) =>
    <String, dynamic>{
      'url': instance.url,
      'logs': instance.logs,
      'errors': instance.errors,
      'meta': instance.meta,
      'properties': instance.properties,
      'domain': instance.domain,
      'title': instance.title,
      'authors': instance.authors,
      'site': instance.site,
      'site_name': instance.siteName,
      'lang': instance.lang,
      'text_direction': instance.textDirection,
      'date': instance.date?.toIso8601String(),
      'document_type': instance.documentType,
      'description': instance.description,
      'html': instance.html,
      'embed': instance.embed,
      'images': instance.images,
    };
