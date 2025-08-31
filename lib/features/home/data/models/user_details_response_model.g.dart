// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsResponseModel _$UserDetailsResponseModelFromJson(
  Map<String, dynamic> json,
) => UserDetailsResponseModel(
  id: json['id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  userName: json['userName'] as String?,
  email: json['email'] as String?,
  profilePictureUrl: json['profilePictureUrl'] as String?,
  rolesList: (json['roles'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$UserDetailsResponseModelToJson(
  UserDetailsResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'userName': instance.userName,
  'email': instance.email,
  'profilePictureUrl': instance.profilePictureUrl,
  'roles': instance.rolesList,
};
