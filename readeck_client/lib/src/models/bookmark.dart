import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

abstract class IBookmarkSummary {
  String? get id;
  String? get href;
  DateTime? get created;
  DateTime? get updated;
  int? get state;
  bool? get loaded;
  String? get url;
  String? get title;
  @JsonKey(name: 'site_name')
  String? get siteName;
  String? get site;
  DateTime? get published;
  List<String>? get authors;
  String? get lang;
  @JsonKey(name: 'text_direction')
  String? get textDirection;
  @JsonKey(name: 'document_type')
  String? get documentType;
  String? get type;
  @JsonKey(name: 'has_article')
  bool? get hasArticle;
  String? get description;
  @JsonKey(name: 'is_deleted')
  bool? get isDeleted;
  @JsonKey(name: 'is_marked')
  bool? get isMarked;
  @JsonKey(name: 'is_archived')
  bool? get isArchived;
  @JsonKey(name: 'read_progress')
  int? get readProgress;
  List<String>? get labels;
  @JsonKey(name: 'word_count')
  int? get wordCount;
  @JsonKey(name: 'reading_time')
  int? get readingTime;
  BookmarkResources? get resources;
}

@freezed
abstract class BookmarkResource with _$BookmarkResource {
  const factory BookmarkResource({String? src}) = _BookmarkResource;

  factory BookmarkResource.fromJson(Map<String, dynamic> json) =>
      _$BookmarkResourceFromJson(json);
}

@freezed
abstract class BookmarkResourceImage with _$BookmarkResourceImage {
  const factory BookmarkResourceImage({String? src, int? height, int? width}) =
      _BookmarkResourceImage;

  factory BookmarkResourceImage.fromJson(Map<String, dynamic> json) =>
      _$BookmarkResourceImageFromJson(json);
}

@freezed
abstract class BookmarkResources with _$BookmarkResources {
  const factory BookmarkResources({
    BookmarkResourceImage? icon,
    BookmarkResourceImage? image,
    BookmarkResourceImage? thumbnail,
    BookmarkResource? article,
    BookmarkResource? log,
    BookmarkResource? props,
  }) = _BookmarkResources;

  factory BookmarkResources.fromJson(Map<String, dynamic> json) =>
      _$BookmarkResourcesFromJson(json);
}

@freezed
abstract class BookmarkSummary
    with _$BookmarkSummary
    implements IBookmarkSummary {
  const factory BookmarkSummary({
    @override String? id,
    @override String? href,
    @override DateTime? created,
    @override DateTime? updated,
    @override int? state,
    @override bool? loaded,
    @override String? url,
    @override String? title,
    @override @JsonKey(name: 'site_name') String? siteName,
    @override String? site,
    @override DateTime? published,
    @override List<String>? authors,
    @override String? lang,
    @override @JsonKey(name: 'text_direction') String? textDirection,
    @override @JsonKey(name: 'document_type') String? documentType,
    @override String? type,
    @override @JsonKey(name: 'has_article') bool? hasArticle,
    @override String? description,
    @override @JsonKey(name: 'is_deleted') bool? isDeleted,
    @override @JsonKey(name: 'is_marked') bool? isMarked,
    @override @JsonKey(name: 'is_archived') bool? isArchived,
    @override @JsonKey(name: 'read_progress') int? readProgress,
    @override List<String>? labels,
    @override @JsonKey(name: 'word_count') int? wordCount,
    @override @JsonKey(name: 'reading_time') int? readingTime,
    @override BookmarkResources? resources,
  }) = _BookmarkSummary;

  factory BookmarkSummary.fromJson(Map<String, dynamic> json) =>
      _$BookmarkSummaryFromJson(json);
}

@freezed
abstract class BookmarkLink with _$BookmarkLink {
  const factory BookmarkLink({
    String? url,
    String? domain,
    String? title,
    @JsonKey(name: 'is_page') bool? isPage,
    @JsonKey(name: 'content_type') String? contentType,
  }) = _BookmarkLink;

  factory BookmarkLink.fromJson(Map<String, dynamic> json) =>
      _$BookmarkLinkFromJson(json);
}

