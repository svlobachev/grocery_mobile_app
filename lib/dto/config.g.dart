// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return Config(
    defaultConfig: json['default'] == null
        ? null
        : DefaultConfig.fromJson(json['default'] as Map<String, dynamic>),
    splashConfig: json['splash'] == null
        ? null
        : SplashConfig.fromJson(json['splash'] as Map<String, dynamic>),
    contactsConfig: json['contact'] == null
        ? null
        : ContactsConfig.fromJson(json['contact'] as Map<String, dynamic>),
  )
    ..basicConfig = json['basic'] == null
        ? null
        : BasicConfig.fromJson(json['basic'] as Map<String, dynamic>)
    ..cardConfig = json['card'] == null
        ? null
        : CardConfig.fromJson(json['card'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'default': instance.defaultConfig,
      'splash': instance.splashConfig,
      'basic': instance.basicConfig,
      'contact': instance.contactsConfig,
      'card': instance.cardConfig,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    data: json['data'] == null
        ? null
        : Config.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'data': instance.data,
    };

MainConfig _$MainConfigFromJson(Map<String, dynamic> json) {
  return MainConfig(
    result: json['result'] == null
        ? null
        : Result.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MainConfigToJson(MainConfig instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
