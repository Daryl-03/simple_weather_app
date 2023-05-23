import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:simple_weather_app/data/datasource/weather_client.dart';
import 'package:simple_weather_app/data/repositories/weather_repository_impl.dart';
import 'package:simple_weather_app/domain/repositories/weather_repository.dart';
import 'package:simple_weather_app/domain/useCases/get_current_weather.dart';
import 'package:simple_weather_app/presentation/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(Dio());
    Get.put<WeatherRestClient>(WeatherRestClient(Get.find()));
    Get.put<WeatherRepository>(WeatherRepositoryImpl(Get.find()));
    Get.put<GetCurrentWeather>(GetCurrentWeather(Get.find()));
    Get.put<HomeController>(HomeController());
  }
}