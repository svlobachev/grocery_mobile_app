import 'package:json_annotation/json_annotation.dart';

part 'account_token.g.dart';

@JsonSerializable()
class AccountToken {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'account_token')
  String accountToken;

  AccountToken({this.code, this.accountToken});

  factory AccountToken.fromJson(Map<String, dynamic> json) =>
      _$AccountTokenFromJson(json);
}

@JsonSerializable()
class SmsResponse {
  @JsonKey(name: 'result')
  AccountToken result;

  SmsResponse({this.result});

  factory SmsResponse.fromJson(Map<String, dynamic> json) =>
      _$SmsResponseFromJson(json);
}
