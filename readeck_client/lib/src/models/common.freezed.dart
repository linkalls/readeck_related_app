// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiMessage {

 int? get status; String? get message;
/// Create a copy of ApiMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiMessageCopyWith<ApiMessage> get copyWith => _$ApiMessageCopyWithImpl<ApiMessage>(this as ApiMessage, _$identity);

  /// Serializes this ApiMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiMessage&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message);

@override
String toString() {
  return 'ApiMessage(status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $ApiMessageCopyWith<$Res>  {
  factory $ApiMessageCopyWith(ApiMessage value, $Res Function(ApiMessage) _then) = _$ApiMessageCopyWithImpl;
@useResult
$Res call({
 int? status, String? message
});




}
/// @nodoc
class _$ApiMessageCopyWithImpl<$Res>
    implements $ApiMessageCopyWith<$Res> {
  _$ApiMessageCopyWithImpl(this._self, this._then);

  final ApiMessage _self;
  final $Res Function(ApiMessage) _then;

/// Create a copy of ApiMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ApiMessage implements ApiMessage {
  const _ApiMessage({this.status, this.message});
  factory _ApiMessage.fromJson(Map<String, dynamic> json) => _$ApiMessageFromJson(json);

@override final  int? status;
@override final  String? message;

/// Create a copy of ApiMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiMessageCopyWith<_ApiMessage> get copyWith => __$ApiMessageCopyWithImpl<_ApiMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiMessage&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message);

@override
String toString() {
  return 'ApiMessage(status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ApiMessageCopyWith<$Res> implements $ApiMessageCopyWith<$Res> {
  factory _$ApiMessageCopyWith(_ApiMessage value, $Res Function(_ApiMessage) _then) = __$ApiMessageCopyWithImpl;
@override @useResult
$Res call({
 int? status, String? message
});




}
/// @nodoc
class __$ApiMessageCopyWithImpl<$Res>
    implements _$ApiMessageCopyWith<$Res> {
  __$ApiMessageCopyWithImpl(this._self, this._then);

  final _ApiMessage _self;
  final $Res Function(_ApiMessage) _then;

/// Create a copy of ApiMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,}) {
  return _then(_ApiMessage(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ApiErrorField {

 bool get isNull; bool get isBound; dynamic get value;// Can be any type
 List<String>? get errors;
/// Create a copy of ApiErrorField
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiErrorFieldCopyWith<ApiErrorField> get copyWith => _$ApiErrorFieldCopyWithImpl<ApiErrorField>(this as ApiErrorField, _$identity);

  /// Serializes this ApiErrorField to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiErrorField&&(identical(other.isNull, isNull) || other.isNull == isNull)&&(identical(other.isBound, isBound) || other.isBound == isBound)&&const DeepCollectionEquality().equals(other.value, value)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isNull,isBound,const DeepCollectionEquality().hash(value),const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'ApiErrorField(isNull: $isNull, isBound: $isBound, value: $value, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $ApiErrorFieldCopyWith<$Res>  {
  factory $ApiErrorFieldCopyWith(ApiErrorField value, $Res Function(ApiErrorField) _then) = _$ApiErrorFieldCopyWithImpl;
@useResult
$Res call({
 bool isNull, bool isBound, dynamic value, List<String>? errors
});




}
/// @nodoc
class _$ApiErrorFieldCopyWithImpl<$Res>
    implements $ApiErrorFieldCopyWith<$Res> {
  _$ApiErrorFieldCopyWithImpl(this._self, this._then);

  final ApiErrorField _self;
  final $Res Function(ApiErrorField) _then;

/// Create a copy of ApiErrorField
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isNull = null,Object? isBound = null,Object? value = freezed,Object? errors = freezed,}) {
  return _then(_self.copyWith(
isNull: null == isNull ? _self.isNull : isNull // ignore: cast_nullable_to_non_nullable
as bool,isBound: null == isBound ? _self.isBound : isBound // ignore: cast_nullable_to_non_nullable
as bool,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ApiErrorField implements ApiErrorField {
  const _ApiErrorField({required this.isNull, required this.isBound, this.value, final  List<String>? errors}): _errors = errors;
  factory _ApiErrorField.fromJson(Map<String, dynamic> json) => _$ApiErrorFieldFromJson(json);

@override final  bool isNull;
@override final  bool isBound;
@override final  dynamic value;
// Can be any type
 final  List<String>? _errors;
// Can be any type
@override List<String>? get errors {
  final value = _errors;
  if (value == null) return null;
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ApiErrorField
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiErrorFieldCopyWith<_ApiErrorField> get copyWith => __$ApiErrorFieldCopyWithImpl<_ApiErrorField>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiErrorFieldToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiErrorField&&(identical(other.isNull, isNull) || other.isNull == isNull)&&(identical(other.isBound, isBound) || other.isBound == isBound)&&const DeepCollectionEquality().equals(other.value, value)&&const DeepCollectionEquality().equals(other._errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isNull,isBound,const DeepCollectionEquality().hash(value),const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'ApiErrorField(isNull: $isNull, isBound: $isBound, value: $value, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$ApiErrorFieldCopyWith<$Res> implements $ApiErrorFieldCopyWith<$Res> {
  factory _$ApiErrorFieldCopyWith(_ApiErrorField value, $Res Function(_ApiErrorField) _then) = __$ApiErrorFieldCopyWithImpl;
@override @useResult
$Res call({
 bool isNull, bool isBound, dynamic value, List<String>? errors
});




}
/// @nodoc
class __$ApiErrorFieldCopyWithImpl<$Res>
    implements _$ApiErrorFieldCopyWith<$Res> {
  __$ApiErrorFieldCopyWithImpl(this._self, this._then);

  final _ApiErrorField _self;
  final $Res Function(_ApiErrorField) _then;

/// Create a copy of ApiErrorField
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isNull = null,Object? isBound = null,Object? value = freezed,Object? errors = freezed,}) {
  return _then(_ApiErrorField(
isNull: null == isNull ? _self.isNull : isNull // ignore: cast_nullable_to_non_nullable
as bool,isBound: null == isBound ? _self.isBound : isBound // ignore: cast_nullable_to_non_nullable
as bool,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,errors: freezed == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$ApiError {

 bool get isValid; List<String>? get errors; Map<String, ApiErrorField>? get fields;
/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiErrorCopyWith<ApiError> get copyWith => _$ApiErrorCopyWithImpl<ApiError>(this as ApiError, _$identity);

  /// Serializes this ApiError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiError&&(identical(other.isValid, isValid) || other.isValid == isValid)&&const DeepCollectionEquality().equals(other.errors, errors)&&const DeepCollectionEquality().equals(other.fields, fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isValid,const DeepCollectionEquality().hash(errors),const DeepCollectionEquality().hash(fields));

@override
String toString() {
  return 'ApiError(isValid: $isValid, errors: $errors, fields: $fields)';
}


}

/// @nodoc
abstract mixin class $ApiErrorCopyWith<$Res>  {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) _then) = _$ApiErrorCopyWithImpl;
@useResult
$Res call({
 bool isValid, List<String>? errors, Map<String, ApiErrorField>? fields
});




}
/// @nodoc
class _$ApiErrorCopyWithImpl<$Res>
    implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(this._self, this._then);

  final ApiError _self;
  final $Res Function(ApiError) _then;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isValid = null,Object? errors = freezed,Object? fields = freezed,}) {
  return _then(_self.copyWith(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<String>?,fields: freezed == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as Map<String, ApiErrorField>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ApiError implements ApiError {
  const _ApiError({required this.isValid, final  List<String>? errors, final  Map<String, ApiErrorField>? fields}): _errors = errors,_fields = fields;
  factory _ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);

@override final  bool isValid;
 final  List<String>? _errors;
@override List<String>? get errors {
  final value = _errors;
  if (value == null) return null;
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, ApiErrorField>? _fields;
@override Map<String, ApiErrorField>? get fields {
  final value = _fields;
  if (value == null) return null;
  if (_fields is EqualUnmodifiableMapView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiErrorCopyWith<_ApiError> get copyWith => __$ApiErrorCopyWithImpl<_ApiError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiError&&(identical(other.isValid, isValid) || other.isValid == isValid)&&const DeepCollectionEquality().equals(other._errors, _errors)&&const DeepCollectionEquality().equals(other._fields, _fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isValid,const DeepCollectionEquality().hash(_errors),const DeepCollectionEquality().hash(_fields));

@override
String toString() {
  return 'ApiError(isValid: $isValid, errors: $errors, fields: $fields)';
}


}

/// @nodoc
abstract mixin class _$ApiErrorCopyWith<$Res> implements $ApiErrorCopyWith<$Res> {
  factory _$ApiErrorCopyWith(_ApiError value, $Res Function(_ApiError) _then) = __$ApiErrorCopyWithImpl;
@override @useResult
$Res call({
 bool isValid, List<String>? errors, Map<String, ApiErrorField>? fields
});




}
/// @nodoc
class __$ApiErrorCopyWithImpl<$Res>
    implements _$ApiErrorCopyWith<$Res> {
  __$ApiErrorCopyWithImpl(this._self, this._then);

  final _ApiError _self;
  final $Res Function(_ApiError) _then;

/// Create a copy of ApiError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isValid = null,Object? errors = freezed,Object? fields = freezed,}) {
  return _then(_ApiError(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,errors: freezed == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<String>?,fields: freezed == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as Map<String, ApiErrorField>?,
  ));
}


}

// dart format on
