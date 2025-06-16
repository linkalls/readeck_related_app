import 'package:freezed_annotation/freezed_annotation.dart';

part 'annotation.freezed.dart';
part 'annotation.g.dart';

@freezed
abstract class AnnotationSummary with _$AnnotationSummary {
  const factory AnnotationSummary({
    String? id,
    String? href,
    String? text,
    DateTime? created,
    @JsonKey(name: 'bookmark_id') String? bookmarkId,
    @JsonKey(name: 'bookmark_href') String? bookmarkHref,
    @JsonKey(name: 'bookmark_url') String? bookmarkUrl,
    @JsonKey(name: 'bookmark_title') String? bookmarkTitle,
    @JsonKey(name: 'bookmark_site_name') String? bookmarkSiteName,
  }) = _AnnotationSummary;

  factory AnnotationSummary.fromJson(Map<String, dynamic> json) =>
      _$AnnotationSummaryFromJson(json);
}

@freezed
abstract class AnnotationInfo with _$AnnotationInfo {
  const factory AnnotationInfo({
    String? id,
    @JsonKey(name: 'start_selector') String? startSelector,
    @JsonKey(name: 'start_offset') int? startOffset,
    @JsonKey(name: 'end_selector') String? endSelector,
    @JsonKey(name: 'end_offset') int? endOffset,
    DateTime? created,
    String? text,
    String? color,
  }) = _AnnotationInfo;

  factory AnnotationInfo.fromJson(Map<String, dynamic> json) =>
      _$AnnotationInfoFromJson(json);
}

@freezed
abstract class AnnotationCreate with _$AnnotationCreate {
  const factory AnnotationCreate({
    @JsonKey(name: 'start_selector') required String startSelector,
    @JsonKey(name: 'start_offset') required int startOffset,
    @JsonKey(name: 'end_selector') required String endSelector,
    @JsonKey(name: 'end_offset') required int endOffset,
    required String color,
  }) = _AnnotationCreate;

  factory AnnotationCreate.fromJson(Map<String, dynamic> json) =>
      _$AnnotationCreateFromJson(json);
}

@freezed
abstract class AnnotationUpdate with _$AnnotationUpdate {
  const factory AnnotationUpdate({
    required String color,
  }) = _AnnotationUpdate;

  factory AnnotationUpdate.fromJson(Map<String, dynamic> json) =>
      _$AnnotationUpdateFromJson(json);
}

@freezed
abstract class AnnotationUpdateResponse with _$AnnotationUpdateResponse {
  const factory AnnotationUpdateResponse({
    DateTime? updated,
    List<AnnotationInfo>? annotations,
  }) = _AnnotationUpdateResponse;

  factory AnnotationUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$AnnotationUpdateResponseFromJson(json);
}
