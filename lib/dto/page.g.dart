// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageConfig _$PageConfigFromJson(Map<String, dynamic> json) {
  return PageConfig(
    active: json['active'] as bool,
    bannerBgColor: json['banner_bg_color'] as String,
    iconUrl: json['icon_url'] as String,
    pageName: json['page_name'] as String,
  )..key = json['key'] as String;
}

Map<String, dynamic> _$PageConfigToJson(PageConfig instance) =>
    <String, dynamic>{
      'key': instance.key,
      'active': instance.active,
      'banner_bg_color': instance.bannerBgColor,
      'icon_url': instance.iconUrl,
      'page_name': instance.pageName,
    };
