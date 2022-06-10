// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorEntity _$ErrorEntityFromJson(Map<String, dynamic> json) {
  return ErrorEntity(
    code: json['code'] as int,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ErrorEntityToJson(ErrorEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return ErrorResponse(
    error: json['error'] == null
        ? null
        : ErrorEntity.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
