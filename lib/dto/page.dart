import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';

@JsonSerializable()
class PageConfig {
  String key;

  @JsonKey(name: 'active')
  bool active;

  @JsonKey(name: 'banner_bg_color')
  String bannerBgColor;

  @JsonKey(name: 'icon_url')
  String iconUrl;

  @JsonKey(name: 'page_name')
  String pageName;

  PageConfig({
    this.active,
    this.bannerBgColor,
    this.iconUrl,
    this.pageName,
  });

  factory PageConfig.fromJson(Map<String, dynamic> json) => _$PageConfigFromJson(json);
  Map<String, dynamic> toJson() => _$PageConfigToJson(this);
}
