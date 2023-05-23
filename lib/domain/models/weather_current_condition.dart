
import 'package:json_annotation/json_annotation.dart';

part 'weather_current_condition.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class WeatherCurrentCondition{
  WeatherCurrentCondition({
    required this.text,
    required this.icon,
    required this.code
});

  final String text;
  final String icon;
  final int code;

  factory WeatherCurrentCondition.fromJson(Map<String, dynamic> json) => _$WeatherCurrentConditionFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherCurrentConditionToJson(this);

  @override
  String toString() {
    return 'WeatherCurrentCondition\n\t{\n\t\ttext: $text,\n\t\ticon: $icon,\n\t\tcode: $code\n\t}';
  }
}