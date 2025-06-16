// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnotationSummary _$AnnotationSummaryFromJson(Map<String, dynamic> json) =>
    _AnnotationSummary(
      id: json['id'] as String?,
      href: json['href'] as String?,
      text: json['text'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      bookmarkId: json['bookmark_id'] as String?,
      bookmarkHref: json['bookmark_href'] as String?,
      bookmarkUrl: json['bookmark_url'] as String?,
      bookmarkTitle: json['bookmark_title'] as String?,
      bookmarkSiteName: json['bookmark_site_name'] as String?,
    );

Map<String, dynamic> _$AnnotationSummaryToJson(_AnnotationSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'href': instance.href,
      'text': instance.text,
      'created': instance.created?.toIso8601String(),
      'bookmark_id': instance.bookmarkId,
      'bookmark_href': instance.bookmarkHref,
      'bookmark_url': instance.bookmarkUrl,
      'bookmark_title': instance.bookmarkTitle,
      'bookmark_site_name': instance.bookmarkSiteName,
    };

_AnnotationInfo _$AnnotationInfoFromJson(Map<String, dynamic> json) =>
    _AnnotationInfo(
      id: json['id'] as String?,
      startSelector: json['start_selector'] as String?,
      startOffset: (json['start_offset'] as num?)?.toInt(),
      endSelector: json['end_selector'] as String?,
      endOffset: (json['end_offset'] as num?)?.toInt(),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      text: json['text'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$AnnotationInfoToJson(_AnnotationInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_selector': instance.startSelector,
      'start_offset': instance.startOffset,
      'end_selector': instance.endSelector,
      'end_offset': instance.endOffset,
      'created': instance.created?.toIso8601String(),
      'text': instance.text,
      'color': instance.color,
    };

_AnnotationCreate _$AnnotationCreateFromJson(Map<String, dynamic> json) =>
    _AnnotationCreate(
      startSelector: json['start_selector'] as String,
      startOffset: (json['start_offset'] as num).toInt(),
      endSelector: json['end_selector'] as String,
      endOffset: (json['end_offset'] as num).toInt(),
      color: json['color'] as String,
    );

Map<String, dynamic> _$AnnotationCreateToJson(_AnnotationCreate instance) =>
    <String, dynamic>{
      'start_selector': instance.startSelector,
      'start_offset': instance.startOffset,
      'end_selector': instance.endSelector,
      'end_offset': instance.endOffset,
      'color': instance.color,
    };

_AnnotationUpdate _$AnnotationUpdateFromJson(Map<String, dynamic> json) =>
    _AnnotationUpdate(color: json['color'] as String);

Map<String, dynamic> _$AnnotationUpdateToJson(_AnnotationUpdate instance) =>
    <String, dynamic>{'color': instance.color};

_AnnotationUpdateResponse _$AnnotationUpdateResponseFromJson(
  Map<String, dynamic> json,
) => _AnnotationUpdateResponse(
  updated: json['updated'] == null
      ? null
      : DateTime.parse(json['updated'] as String),
  annotations: (json['annotations'] as List<dynamic>?)
      ?.map((e) => AnnotationInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AnnotationUpdateResponseToJson(
  _AnnotationUpdateResponse instance,
) => <String, dynamic>{
  'updated': instance.updated?.toIso8601String(),
  'annotations': instance.annotations,
};
