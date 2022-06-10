// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultConfig _$DefaultConfigFromJson(Map<String, dynamic> json) {
  return DefaultConfig(
    logoUrl: json['logo_url'] as String,
    logoSizePercent: json['logo_size_percent'] as int,
    isMenu: json['is_menu'] as bool,
    primaryBgcolor: json['primary_bgcolor'] as String,
    secondaryBgcolor: json['secondary_bgcolor'] as String,
    bonuses: _$enumDecodeNullable(_$BonusesEnumMap, json['bonuses']),
    fontName: json['font_name'] as String,
    lang: json['lang'] as String,
    category: json['category'] as String,
  );
}

Map<String, dynamic> _$DefaultConfigToJson(DefaultConfig instance) =>
    <String, dynamic>{
      'logo_url': instance.logoUrl,
      'logo_size_percent': instance.logoSizePercent,
      'is_menu': instance.isMenu,
      'primary_bgcolor': instance.primaryBgcolor,
      'secondary_bgcolor': instance.secondaryBgcolor,
      'bonuses': _$BonusesEnumMap[instance.bonuses],
      'font_name': instance.fontName,
      'lang': instance.lang,
      'category': instance.category,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$BonusesEnumMap = {
  Bonuses.discount: 'discount',
};
