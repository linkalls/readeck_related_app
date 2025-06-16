import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class ReaderSettings with _$ReaderSettings {
  const factory ReaderSettings({
    String? font,
    @JsonKey(name: 'font_size') int? fontSize,
    @JsonKey(name: 'line_height') int? lineHeight,
  }) = _ReaderSettings;

  factory ReaderSettings.fromJson(Map<String, dynamic> json) =>
      _$ReaderSettingsFromJson(json);
}

@freezed
abstract class UserSettings with _$UserSettings {
  const factory UserSettings({
    @JsonKey(name: 'debug_info') bool? debugInfo,
    @JsonKey(name: 'reader_settings') ReaderSettings? readerSettings,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}

@freezed
abstract class UserInfo with _$UserInfo {
  const factory UserInfo({
    String? username,
    String? email,
    DateTime? created,
    DateTime? updated,
    UserSettings? settings,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@freezed
abstract class UserProviderInfo with _$UserProviderInfo {
  const factory UserProviderInfo({
    String? id,
    String? name,
    String? application,
    List<String>? roles,
    List<String>? permissions,
  }) = _UserProviderInfo;

  factory UserProviderInfo.fromJson(Map<String, dynamic> json) =>
      _$UserProviderInfoFromJson(json);
}

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({UserProviderInfo? provider, UserInfo? user}) =
      _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
