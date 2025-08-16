// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      message: json['massage'] as String?,
      isAuthenticated: json['isAuthenticated'] as bool?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      token: json['token'] as String?,
      expiration: json['expiration'] as String?,
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'massage': instance.message,
      'isAuthenticated': instance.isAuthenticated,
      'username': instance.username,
      'email': instance.email,
      'roles': instance.roles,
      'token': instance.token,
      'expiration': instance.expiration,
    };
