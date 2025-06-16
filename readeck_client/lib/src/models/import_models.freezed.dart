// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WallabagImport {

 String get url; String get username; String get password;@JsonKey(name: 'client_id') String get clientId;@JsonKey(name: 'client_secret') String get clientSecret;
/// Create a copy of WallabagImport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WallabagImportCopyWith<WallabagImport> get copyWith => _$WallabagImportCopyWithImpl<WallabagImport>(this as WallabagImport, _$identity);

  /// Serializes this WallabagImport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WallabagImport&&(identical(other.url, url) || other.url == url)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,username,password,clientId,clientSecret);

@override
String toString() {
  return 'WallabagImport(url: $url, username: $username, password: $password, clientId: $clientId, clientSecret: $clientSecret)';
}


}

/// @nodoc
abstract mixin class $WallabagImportCopyWith<$Res>  {
  factory $WallabagImportCopyWith(WallabagImport value, $Res Function(WallabagImport) _then) = _$WallabagImportCopyWithImpl;
@useResult
$Res call({
 String url, String username, String password,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'client_secret') String clientSecret
});




}
/// @nodoc
class _$WallabagImportCopyWithImpl<$Res>
    implements $WallabagImportCopyWith<$Res> {
  _$WallabagImportCopyWithImpl(this._self, this._then);

  final WallabagImport _self;
  final $Res Function(WallabagImport) _then;

/// Create a copy of WallabagImport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? username = null,Object? password = null,Object? clientId = null,Object? clientSecret = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientSecret: null == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WallabagImport implements WallabagImport {
  const _WallabagImport({required this.url, required this.username, required this.password, @JsonKey(name: 'client_id') required this.clientId, @JsonKey(name: 'client_secret') required this.clientSecret});
  factory _WallabagImport.fromJson(Map<String, dynamic> json) => _$WallabagImportFromJson(json);

@override final  String url;
@override final  String username;
@override final  String password;
@override@JsonKey(name: 'client_id') final  String clientId;
@override@JsonKey(name: 'client_secret') final  String clientSecret;

/// Create a copy of WallabagImport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WallabagImportCopyWith<_WallabagImport> get copyWith => __$WallabagImportCopyWithImpl<_WallabagImport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WallabagImportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WallabagImport&&(identical(other.url, url) || other.url == url)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,username,password,clientId,clientSecret);

@override
String toString() {
  return 'WallabagImport(url: $url, username: $username, password: $password, clientId: $clientId, clientSecret: $clientSecret)';
}


}

/// @nodoc
abstract mixin class _$WallabagImportCopyWith<$Res> implements $WallabagImportCopyWith<$Res> {
  factory _$WallabagImportCopyWith(_WallabagImport value, $Res Function(_WallabagImport) _then) = __$WallabagImportCopyWithImpl;
@override @useResult
$Res call({
 String url, String username, String password,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'client_secret') String clientSecret
});




}
/// @nodoc
class __$WallabagImportCopyWithImpl<$Res>
    implements _$WallabagImportCopyWith<$Res> {
  __$WallabagImportCopyWithImpl(this._self, this._then);

  final _WallabagImport _self;
  final $Res Function(_WallabagImport) _then;

/// Create a copy of WallabagImport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? username = null,Object? password = null,Object? clientId = null,Object? clientSecret = null,}) {
  return _then(_WallabagImport(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientSecret: null == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
