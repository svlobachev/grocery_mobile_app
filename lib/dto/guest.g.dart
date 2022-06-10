// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestResponse _$GuestResponseFromJson(Map<String, dynamic> json) {
  return GuestResponse(
    result: json['result'] == null
        ? null
        : Guest.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GuestResponseToJson(GuestResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

Guest _$GuestFromJson(Map<String, dynamic> json) {
  return Guest(
    phone: json['phone'] as String,
    email: json['email'] as String,
    surname: json['surname'] as String,
    name: json['name'] as String,
    patronymic: json['patronymic'] as String,
    fio: json['fio'] as String,
    gender: json['gender'] as String,
    cardNumber: json['card_number'] as String,
    birthday: json['birthday'] as String,
    bonuses: json['bonuses'] as String,
    discountPercent: json['page_name'] as String,
    category: json['category'] as String,
  );
}

Map<String, dynamic> _$GuestToJson(Guest instance) => <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'surname': instance.surname,
      'name': instance.name,
      'patronymic': instance.patronymic,
      'fio': instance.fio,
      'gender': instance.gender,
      'card_number': instance.cardNumber,
      'birthday': instance.birthday,
      'bonuses': instance.bonuses,
      'page_name': instance.discountPercent,
      'category': instance.category,
    };
