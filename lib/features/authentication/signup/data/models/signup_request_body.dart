import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  @JsonKey(name: 'firstName')
  final String firstName;

  @JsonKey(name: 'lastName')
  final String lastName;

  @JsonKey(name: 'dateOfBirth')
  final String dateOfBirth; // keep it String for API (e.g., "2025-08-16")

  @JsonKey(name: 'userName')
  final String userName;

  final String email;
  final String password;

  SignupRequestBody({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.userName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
