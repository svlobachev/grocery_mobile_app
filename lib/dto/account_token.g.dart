// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountToken _$AccountTokenFromJson(Map<String, dynamic> json) {
  return AccountToken(
    code: json['code'] as int,
    accountToken: json['account_token'] as String,
    guest_id: json['guest_id'] as int,
  );
}

Map<String, dynamic> _$AccountTokenToJson(AccountToken instance) =>
    <String, dynamic>{
      'code': instance.code,
      'account_token': instance.accountToken,
      'guest_id': instance.guest_id,
    };

SmsResponse _$SmsResponseFromJson(Map<String, dynamic> json) {
  return SmsResponse(
    result: json['result'] == null
        ? null
        : AccountToken.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SmsResponseToJson(SmsResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
