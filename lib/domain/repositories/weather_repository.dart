
import 'package:simple_weather_app/domain/models/weather_report.dart';

abstract class WeatherRepository{
  Future<WeatherReport> getCurrentWeather(String cityName);
}