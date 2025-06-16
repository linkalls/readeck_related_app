import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection.freezed.dart';
part 'collection.g.dart';

abstract class ICollectionSummary {
  DateTime? get updated;
  String? get name;
  @JsonKey(name: 'is_pinned')
  bool? get isPinned;
  @JsonKey(name: 'is_deleted')
  bool? get isDeleted;
  String? get search;
  String? get title;
  String? get author;
  String? get site;
  List<String>? get type; // Enum: [article, photo, video]
  List<String>? get labels;
  @JsonKey(name: 'read_status')
  List<String>? get readStatus; // Enum: [unread, reading, read]
  @JsonKey(name: 'is_marked')
  bool? get isMarked;
  @JsonKey(name: 'is_archived')
  bool? get isArchived;
  @JsonKey(name: 'range_start')
  String? get rangeStart;
  @JsonKey(name: 'range_end')
  String? get rangeEnd;
}

@freezed
abstract class CollectionSummary
    with _$CollectionSummary
    implements ICollectionSummary {
  const factory CollectionSummary({
    @override DateTime? updated,
    @override String? name,
    @override @JsonKey(name: 'is_pinned') bool? isPinned,
    @override @JsonKey(name: 'is_deleted') bool? isDeleted,
    @override String? search,
    @override String? title,
    @override String? author,
    @override String? site,
    @override List<String>? type,
    @override List<String>? labels,
    @override @JsonKey(name: 'read_status') List<String>? readStatus,
    @override @JsonKey(name: 'is_marked') bool? isMarked,
    @override @JsonKey(name: 'is_archived') bool? isArchived,
    @override @JsonKey(name: 'range_start') String? rangeStart,
    @override @JsonKey(name: 'range_end') String? rangeEnd,
  }) = _CollectionSummary;

  factory CollectionSummary.fromJson(Map<String, dynamic> json) =>
      _$CollectionSummaryFromJson(json);
}

@freezed
abstract class CollectionInfo
    with _$CollectionInfo
    implements ICollectionSummary {
  const factory CollectionInfo({
    // Fields from ICollectionSummary
    @override DateTime? updated,
    @override String? name,
    @override @JsonKey(name: 'is_pinned') bool? isPinned,
    @override @JsonKey(name: 'is_deleted') bool? isDeleted,
    @override String? search,
    @override String? title,
    @override String? author,
    @override String? site,
    @override List<String>? type,
    @override List<String>? labels,
    @override @JsonKey(name: 'read_status') List<String>? readStatus,
    @override @JsonKey(name: 'is_marked') bool? isMarked,
    @override @JsonKey(name: 'is_archived') bool? isArchived,
    @override @JsonKey(name: 'range_start') String? rangeStart,
    @override @JsonKey(name: 'range_end') String? rangeEnd,
    // CollectionInfo specific fields
    String? id,
    String? href,
    DateTime? created,
  }) = _CollectionInfo;

  factory CollectionInfo.fromJson(Map<String, dynamic> json) =>
      _$CollectionInfoFromJson(json);
}

@freezed
abstract class CollectionCreateOrUpdate with _$CollectionCreateOrUpdate {
  const factory CollectionCreateOrUpdate({
    String? name,
    @JsonKey(name: 'is_pinned') bool? isPinned,
    @JsonKey(name: 'is_deleted') bool? isDeleted,
    String? search,
    String? title,
    String? author,
    String? site,
    List<String>? type,
    List<String>? labels,
    @JsonKey(name: 'read_status') List<String>? readStatus,
    @JsonKey(name: 'is_marked') bool? isMarked,
    @JsonKey(name: 'is_archived') bool? isArchived,
    @JsonKey(name: 'range_start') String? rangeStart,
    @JsonKey(name: 'range_end') String? rangeEnd,
  }) = _CollectionCreateOrUpdate;

  factory CollectionCreateOrUpdate.fromJson(Map<String, dynamic> json) =>
      _$CollectionCreateOrUpdateFromJson(json);
}
