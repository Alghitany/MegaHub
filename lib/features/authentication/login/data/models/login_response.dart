import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String? message;
  final bool? isAuthenticated;
  final String? email;
  final List<String>? roles;
  final String? token;
  final String? expiration;

  LoginResponse({
    this.message,
    this.isAuthenticated,
    this.email,
    this.roles,
    this.token,
    this.expiration,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
