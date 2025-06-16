// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiMessage _$ApiMessageFromJson(Map<String, dynamic> json) => _ApiMessage(
  status: (json['status'] as num?)?.toInt(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$ApiMessageToJson(_ApiMessage instance) =>
    <String, dynamic>{'status': instance.status, 'message': instance.message};

_ApiErrorField _$ApiErrorFieldFromJson(Map<String, dynamic> json) =>
    _ApiErrorField(
      isNull: json['isNull'] as bool,
      isBound: json['isBound'] as bool,
      value: json['value'],
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ApiErrorFieldToJson(_ApiErrorField instance) =>
    <String, dynamic>{
      'isNull': instance.isNull,
      'isBound': instance.isBound,
      'value': instance.value,
      'errors': instance.errors,
    };

_ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => _ApiError(
  isValid: json['isValid'] as bool,
  errors: (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  fields: (json['fields'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, ApiErrorField.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$ApiErrorToJson(_ApiError instance) => <String, dynamic>{
  'isValid': instance.isValid,
  'errors': instance.errors,
  'fields': instance.fields,
};
