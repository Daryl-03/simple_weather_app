import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:simple_weather_app/domain/models/weather_report.dart';
import 'package:simple_weather_app/domain/useCases/get_current_weather.dart';
import 'package:logger/logger.dart';
import 'package:simple_weather_app/main.dart';

class HomeController extends GetxController{
  var isLoading = true.obs;

  // weather report
  var weatherReports = <WeatherReport>[];
  final cities = [
    "Dakar",
    "Tokyo",
    "Paris",
    "New York",
    "Londres"
  ];

  final getweatherReport = Get.find<GetCurrentWeather>();
  var _currentCityIndex = 0;

  void getNextCityWeatherReport(){
    if(weatherReports.length == cities.length) {
      weatherReports = [];
      _currentCityIndex = 0;
    }
    getweatherReport(cities[_currentCityIndex]).then((value) {
      weatherReports.add(value);
      _currentCityIndex++;
    });
  }

  // waiting message
  final _waitingMessages = [
    "Nous téléchargeons les données…",
    "C’est presque fini…",
    "Plus que quelques secondes avant d’avoir le résultat…",
    "Tout est prêt !"
  ];
  var waitingMessage = "".obs;
  late final Timer _waitingMessageTimer;

  // progress bar
  var progressNotifier = ValueNotifier<double>(0);
  late final Timer _progressTimer;

  void progressCallBackTimer(timer){
    logger.d(timer.tick);
    progressNotifier.value += 20;
    logger.d(" progress : ${progressNotifier.value}");
    getNextCityWeatherReport();
    if(timer.tick == 5){
      timer.cancel();
      _waitingMessageTimer.cancel();
      waitingMessage.value = _waitingMessages[3];
      Timer(const Duration(seconds: 12), (){
        isLoading.value = false;
        for(var i = 0; i < cities.length; i++){
          logger.i(weatherReports[i]);
        }
      });
    }
  }

  void waitingMessageCallBackTimer(timer){
    waitingMessage.value = _waitingMessages[timer.tick%3];
    if(!isLoading.value){
      timer.cancel();
      waitingMessage.value = "";
    }
  }

  @override
  void onInit() {
    super.onInit();
    waitingMessage.value = _waitingMessages[0];
    _progressTimer = Timer.periodic(const Duration(seconds: 12), progressCallBackTimer);
    _waitingMessageTimer = Timer.periodic(const Duration(seconds: 6), waitingMessageCallBackTimer);
  }

  @override
  void onReady() {
    super.onReady();
  }

  void refreshTimer(){
    isLoading.value = true;
    progressNotifier.value = 10;
    _progressTimer.cancel();
    _progressTimer = Timer.periodic(const Duration(seconds: 12), progressCallBackTimer);
    _waitingMessageTimer = Timer.periodic(const Duration(seconds: 6), waitingMessageCallBackTimer);
  }
}