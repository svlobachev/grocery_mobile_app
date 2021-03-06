import 'package:json_annotation/json_annotation.dart';

part 'guest.g.dart';

@JsonSerializable()
class GuestResponse {
  Guest result;

  GuestResponse({
    this.result,
  });

  factory GuestResponse.fromJson(Map<String, dynamic> json) =>
      _$GuestResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GuestResponseToJson(this);
}

@JsonSerializable()
class Guest {
  String phone;
  String email;
  String surname;
  String name;
  String patronymic;
  String fio;
  String gender;

  @JsonKey(name: 'card_number')
  String cardNumber;

  String birthday;
  String bonuses;

  @JsonKey(name: 'page_name')
  String discountPercent;

  String category;
  String card_shortcode_img;
  String card_banner_url;
  Map<String, dynamic> card_fields;

  Guest({
    this.phone,
    this.email,
    this.surname,
    this.name,
    this.patronymic,
    this.fio,
    this.gender,
    this.cardNumber,
    this.birthday,
    this.bonuses,
    this.discountPercent,
    this.category,
    this.card_shortcode_img,
    this.card_banner_url,
    this.card_fields,
  });

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);
  Map<String, dynamic> toJson() => _$GuestToJson(this);
}
