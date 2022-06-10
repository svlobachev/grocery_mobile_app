import 'package:json_annotation/json_annotation.dart';

part 'default.g.dart';

enum Bonuses { discount }

@JsonSerializable()
class DefaultConfig {
  @JsonKey(name: 'logo_url')
  String logoUrl;

  @JsonKey(name: 'logo_size_percent')
  int logoSizePercent;

  @JsonKey(name: 'is_menu')
  bool isMenu;

  @JsonKey(name: 'primary_bgcolor')
  String primaryBgcolor;

  @JsonKey(name: 'secondary_bgcolor')
  String secondaryBgcolor;

  @JsonKey(name: 'bonuses')
  Bonuses bonuses;

  @JsonKey(name: 'font_name')
  String fontName;

  @JsonKey(name: 'lang')
  String lang;

  @JsonKey(name: 'category')
  String category;

  DefaultConfig({
    this.logoUrl,
    this.logoSizePercent,
    this.isMenu,
    this.primaryBgcolor,
    this.secondaryBgcolor,
    this.bonuses,
    this.fontName,
    this.lang,
    this.category,
  });

  factory DefaultConfig.fromJson(Map<String, dynamic> json) => _$DefaultConfigFromJson(json);
  Map<String, dynamic> toJson() => _$DefaultConfigToJson(this);
}
