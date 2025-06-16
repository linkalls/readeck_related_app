import 'package:freezed_annotation/freezed_annotation.dart';

part 'label.freezed.dart';
part 'label.g.dart';

@freezed
abstract class LabelInfo with _$LabelInfo {
  const factory LabelInfo({
    String? name,
    int? count,
    String? href,
    @JsonKey(name: 'href_bookmarks') String? hrefBookmarks,
  }) = _LabelInfo;

  factory LabelInfo.fromJson(Map<String, dynamic> json) =>
      _$LabelInfoFromJson(json);
}

@freezed
abstract class LabelUpdate with _$LabelUpdate {
  const factory LabelUpdate({String? name}) = _LabelUpdate;

  factory LabelUpdate.fromJson(Map<String, dynamic> json) =>
      _$LabelUpdateFromJson(json);
}
