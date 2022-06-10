// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicConfig _$BasicConfigFromJson(Map<String, dynamic> json) {
  return BasicConfig(
    pages: (json['pages'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$BasicConfigToJson(BasicConfig instance) =>
    <String, dynamic>{
      'pages': instance.pages,
    };
