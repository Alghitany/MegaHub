import 'package:json_annotation/json_annotation.dart';
import 'package:mega_hub/core/helpers/extensions.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? errors;

  ApiErrorModel({this.message, this.code, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Returns a String containing all the error messages
  String getAllErrorMessages() {
    if (errors.isNullOrEmpty()) return message ?? "Unknown Error Occurred";

    return errors!.entries
        .map((entry) {
          final value = entry.value;
          return "${value.join(',')}";
        })
        .join("\n");
  }
}
