import 'package:json_annotation/json_annotation.dart';

part 'weather_location.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class WeatherLocation {
  WeatherLocation({
    required this.name,
    required this.region,
    required this.country,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  final String name;
  final String region;
  final String country;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  factory WeatherLocation.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocationFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherLocationToJson(this);

  @override
  String toString() {
    return 'WeatherLocation\n\t{\n\t\tname: $name,\n\t\tregion: $region,\n\t\tcountry: $country,\n\t\ttzId: $tzId,\n\t\tlocaltimeEpoch: $localtimeEpoch,\n\t\tlocaltime: $localtime\n\t';
  }
}
