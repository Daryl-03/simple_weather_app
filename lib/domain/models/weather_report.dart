
import 'package:json_annotation/json_annotation.dart';
import 'package:simple_weather_app/domain/models/weather.dart';
import 'package:simple_weather_app/domain/models/weather_location.dart';
part 'weather_report.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class WeatherReport{
  WeatherReport({
    required this.location,
    required this.current,
  });

  final WeatherLocation location;
  final Weather current;

  factory WeatherReport.fromJson(Map<String, dynamic> json) => _$WeatherReportFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherReportToJson(this);

  @override
  String toString() {
    return 'WeatherReport\n{\n\tlocation: $location,\n\tcurrent: $current\n}';
  }
}