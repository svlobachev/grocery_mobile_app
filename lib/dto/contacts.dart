import 'package:grocery_mobile_app/dto/restraunt.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contacts.g.dart';

@JsonSerializable()
class ContactsConfig {
  List<Restaurant> restaurants;

  ContactsConfig({
    this.restaurants,
  });

  factory ContactsConfig.fromJson(Map<String, dynamic> json) => _$ContactsConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ContactsConfigToJson(this);
}
