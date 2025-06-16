// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CollectionSummary _$CollectionSummaryFromJson(Map<String, dynamic> json) =>
    _CollectionSummary(
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      name: json['name'] as String?,
      isPinned: json['is_pinned'] as bool?,
      isDeleted: json['is_deleted'] as bool?,
      search: json['search'] as String?,
      title: json['title'] as String?,
      author: json['author'] as String?,
      site: json['site'] as String?,
      type: (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      readStatus: (json['read_status'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isMarked: json['is_marked'] as bool?,
      isArchived: json['is_archived'] as bool?,
      rangeStart: json['range_start'] as String?,
      rangeEnd: json['range_end'] as String?,
    );

Map<String, dynamic> _$CollectionSummaryToJson(_CollectionSummary instance) =>
    <String, dynamic>{
      'updated': instance.updated?.toIso8601String(),
      'name': instance.name,
      'is_pinned': instance.isPinned,
      'is_deleted': instance.isDeleted,
      'search': instance.search,
      'title': instance.title,
      'author': instance.author,
      'site': instance.site,
      'type': instance.type,
      'labels': instance.labels,
      'read_status': instance.readStatus,
      'is_marked': instance.isMarked,
      'is_archived': instance.isArchived,
      'range_start': instance.rangeStart,
      'range_end': instance.rangeEnd,
    };

_CollectionInfo _$CollectionInfoFromJson(Map<String, dynamic> json) =>
    _CollectionInfo(
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      name: json['name'] as String?,
      isPinned: json['is_pinned'] as bool?,
      isDeleted: json['is_deleted'] as bool?,
      search: json['search'] as String?,
      title: json['title'] as String?,
      author: json['author'] as String?,
      site: json['site'] as String?,
      type: (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      readStatus: (json['read_status'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isMarked: json['is_marked'] as bool?,
      isArchived: json['is_archived'] as bool?,
      rangeStart: json['range_start'] as String?,
      rangeEnd: json['range_end'] as String?,
      id: json['id'] as String?,
      href: json['href'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$CollectionInfoToJson(_CollectionInfo instance) =>
    <String, dynamic>{
      'updated': instance.updated?.toIso8601String(),
      'name': instance.name,
      'is_pinned': instance.isPinned,
      'is_deleted': instance.isDeleted,
      'search': instance.search,
      'title': instance.title,
      'author': instance.author,
      'site': instance.site,
      'type': instance.type,
      'labels': instance.labels,
      'read_status': instance.readStatus,
      'is_marked': instance.isMarked,
      'is_archived': instance.isArchived,
      'range_start': instance.rangeStart,
      'range_end': instance.rangeEnd,
      'id': instance.id,
      'href': instance.href,
      'created': instance.created?.toIso8601String(),
    };

_CollectionCreateOrUpdate _$CollectionCreateOrUpdateFromJson(
  Map<String, dynamic> json,
) => _CollectionCreateOrUpdate(
  name: json['name'] as String?,
  isPinned: json['is_pinned'] as bool?,
  isDeleted: json['is_deleted'] as bool?,
  search: json['search'] as String?,
  title: json['title'] as String?,
  author: json['author'] as String?,
  site: json['site'] as String?,
  type: (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
  labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
  readStatus: (json['read_status'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  isMarked: json['is_marked'] as bool?,
  isArchived: json['is_archived'] as bool?,
  rangeStart: json['range_start'] as String?,
  rangeEnd: json['range_end'] as String?,
);

Map<String, dynamic> _$CollectionCreateOrUpdateToJson(
  _CollectionCreateOrUpdate instance,
) => <String, dynamic>{
  'name': instance.name,
  'is_pinned': instance.isPinned,
  'is_deleted': instance.isDeleted,
  'search': instance.search,
  'title': instance.title,
  'author': instance.author,
  'site': instance.site,
  'type': instance.type,
  'labels': instance.labels,
  'read_status': instance.readStatus,
  'is_marked': instance.isMarked,
  'is_archived': instance.isArchived,
  'range_start': instance.rangeStart,
  'range_end': instance.rangeEnd,
};
