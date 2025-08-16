import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: 'massage')
  final String? message;

  @JsonKey(name: 'isAuthenticated')
  final bool? isAuthenticated;

  final String? username;
  final String? email;
  final List<String>? roles;
  final String? token;
  final String? expiration;

  SignupResponse({
    this.message,
    this.isAuthenticated,
    this.username,
    this.email,
    this.roles,
    this.token,
    this.expiration,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
