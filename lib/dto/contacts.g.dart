// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsConfig _$ContactsConfigFromJson(Map<String, dynamic> json) {
  return ContactsConfig(
    restaurants: (json['restaurants'] as List)
        ?.map((e) =>
            e == null ? null : Restaurant.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ContactsConfigToJson(ContactsConfig instance) =>
    <String, dynamic>{
      'restaurants': instance.restaurants,
    };
