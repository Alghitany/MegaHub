import 'package:json_annotation/json_annotation.dart';

part 'user_details_response_model.g.dart';

@JsonSerializable()
class UserDetailsResponseModel {
  String? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? profilePictureUrl;

  @JsonKey(name: 'roles')
  List<String>? rolesList;

  UserDetailsResponseModel({
    this.id,
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.profilePictureUrl,
    this.rolesList,
  });

  factory UserDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsResponseModelToJson(this);
}
