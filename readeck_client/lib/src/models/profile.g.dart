// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReaderSettings _$ReaderSettingsFromJson(Map<String, dynamic> json) =>
    _ReaderSettings(
      font: json['font'] as String?,
      fontSize: (json['font_size'] as num?)?.toInt(),
      lineHeight: (json['line_height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReaderSettingsToJson(_ReaderSettings instance) =>
    <String, dynamic>{
      'font': instance.font,
      'font_size': instance.fontSize,
      'line_height': instance.lineHeight,
    };

_UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) =>
    _UserSettings(
      debugInfo: json['debug_info'] as bool?,
      readerSettings: json['reader_settings'] == null
          ? null
          : ReaderSettings.fromJson(
              json['reader_settings'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$UserSettingsToJson(_UserSettings instance) =>
    <String, dynamic>{
      'debug_info': instance.debugInfo,
      'reader_settings': instance.readerSettings,
    };

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
  username: json['username'] as String?,
  email: json['email'] as String?,
  created: json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String),
  updated: json['updated'] == null
      ? null
      : DateTime.parse(json['updated'] as String),
  settings: json['settings'] == null
      ? null
      : UserSettings.fromJson(json['settings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
  'username': instance.username,
  'email': instance.email,
  'created': instance.created?.toIso8601String(),
  'updated': instance.updated?.toIso8601String(),
  'settings': instance.settings,
};

_UserProviderInfo _$UserProviderInfoFromJson(Map<String, dynamic> json) =>
    _UserProviderInfo(
      id: json['id'] as String?,
      name: json['name'] as String?,
      application: json['application'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserProviderInfoToJson(_UserProviderInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'application': instance.application,
      'roles': instance.roles,
      'permissions': instance.permissions,
    };

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  provider: json['provider'] == null
      ? null
      : UserProviderInfo.fromJson(json['provider'] as Map<String, dynamic>),
  user: json['user'] == null
      ? null
      : UserInfo.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{'provider': instance.provider, 'user': instance.user};
