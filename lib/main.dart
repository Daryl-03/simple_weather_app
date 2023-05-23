import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:simple_weather_app/config/routes.dart';
import 'package:simple_weather_app/presentation/screens/onboarding_screen.dart';
import 'package:simple_weather_app/utils/constants.dart';
import 'package:get/get.dart';

import 'data/datasource/weather_client.dart';

final logger = Logger();
void main() {
  runApp(const MyApp());
  // final Dio dio= Dio();
  // final weatherClient = WeatherRestClient(dio);
  // weatherClient.getCurrentWeatherReport(openWeatherApiKey, "dakar").then((value){
  //   logger.i(value);
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      getPages: routes,
      home: const OnboardingScreen(),
    );
  }
}
