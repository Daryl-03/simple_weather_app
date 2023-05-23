import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../domain/models/weather_report.dart';


part 'weather_client.g.dart';

@RestApi(baseUrl: "http://api.weatherapi.com/v1")
abstract class WeatherRestClient {
  static const String _openWeatherApiKey = "ac68ce7ecc1a4232a06221843232005";
  factory WeatherRestClient(Dio dio, {String baseUrl}) = _WeatherRestClient;

  @GET("/current.json?key=$_openWeatherApiKey")
  Future<WeatherReport> getCurrentWeatherReport(
      @Query("q") String city,
  );
}