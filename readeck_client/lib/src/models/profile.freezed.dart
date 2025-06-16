// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReaderSettings {

 String? get font;@JsonKey(name: 'font_size') int? get fontSize;@JsonKey(name: 'line_height') int? get lineHeight;
/// Create a copy of ReaderSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReaderSettingsCopyWith<ReaderSettings> get copyWith => _$ReaderSettingsCopyWithImpl<ReaderSettings>(this as ReaderSettings, _$identity);

  /// Serializes this ReaderSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReaderSettings&&(identical(other.font, font) || other.font == font)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.lineHeight, lineHeight) || other.lineHeight == lineHeight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,font,fontSize,lineHeight);

@override
String toString() {
  return 'ReaderSettings(font: $font, fontSize: $fontSize, lineHeight: $lineHeight)';
}


}

/// @nodoc
abstract mixin class $ReaderSettingsCopyWith<$Res>  {
  factory $ReaderSettingsCopyWith(ReaderSettings value, $Res Function(ReaderSettings) _then) = _$ReaderSettingsCopyWithImpl;
@useResult
$Res call({
 String? font,@JsonKey(name: 'font_size') int? fontSize,@JsonKey(name: 'line_height') int? lineHeight
});




}
/// @nodoc
class _$ReaderSettingsCopyWithImpl<$Res>
    implements $ReaderSettingsCopyWith<$Res> {
  _$ReaderSettingsCopyWithImpl(this._self, this._then);

  final ReaderSettings _self;
  final $Res Function(ReaderSettings) _then;

/// Create a copy of ReaderSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? font = freezed,Object? fontSize = freezed,Object? lineHeight = freezed,}) {
  return _then(_self.copyWith(
font: freezed == font ? _self.font : font // ignore: cast_nullable_to_non_nullable
as String?,fontSize: freezed == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as int?,lineHeight: freezed == lineHeight ? _self.lineHeight : lineHeight // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ReaderSettings implements ReaderSettings {
  const _ReaderSettings({this.font, @JsonKey(name: 'font_size') this.fontSize, @JsonKey(name: 'line_height') this.lineHeight});
  factory _ReaderSettings.fromJson(Map<String, dynamic> json) => _$ReaderSettingsFromJson(json);

@override final  String? font;
@override@JsonKey(name: 'font_size') final  int? fontSize;
@override@JsonKey(name: 'line_height') final  int? lineHeight;

/// Create a copy of ReaderSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReaderSettingsCopyWith<_ReaderSettings> get copyWith => __$ReaderSettingsCopyWithImpl<_ReaderSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReaderSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReaderSettings&&(identical(other.font, font) || other.font == font)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.lineHeight, lineHeight) || other.lineHeight == lineHeight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,font,fontSize,lineHeight);

@override
String toString() {
  return 'ReaderSettings(font: $font, fontSize: $fontSize, lineHeight: $lineHeight)';
}


}

/// @nodoc
abstract mixin class _$ReaderSettingsCopyWith<$Res> implements $ReaderSettingsCopyWith<$Res> {
  factory _$ReaderSettingsCopyWith(_ReaderSettings value, $Res Function(_ReaderSettings) _then) = __$ReaderSettingsCopyWithImpl;
@override @useResult
$Res call({
 String? font,@JsonKey(name: 'font_size') int? fontSize,@JsonKey(name: 'line_height') int? lineHeight
});




}
/// @nodoc
class __$ReaderSettingsCopyWithImpl<$Res>
    implements _$ReaderSettingsCopyWith<$Res> {
  __$ReaderSettingsCopyWithImpl(this._self, this._then);

  final _ReaderSettings _self;
  final $Res Function(_ReaderSettings) _then;

/// Create a copy of ReaderSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? font = freezed,Object? fontSize = freezed,Object? lineHeight = freezed,}) {
  return _then(_ReaderSettings(
font: freezed == font ? _self.font : font // ignore: cast_nullable_to_non_nullable
as String?,fontSize: freezed == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as int?,lineHeight: freezed == lineHeight ? _self.lineHeight : lineHeight // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$UserSettings {

@JsonKey(name: 'debug_info') bool? get debugInfo;@JsonKey(name: 'reader_settings') ReaderSettings? get readerSettings;
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<UserSettings> get copyWith => _$UserSettingsCopyWithImpl<UserSettings>(this as UserSettings, _$identity);

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettings&&(identical(other.debugInfo, debugInfo) || other.debugInfo == debugInfo)&&(identical(other.readerSettings, readerSettings) || other.readerSettings == readerSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,debugInfo,readerSettings);

@override
String toString() {
  return 'UserSettings(debugInfo: $debugInfo, readerSettings: $readerSettings)';
}


}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res>  {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) _then) = _$UserSettingsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'debug_info') bool? debugInfo,@JsonKey(name: 'reader_settings') ReaderSettings? readerSettings
});


