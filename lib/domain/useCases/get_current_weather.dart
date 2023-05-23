
import 'package:simple_weather_app/domain/models/weather.dart';
import 'package:simple_weather_app/domain/models/weather_report.dart';
import 'package:simple_weather_app/domain/repositories/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<WeatherReport> call(String cityName) async {
    return await repository.getCurrentWeather(cityName);
  }
}