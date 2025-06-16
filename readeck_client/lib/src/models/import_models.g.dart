// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WallabagImport _$WallabagImportFromJson(Map<String, dynamic> json) =>
    _WallabagImport(
      url: json['url'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      clientId: json['client_id'] as String,
      clientSecret: json['client_secret'] as String,
    );

Map<String, dynamic> _$WallabagImportToJson(_WallabagImport instance) =>
    <String, dynamic>{
      'url': instance.url,
      'username': instance.username,
      'password': instance.password,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
