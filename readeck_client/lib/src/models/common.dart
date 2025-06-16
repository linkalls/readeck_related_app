import 'package:freezed_annotation/freezed_annotation.dart';

part 'common.freezed.dart';
part 'common.g.dart';

@freezed
abstract class ApiMessage with _$ApiMessage {
  const factory ApiMessage({int? status, String? message}) = _ApiMessage;

  factory ApiMessage.fromJson(Map<String, dynamic> json) =>
      _$ApiMessageFromJson(json);
}

@freezed
abstract class ApiErrorField with _$ApiErrorField {
  const factory ApiErrorField({
    required bool isNull,
    required bool isBound,
    dynamic value, // Can be any type
    List<String>? errors,
  }) = _ApiErrorField;

  factory ApiErrorField.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFieldFromJson(json);
}

@freezed
abstract class ApiError with _$ApiError {
  const factory ApiError({
    required bool isValid,
    List<String>? errors,
    Map<String, ApiErrorField>? fields,
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}

extension ApiErrorMessage on ApiError {
  String? get message => errors?.join(', ');
}
