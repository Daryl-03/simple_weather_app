
import 'package:json_annotation/json_annotation.dart';
import 'package:simple_weather_app/domain/models/weather_current_condition.dart';

part 'weather.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Weather{
  Weather({
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.humidity,
    required this.windKph,
    required this.isDay
  });

  final double tempC;
  final double tempF;
  final WeatherCurrentCondition condition;
  final double humidity;
  final double windKph;
  final int isDay;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  String toString() {
    return 'Weather\n\t{\n\t\ttempC: $tempC,\n\t\ttempF: $tempF,\n\t\tcondition: $condition\n\t\thumidity: $humidity\n\t}';
  }
}