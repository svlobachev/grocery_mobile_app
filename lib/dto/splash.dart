import 'package:json_annotation/json_annotation.dart';

part 'splash.g.dart';

@JsonSerializable()
class SplashConfig {
  @JsonKey(name: 'logo_url')
  String logoUrl;

  @JsonKey(name: 'logo_size_percent')
  int logoSizePercent;

  @JsonKey(name: 'bgcolor')
  String bgColor;

  @JsonKey(name: 'dev_logo_url')
  String devLogoUrl;

  SplashConfig({
    this.logoUrl,
    this.logoSizePercent,
  });

  factory SplashConfig.fromJson(Map<String, dynamic> json) => _$SplashConfigFromJson(json);
  Map<String, dynamic> toJson() => _$SplashConfigToJson(this);
}
