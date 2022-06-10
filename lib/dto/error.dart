import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable()
class ErrorEntity {
  int code;
  String message;

  ErrorEntity({
    this.code,
    this.message,
  });

  factory ErrorEntity.fromJson(Map<String, dynamic> json) => _$ErrorEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorEntityToJson(this);
}

@JsonSerializable()
class ErrorResponse {
  ErrorEntity error;

  ErrorResponse({
    this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
