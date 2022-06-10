// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardConfig _$CardConfigFromJson(Map<String, dynamic> json) {
  return CardConfig(
    card: (json['card_config'] as List)
        ?.map(
            (e) => e == null ? null : Card.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CardConfigToJson(CardConfig instance) =>
    <String, dynamic>{
      'card_config': instance.card,
    };

Card _$CardFromJson(Map<String, dynamic> json) {
  return Card(
    fio: json['fio'] as String,
    category: json['category'] as String,
    bonuses: json['bonuses'] as String,
    program: json['program'] as String,
  );
}

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'fio': instance.fio,
      'category': instance.category,
      'bonuses': instance.bonuses,
      'program': instance.program,
    };