$ReaderSettingsCopyWith<$Res>? get readerSettings;

}
/// @nodoc
class _$UserSettingsCopyWithImpl<$Res>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._self, this._then);

  final UserSettings _self;
  final $Res Function(UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? debugInfo = freezed,Object? readerSettings = freezed,}) {
  return _then(_self.copyWith(
debugInfo: freezed == debugInfo ? _self.debugInfo : debugInfo // ignore: cast_nullable_to_non_nullable
as bool?,readerSettings: freezed == readerSettings ? _self.readerSettings : readerSettings // ignore: cast_nullable_to_non_nullable
as ReaderSettings?,
  ));
}
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReaderSettingsCopyWith<$Res>? get readerSettings {
    if (_self.readerSettings == null) {
    return null;
  }

  return $ReaderSettingsCopyWith<$Res>(_self.readerSettings!, (value) {
    return _then(_self.copyWith(readerSettings: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserSettings implements UserSettings {
  const _UserSettings({@JsonKey(name: 'debug_info') this.debugInfo, @JsonKey(name: 'reader_settings') this.readerSettings});
  factory _UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);

@override@JsonKey(name: 'debug_info') final  bool? debugInfo;
@override@JsonKey(name: 'reader_settings') final  ReaderSettings? readerSettings;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSettingsCopyWith<_UserSettings> get copyWith => __$UserSettingsCopyWithImpl<_UserSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettings&&(identical(other.debugInfo, debugInfo) || other.debugInfo == debugInfo)&&(identical(other.readerSettings, readerSettings) || other.readerSettings == readerSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,debugInfo,readerSettings);

@override
String toString() {
  return 'UserSettings(debugInfo: $debugInfo, readerSettings: $readerSettings)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) _then) = __$UserSettingsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'debug_info') bool? debugInfo,@JsonKey(name: 'reader_settings') ReaderSettings? readerSettings
});


@override $ReaderSettingsCopyWith<$Res>? get readerSettings;

}
/// @nodoc
class __$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(this._self, this._then);

  final _UserSettings _self;
  final $Res Function(_UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debugInfo = freezed,Object? readerSettings = freezed,}) {
  return _then(_UserSettings(
debugInfo: freezed == debugInfo ? _self.debugInfo : debugInfo // ignore: cast_nullable_to_non_nullable
as bool?,readerSettings: freezed == readerSettings ? _self.readerSettings : readerSettings // ignore: cast_nullable_to_non_nullable
as ReaderSettings?,
  ));
}

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReaderSettingsCopyWith<$Res>? get readerSettings {
    if (_self.readerSettings == null) {
    return null;
  }

  return $ReaderSettingsCopyWith<$Res>(_self.readerSettings!, (value) {
    return _then(_self.copyWith(readerSettings: value));
  });
}
}


/// @nodoc
mixin _$UserInfo {

 String? get username; String? get email; DateTime? get created; DateTime? get updated; UserSettings? get settings;
/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInfoCopyWith<UserInfo> get copyWith => _$UserInfoCopyWithImpl<UserInfo>(this as UserInfo, _$identity);

  /// Serializes this UserInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInfo&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.settings, settings) || other.settings == settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,email,created,updated,settings);

@override
String toString() {
  return 'UserInfo(username: $username, email: $email, created: $created, updated: $updated, settings: $settings)';
}


}

/// @nodoc
abstract mixin class $UserInfoCopyWith<$Res>  {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) _then) = _$UserInfoCopyWithImpl;
@useResult
$Res call({
 String? username, String? email, DateTime? created, DateTime? updated, UserSettings? settings
});


$UserSettingsCopyWith<$Res>? get settings;

}
/// @nodoc
class _$UserInfoCopyWithImpl<$Res>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._self, this._then);

  final UserInfo _self;
  final $Res Function(UserInfo) _then;

/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = freezed,Object? email = freezed,Object? created = freezed,Object? updated = freezed,Object? settings = freezed,}) {
  return _then(_self.copyWith(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as UserSettings?,
  ));
}
/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $UserSettingsCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserInfo implements UserInfo {
  const _UserInfo({this.username, this.email, this.created, this.updated, this.settings});
  factory _UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

@override final  String? username;
@override final  String? email;
@override final  DateTime? created;
@override final  DateTime? updated;
@override final  UserSettings? settings;

/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInfoCopyWith<_UserInfo> get copyWith => __$UserInfoCopyWithImpl<_UserInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInfo&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.settings, settings) || other.settings == settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,email,created,updated,settings);

@override
String toString() {
  return 'UserInfo(username: $username, email: $email, created: $created, updated: $updated, settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$UserInfoCopyWith(_UserInfo value, $Res Function(_UserInfo) _then) = __$UserInfoCopyWithImpl;
@override @useResult
$Res call({
 String? username, String? email, DateTime? created, DateTime? updated, UserSettings? settings
});


@override $UserSettingsCopyWith<$Res>? get settings;

}
/// @nodoc
class __$UserInfoCopyWithImpl<$Res>
    implements _$UserInfoCopyWith<$Res> {
  __$UserInfoCopyWithImpl(this._self, this._then);

  final _UserInfo _self;
  final $Res Function(_UserInfo) _then;

/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = freezed,Object? email = freezed,Object? created = freezed,Object? updated = freezed,Object? settings = freezed,}) {
  return _then(_UserInfo(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as UserSettings?,
  ));
}

