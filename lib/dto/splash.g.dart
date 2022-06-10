// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplashConfig _$SplashConfigFromJson(Map<String, dynamic> json) {
  return SplashConfig(
    logoUrl: json['logo_url'] as String,
    logoSizePercent: json['logo_size_percent'] as int,
  )
    ..bgColor = json['bgcolor'] as String
    ..devLogoUrl = json['dev_logo_url'] as String;
}

Map<String, dynamic> _$SplashConfigToJson(SplashConfig instance) =>
    <String, dynamic>{
      'logo_url': instance.logoUrl,
      'logo_size_percent': instance.logoSizePercent,
      'bgcolor': instance.bgColor,
      'dev_logo_url': instance.devLogoUrl,
    };
