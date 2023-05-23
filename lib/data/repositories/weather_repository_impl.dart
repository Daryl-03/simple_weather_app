import 'package:get/get.dart';
import 'package:simple_weather_app/data/datasource/weather_client.dart';
import 'package:simple_weather_app/domain/models/weather_report.dart';
import 'package:simple_weather_app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository{

  WeatherRepositoryImpl(
    this._weatherRestClient,
  );

  final WeatherRestClient _weatherRestClient;

  @override
  Future<WeatherReport> getCurrentWeather(String cityName) {
    return _weatherRestClient.getCurrentWeatherReport(
      cityName
    );
  }
}