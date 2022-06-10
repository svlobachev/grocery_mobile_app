import 'package:json_annotation/json_annotation.dart';

part 'restraunt.g.dart';

@JsonSerializable()
class Restaurant {
  @JsonKey(name: 'map_url')
  String mapUrl;

  String name;

  @JsonKey(name: 'opening_ours')
  String openingOurs;

  String tel;
  String address;
  String email;
  String description;

  @JsonKey(name: 'restaurant_fotos')
  List<String> photos;

  Restaurant({
    this.mapUrl,
    this.name,
    this.openingOurs,
    this.tel,
    this.address,
    this.email,
    this.description,
    this.photos,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
