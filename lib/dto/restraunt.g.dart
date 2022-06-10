// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restraunt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    mapUrl: json['map_url'] as String,
    name: json['name'] as String,
    openingOurs: json['opening_ours'] as String,
    tel: json['tel'] as String,
    address: json['address'] as String,
    email: json['email'] as String,
    description: json['description'] as String,
    photos:
        (json['restaurant_fotos'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'map_url': instance.mapUrl,
      'name': instance.name,
      'opening_ours': instance.openingOurs,
      'tel': instance.tel,
      'address': instance.address,
      'email': instance.email,
      'description': instance.description,
      'restaurant_fotos': instance.photos,
    };
