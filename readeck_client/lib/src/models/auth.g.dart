// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthRequest _$AuthRequestFromJson(Map<String, dynamic> json) => _AuthRequest(
  username: json['username'] as String,
  password: json['password'] as String,
  application: json['application'] as String,
  roles: (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$AuthRequestToJson(_AuthRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'application': instance.application,
      'roles': instance.roles,
    };

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(id: json['id'] as String?, token: json['token'] as String?);

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{'id': instance.id, 'token': instance.token};