/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $UserSettingsCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// @nodoc
mixin _$UserProviderInfo {

 String? get id; String? get name; String? get application; List<String>? get roles; List<String>? get permissions;
/// Create a copy of UserProviderInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProviderInfoCopyWith<UserProviderInfo> get copyWith => _$UserProviderInfoCopyWithImpl<UserProviderInfo>(this as UserProviderInfo, _$identity);

  /// Serializes this UserProviderInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProviderInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.application, application) || other.application == application)&&const DeepCollectionEquality().equals(other.roles, roles)&&const DeepCollectionEquality().equals(other.permissions, permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,application,const DeepCollectionEquality().hash(roles),const DeepCollectionEquality().hash(permissions));

@override
String toString() {
  return 'UserProviderInfo(id: $id, name: $name, application: $application, roles: $roles, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $UserProviderInfoCopyWith<$Res>  {
  factory $UserProviderInfoCopyWith(UserProviderInfo value, $Res Function(UserProviderInfo) _then) = _$UserProviderInfoCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? application, List<String>? roles, List<String>? permissions
});




}
/// @nodoc
class _$UserProviderInfoCopyWithImpl<$Res>
    implements $UserProviderInfoCopyWith<$Res> {
  _$UserProviderInfoCopyWithImpl(this._self, this._then);

  final UserProviderInfo _self;
  final $Res Function(UserProviderInfo) _then;

/// Create a copy of UserProviderInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? application = freezed,Object? roles = freezed,Object? permissions = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,application: freezed == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserProviderInfo implements UserProviderInfo {
  const _UserProviderInfo({this.id, this.name, this.application, final  List<String>? roles, final  List<String>? permissions}): _roles = roles,_permissions = permissions;
  factory _UserProviderInfo.fromJson(Map<String, dynamic> json) => _$UserProviderInfoFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? application;
 final  List<String>? _roles;
@override List<String>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _permissions;
@override List<String>? get permissions {
  final value = _permissions;
  if (value == null) return null;
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserProviderInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProviderInfoCopyWith<_UserProviderInfo> get copyWith => __$UserProviderInfoCopyWithImpl<_UserProviderInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProviderInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProviderInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.application, application) || other.application == application)&&const DeepCollectionEquality().equals(other._roles, _roles)&&const DeepCollectionEquality().equals(other._permissions, _permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,application,const DeepCollectionEquality().hash(_roles),const DeepCollectionEquality().hash(_permissions));

@override
String toString() {
  return 'UserProviderInfo(id: $id, name: $name, application: $application, roles: $roles, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$UserProviderInfoCopyWith<$Res> implements $UserProviderInfoCopyWith<$Res> {
  factory _$UserProviderInfoCopyWith(_UserProviderInfo value, $Res Function(_UserProviderInfo) _then) = __$UserProviderInfoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? application, List<String>? roles, List<String>? permissions
});




}
/// @nodoc
class __$UserProviderInfoCopyWithImpl<$Res>
    implements _$UserProviderInfoCopyWith<$Res> {
  __$UserProviderInfoCopyWithImpl(this._self, this._then);

  final _UserProviderInfo _self;
  final $Res Function(_UserProviderInfo) _then;

/// Create a copy of UserProviderInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? application = freezed,Object? roles = freezed,Object? permissions = freezed,}) {
  return _then(_UserProviderInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,application: freezed == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>?,permissions: freezed == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$UserProfile {

 UserProviderInfo? get provider; UserInfo? get user;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,user);

@override
String toString() {
  return 'UserProfile(provider: $provider, user: $user)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 UserProviderInfo? provider, UserInfo? user
});


$UserProviderInfoCopyWith<$Res>? get provider;$UserInfoCopyWith<$Res>? get user;

}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provider = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as UserProviderInfo?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserInfo?,
  ));
}
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProviderInfoCopyWith<$Res>? get provider {
    if (_self.provider == null) {
    return null;
  }

  return $UserProviderInfoCopyWith<$Res>(_self.provider!, (value) {
    return _then(_self.copyWith(provider: value));
  });
}/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserInfoCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({this.provider, this.user});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  UserProviderInfo? provider;
@override final  UserInfo? user;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,user);

@override
String toString() {
  return 'UserProfile(provider: $provider, user: $user)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 UserProviderInfo? provider, UserInfo? user
});


@override $UserProviderInfoCopyWith<$Res>? get provider;@override $UserInfoCopyWith<$Res>? get user;

}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider = freezed,Object? user = freezed,}) {
  return _then(_UserProfile(
provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as UserProviderInfo?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserInfo?,
  ));
}

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProviderInfoCopyWith<$Res>? get provider {
    if (_self.provider == null) {
    return null;
  }

  return $UserProviderInfoCopyWith<$Res>(_self.provider!, (value) {
    return _then(_self.copyWith(provider: value));
  });
}/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserInfoCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
