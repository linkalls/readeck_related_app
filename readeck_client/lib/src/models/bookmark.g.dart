// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookmarkResource _$BookmarkResourceFromJson(Map<String, dynamic> json) =>
    _BookmarkResource(src: json['src'] as String?);

Map<String, dynamic> _$BookmarkResourceToJson(_BookmarkResource instance) =>
    <String, dynamic>{'src': instance.src};

_BookmarkResourceImage _$BookmarkResourceImageFromJson(
  Map<String, dynamic> json,
) => _BookmarkResourceImage(
  src: json['src'] as String?,
  height: (json['height'] as num?)?.toInt(),
  width: (json['width'] as num?)?.toInt(),
);

Map<String, dynamic> _$BookmarkResourceImageToJson(
  _BookmarkResourceImage instance,
) => <String, dynamic>{
  'src': instance.src,
  'height': instance.height,
  'width': instance.width,
};

_BookmarkResources _$BookmarkResourcesFromJson(
  Map<String, dynamic> json,
) => _BookmarkResources(
  icon: json['icon'] == null
      ? null
      : BookmarkResourceImage.fromJson(json['icon'] as Map<String, dynamic>),
  image: json['image'] == null
      ? null
      : BookmarkResourceImage.fromJson(json['image'] as Map<String, dynamic>),
  thumbnail: json['thumbnail'] == null
      ? null
      : BookmarkResourceImage.fromJson(
          json['thumbnail'] as Map<String, dynamic>,
        ),
  article: json['article'] == null
      ? null
      : BookmarkResource.fromJson(json['article'] as Map<String, dynamic>),
  log: json['log'] == null
      ? null
      : BookmarkResource.fromJson(json['log'] as Map<String, dynamic>),
  props: json['props'] == null
      ? null
      : BookmarkResource.fromJson(json['props'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookmarkResourcesToJson(_BookmarkResources instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'image': instance.image,
      'thumbnail': instance.thumbnail,
      'article': instance.article,
      'log': instance.log,
      'props': instance.props,
    };

_BookmarkSummary _$BookmarkSummaryFromJson(
  Map<String, dynamic> json,
) => _BookmarkSummary(
  id: json['id'] as String?,
  href: json['href'] as String?,
  created: json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String),
  updated: json['updated'] == null
      ? null
      : DateTime.parse(json['updated'] as String),
  state: (json['state'] as num?)?.toInt(),
  loaded: json['loaded'] as bool?,
  url: json['url'] as String?,
  title: json['title'] as String?,
  siteName: json['site_name'] as String?,
  site: json['site'] as String?,
  published: json['published'] == null
      ? null
      : DateTime.parse(json['published'] as String),
  authors: (json['authors'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  lang: json['lang'] as String?,
  textDirection: json['text_direction'] as String?,
  documentType: json['document_type'] as String?,
  type: json['type'] as String?,
  hasArticle: json['has_article'] as bool?,
  description: json['description'] as String?,
  isDeleted: json['is_deleted'] as bool?,
  isMarked: json['is_marked'] as bool?,
  isArchived: json['is_archived'] as bool?,
  readProgress: (json['read_progress'] as num?)?.toInt(),
  labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
  wordCount: (json['word_count'] as num?)?.toInt(),
  readingTime: (json['reading_time'] as num?)?.toInt(),
  resources: json['resources'] == null
      ? null
      : BookmarkResources.fromJson(json['resources'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookmarkSummaryToJson(_BookmarkSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'href': instance.href,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'state': instance.state,
      'loaded': instance.loaded,
      'url': instance.url,
      'title': instance.title,
      'site_name': instance.siteName,
      'site': instance.site,
      'published': instance.published?.toIso8601String(),
      'authors': instance.authors,
      'lang': instance.lang,
      'text_direction': instance.textDirection,
      'document_type': instance.documentType,
      'type': instance.type,
      'has_article': instance.hasArticle,
      'description': instance.description,
      'is_deleted': instance.isDeleted,
      'is_marked': instance.isMarked,
      'is_archived': instance.isArchived,
      'read_progress': instance.readProgress,
      'labels': instance.labels,
      'word_count': instance.wordCount,
      'reading_time': instance.readingTime,
      'resources': instance.resources,
    };

_BookmarkLink _$BookmarkLinkFromJson(Map<String, dynamic> json) =>
    _BookmarkLink(
      url: json['url'] as String?,
      domain: json['domain'] as String?,
      title: json['title'] as String?,
      isPage: json['is_page'] as bool?,
      contentType: json['content_type'] as String?,
    );

Map<String, dynamic> _$BookmarkLinkToJson(_BookmarkLink instance) =>
    <String, dynamic>{
      'url': instance.url,
      'domain': instance.domain,
      'title': instance.title,
      'is_page': instance.isPage,
      'content_type': instance.contentType,
    };

_BookmarkInfo _$BookmarkInfoFromJson(
  Map<String, dynamic> json,
) => _BookmarkInfo(
  id: json['id'] as String?,
  href: json['href'] as String?,
  created: json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String),
  updated: json['updated'] == null
      ? null
      : DateTime.parse(json['updated'] as String),
  state: (json['state'] as num?)?.toInt(),
  loaded: json['loaded'] as bool?,
  url: json['url'] as String?,
  title: json['title'] as String?,
  siteName: json['site_name'] as String?,
  site: json['site'] as String?,
  published: json['published'] == null
      ? null
      : DateTime.parse(json['published'] as String),
  authors: (json['authors'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  lang: json['lang'] as String?,
  textDirection: json['text_direction'] as String?,
  documentType: json['document_type'] as String?,
  type: json['type'] as String?,
  hasArticle: json['has_article'] as bool?,
  description: json['description'] as String?,
  isDeleted: json['is_deleted'] as bool?,
  isMarked: json['is_marked'] as bool?,
  isArchived: json['is_archived'] as bool?,
  readProgress: (json['read_progress'] as num?)?.toInt(),
  labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
  wordCount: (json['word_count'] as num?)?.toInt(),
  readingTime: (json['reading_time'] as num?)?.toInt(),
  resources: json['resources'] == null
      ? null
      : BookmarkResources.fromJson(json['resources'] as Map<String, dynamic>),
  omitDescription: json['omit_description'] as bool?,
  readAnchor: json['read_anchor'] as String?,
  links: (json['links'] as List<dynamic>?)
      ?.map((e) => BookmarkLink.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BookmarkInfoToJson(_BookmarkInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'href': instance.href,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'state': instance.state,
      'loaded': instance.loaded,
      'url': instance.url,
      'title': instance.title,
      'site_name': instance.siteName,
      'site': instance.site,
      'published': instance.published?.toIso8601String(),
      'authors': instance.authors,
      'lang': instance.lang,
      'text_direction': instance.textDirection,
      'document_type': instance.documentType,
      'type': instance.type,
      'has_article': instance.hasArticle,
      'description': instance.description,
      'is_deleted': instance.isDeleted,
      'is_marked': instance.isMarked,
      'is_archived': instance.isArchived,
      'read_progress': instance.readProgress,
      'labels': instance.labels,
      'word_count': instance.wordCount,
      'reading_time': instance.readingTime,
      'resources': instance.resources,
      'omit_description': instance.omitDescription,
      'read_anchor': instance.readAnchor,
      'links': instance.links,
    };

_BookmarkCreate _$BookmarkCreateFromJson(Map<String, dynamic> json) =>
    _BookmarkCreate(
      url: json['url'] as String,
      title: json['title'] as String?,
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BookmarkCreateToJson(_BookmarkCreate instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'labels': instance.labels,
    };

_BookmarkUpdate _$BookmarkUpdateFromJson(Map<String, dynamic> json) =>
    _BookmarkUpdate(
      title: json['title'] as String?,
      isMarked: json['is_marked'] as bool?,
      isArchived: json['is_archived'] as bool?,
      isDeleted: json['is_deleted'] as bool?,
      readProgress: (json['read_progress'] as num?)?.toInt(),
      readAnchor: json['read_anchor'] as String?,
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      addLabels: (json['add_labels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      removeLabels: (json['remove_labels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BookmarkUpdateToJson(_BookmarkUpdate instance) =>
    <String, dynamic>{
      'title': instance.title,
      'is_marked': instance.isMarked,
      'is_archived': instance.isArchived,
      'is_deleted': instance.isDeleted,
      'read_progress': instance.readProgress,
      'read_anchor': instance.readAnchor,
      'labels': instance.labels,
      'add_labels': instance.addLabels,
      'remove_labels': instance.removeLabels,
    };

_BookmarkUpdated _$BookmarkUpdatedFromJson(Map<String, dynamic> json) =>
    _BookmarkUpdated(
      href: json['href'] as String?,
      id: json['id'] as String?,
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      title: json['title'] as String?,
      isMarked: json['is_marked'] as bool?,
      isArchived: json['is_archived'] as bool?,
      isDeleted: json['is_deleted'] as bool?,
      readProgress: (json['read_progress'] as num?)?.toInt(),
      readAnchor: json['read_anchor'] as String?,
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BookmarkUpdatedToJson(_BookmarkUpdated instance) =>
    <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
      'updated': instance.updated?.toIso8601String(),
      'title': instance.title,
      'is_marked': instance.isMarked,
      'is_archived': instance.isArchived,
      'is_deleted': instance.isDeleted,
      'read_progress': instance.readProgress,
      'read_anchor': instance.readAnchor,
      'labels': instance.labels,
    };

_BookmarkSync _$BookmarkSyncFromJson(Map<String, dynamic> json) =>
    _BookmarkSync(
      id: json['id'] as String?,
      href: json['href'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$BookmarkSyncToJson(_BookmarkSync instance) =>
    <String, dynamic>{
      'id': instance.id,
      'href': instance.href,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };

_BookmarkShareLink _$BookmarkShareLinkFromJson(Map<String, dynamic> json) =>
    _BookmarkShareLink(
      url: json['url'] as String?,
      expires: json['expires'] == null
          ? null
          : DateTime.parse(json['expires'] as String),
      title: json['title'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BookmarkShareLinkToJson(_BookmarkShareLink instance) =>
    <String, dynamic>{
      'url': instance.url,
      'expires': instance.expires?.toIso8601String(),
      'title': instance.title,
      'id': instance.id,
    };

_BookmarkShareEmail _$BookmarkShareEmailFromJson(Map<String, dynamic> json) =>
    _BookmarkShareEmail(
      email: json['email'] as String,
      format: json['format'] as String,
    );

Map<String, dynamic> _$BookmarkShareEmailToJson(_BookmarkShareEmail instance) =>
    <String, dynamic>{'email': instance.email, 'format': instance.format};
