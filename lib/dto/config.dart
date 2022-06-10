import 'package:grocery_mobile_app/dto/default.dart';
import 'package:grocery_mobile_app/dto/splash.dart';
import 'package:grocery_mobile_app/dto/basic_config.dart';
import 'package:grocery_mobile_app/dto/card_config.dart';
import 'package:grocery_mobile_app/dto/contacts.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class Config {
  @JsonKey(name: 'default')
  DefaultConfig defaultConfig;

  @JsonKey(name: 'splash')
  SplashConfig splashConfig;

  @JsonKey(name: 'basic')
  BasicConfig basicConfig;

  @JsonKey(name: 'contact')
  ContactsConfig contactsConfig;

  @JsonKey(name: 'card')
  CardConfig cardConfig;

  Config({
    this.defaultConfig,
    this.splashConfig,
    this.contactsConfig,
  });

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}

@JsonSerializable()
class Result {
  Config data;

  Result({this.data});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@JsonSerializable()
class MainConfig {
  Result result;

  MainConfig({this.result});

  factory MainConfig.fromJson(Map<String, dynamic> json) =>
      _$MainConfigFromJson(json);
}