@freezed
abstract class BookmarkInfo with _$BookmarkInfo implements IBookmarkSummary {
  const factory BookmarkInfo({
    // Fields from IBookmarkSummary
    @override String? id,
    @override String? href,
    @override DateTime? created,
    @override DateTime? updated,
    @override int? state,
    @override bool? loaded,
    @override String? url,
    @override String? title,
    @override @JsonKey(name: 'site_name') String? siteName,
    @override String? site,
    @override DateTime? published,
    @override List<String>? authors,
    @override String? lang,
    @override @JsonKey(name: 'text_direction') String? textDirection,
    @override @JsonKey(name: 'document_type') String? documentType,
    @override String? type,
    @override @JsonKey(name: 'has_article') bool? hasArticle,
    @override String? description,
    @override @JsonKey(name: 'is_deleted') bool? isDeleted,
    @override @JsonKey(name: 'is_marked') bool? isMarked,
    @override @JsonKey(name: 'is_archived') bool? isArchived,
    @override @JsonKey(name: 'read_progress') int? readProgress,
    @override List<String>? labels,
    @override @JsonKey(name: 'word_count') int? wordCount,
    @override @JsonKey(name: 'reading_time') int? readingTime,
    @override BookmarkResources? resources,
    // BookmarkInfo specific fields
    @JsonKey(name: 'omit_description') bool? omitDescription,
    @JsonKey(name: 'read_anchor') String? readAnchor,
    List<BookmarkLink>? links,
  }) = _BookmarkInfo;

  factory BookmarkInfo.fromJson(Map<String, dynamic> json) =>
      _$BookmarkInfoFromJson(json);
}

@freezed
abstract class BookmarkCreate with _$BookmarkCreate {
  const factory BookmarkCreate({
    required String url,
    String? title,
    List<String>? labels,
  }) = _BookmarkCreate;

  factory BookmarkCreate.fromJson(Map<String, dynamic> json) =>
      _$BookmarkCreateFromJson(json);
}

@freezed
abstract class BookmarkUpdate with _$BookmarkUpdate {
  const factory BookmarkUpdate({
    String? title,
    @JsonKey(name: 'is_marked') bool? isMarked,
    @JsonKey(name: 'is_archived') bool? isArchived,
    @JsonKey(name: 'is_deleted') bool? isDeleted,
    @JsonKey(name: 'read_progress') int? readProgress,
    @JsonKey(name: 'read_anchor') String? readAnchor,
    List<String>? labels,
    @JsonKey(name: 'add_labels') List<String>? addLabels,
    @JsonKey(name: 'remove_labels') List<String>? removeLabels,
  }) = _BookmarkUpdate;

  factory BookmarkUpdate.fromJson(Map<String, dynamic> json) =>
      _$BookmarkUpdateFromJson(json);
}

@freezed
abstract class BookmarkUpdated with _$BookmarkUpdated {
  const factory BookmarkUpdated({
    String? href,
    String? id,
    DateTime? updated,
    String? title,
    @JsonKey(name: 'is_marked') bool? isMarked,
    @JsonKey(name: 'is_archived') bool? isArchived,
    @JsonKey(name: 'is_deleted') bool? isDeleted,
    @JsonKey(name: 'read_progress') int? readProgress,
    @JsonKey(name: 'read_anchor') String? readAnchor,
    List<String>? labels,
  }) = _BookmarkUpdated;

  factory BookmarkUpdated.fromJson(Map<String, dynamic> json) =>
      _$BookmarkUpdatedFromJson(json);
}

@freezed
abstract class BookmarkSync with _$BookmarkSync {
  const factory BookmarkSync({
    String? id,
    String? href,
    DateTime? created,
    DateTime? updated,
  }) = _BookmarkSync;

  factory BookmarkSync.fromJson(Map<String, dynamic> json) =>
      _$BookmarkSyncFromJson(json);
}

@freezed
abstract class BookmarkShareLink with _$BookmarkShareLink {
  const factory BookmarkShareLink({
    String? url,
    DateTime? expires,
    String? title,
    String? id,
  }) = _BookmarkShareLink;

  factory BookmarkShareLink.fromJson(Map<String, dynamic> json) =>
      _$BookmarkShareLinkFromJson(json);
}

@freezed
abstract class BookmarkShareEmail with _$BookmarkShareEmail {
  const factory BookmarkShareEmail({
    required String email,
    required String format,
  }) = _BookmarkShareEmail;

  factory BookmarkShareEmail.fromJson(Map<String, dynamic> json) =>
      _$BookmarkShareEmailFromJson(json);
}
