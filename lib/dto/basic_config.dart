import 'package:json_annotation/json_annotation.dart';

part 'basic_config.g.dart';

@JsonSerializable()
class BasicConfig {
  @JsonKey(name: 'pages')
  List<String> pages;

  BasicConfig({
    this.pages,
  });

  factory BasicConfig.fromJson(Map<String, dynamic> json) => _$BasicConfigFromJson(json);
  Map<String, dynamic> toJson() => _$BasicConfigToJson(this);
}
