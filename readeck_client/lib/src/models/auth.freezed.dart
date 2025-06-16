// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthRequest {

 String get username; String get password; String get application; List<String>? get roles;
/// Create a copy of AuthRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthRequestCopyWith<AuthRequest> get copyWith => _$AuthRequestCopyWithImpl<AuthRequest>(this as AuthRequest, _$identity);

  /// Serializes this AuthRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.application, application) || other.application == application)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password,application,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'AuthRequest(username: $username, password: $password, application: $application, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $AuthRequestCopyWith<$Res>  {
  factory $AuthRequestCopyWith(AuthRequest value, $Res Function(AuthRequest) _then) = _$AuthRequestCopyWithImpl;
@useResult
$Res call({
 String username, String password, String application, List<String>? roles
});




}
/// @nodoc
class _$AuthRequestCopyWithImpl<$Res>
    implements $AuthRequestCopyWith<$Res> {
  _$AuthRequestCopyWithImpl(this._self, this._then);

  final AuthRequest _self;
  final $Res Function(AuthRequest) _then;

/// Create a copy of AuthRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,Object? application = null,Object? roles = freezed,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as String,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AuthRequest implements AuthRequest {
  const _AuthRequest({required this.username, required this.password, required this.application, final  List<String>? roles}): _roles = roles;
  factory _AuthRequest.fromJson(Map<String, dynamic> json) => _$AuthRequestFromJson(json);

@override final  String username;
@override final  String password;
@override final  String application;
 final  List<String>? _roles;
@override List<String>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AuthRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthRequestCopyWith<_AuthRequest> get copyWith => __$AuthRequestCopyWithImpl<_AuthRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.application, application) || other.application == application)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password,application,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'AuthRequest(username: $username, password: $password, application: $application, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$AuthRequestCopyWith<$Res> implements $AuthRequestCopyWith<$Res> {
  factory _$AuthRequestCopyWith(_AuthRequest value, $Res Function(_AuthRequest) _then) = __$AuthRequestCopyWithImpl;
@override @useResult
$Res call({
 String username, String password, String application, List<String>? roles
});




}
/// @nodoc
class __$AuthRequestCopyWithImpl<$Res>
    implements _$AuthRequestCopyWith<$Res> {
  __$AuthRequestCopyWithImpl(this._self, this._then);

  final _AuthRequest _self;
  final $Res Function(_AuthRequest) _then;

/// Create a copy of AuthRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,Object? application = null,Object? roles = freezed,}) {
  return _then(_AuthRequest(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as String,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$AuthResponse {

 String? get id; String? get token;
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseCopyWith<AuthResponse> get copyWith => _$AuthResponseCopyWithImpl<AuthResponse>(this as AuthResponse, _$identity);

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,token);

@override
String toString() {
  return 'AuthResponse(id: $id, token: $token)';
}


}

/// @nodoc
abstract mixin class $AuthResponseCopyWith<$Res>  {
  factory $AuthResponseCopyWith(AuthResponse value, $Res Function(AuthResponse) _then) = _$AuthResponseCopyWithImpl;
@useResult
$Res call({
 String? id, String? token
});




}
/// @nodoc
class _$AuthResponseCopyWithImpl<$Res>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._self, this._then);

  final AuthResponse _self;
  final $Res Function(AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? token = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AuthResponse implements AuthResponse {
  const _AuthResponse({this.id, this.token});
  factory _AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

@override final  String? id;
@override final  String? token;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseCopyWith<_AuthResponse> get copyWith => __$AuthResponseCopyWithImpl<_AuthResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,token);

@override
String toString() {
  return 'AuthResponse(id: $id, token: $token)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseCopyWith<$Res> implements $AuthResponseCopyWith<$Res> {
  factory _$AuthResponseCopyWith(_AuthResponse value, $Res Function(_AuthResponse) _then) = __$AuthResponseCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? token
});




}
/// @nodoc
class __$AuthResponseCopyWithImpl<$Res>
    implements _$AuthResponseCopyWith<$Res> {
  __$AuthResponseCopyWithImpl(this._self, this._then);

  final _AuthResponse _self;
  final $Res Function(_AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? token = freezed,}) {
  return _then(_AuthResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
