import 'package:json_annotation/json_annotation.dart';

part 'card_config.g.dart';

@JsonSerializable()
class CardConfig {
  @JsonKey(name: 'card_config')
  List<Card> card;

  CardConfig({
    this.card,
  });

  factory CardConfig.fromJson(Map<String, dynamic> json) => _$CardConfigFromJson(json);


  Map<String, dynamic> toJson() => _$CardConfigToJson(this);
}

@JsonSerializable()
class Card {
  String fio;
  String category;
  String bonuses;
  String program;

  Card({
    this.fio,
    this.category,
    this.bonuses,
    this.program,
  });

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  Map<String, dynamic> toJson() => _$CardToJson(this);
}
