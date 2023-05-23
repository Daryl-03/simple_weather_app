import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:simple_weather_app/presentation/controllers/home_controller.dart';
import 'package:simple_weather_app/presentation/screens/widgets/weather_card.dart';
import 'package:simple_weather_app/utils/app_layout.dart';
import 'package:get/get.dart';

import 'package:flutter/animation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutAppBar(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF50166D),
            Color(0xFF654888),
            Color(0xFF785A90),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Weather App"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: displayWidth * 0.075),
            width: displayWidth,
            child: Obx(
              () => homeController.isLoading.value
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(
                          () => Text(
                            homeController.waitingMessage.value,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SimpleCircularProgressBar(
                          animationDuration: 50,
                          valueNotifier: homeController.progressNotifier,
                          mergeMode: true,
                          onGetText: (progress) {
                            return Text("${progress.toInt()}%");
                          },
                        )
                      ],
                    )
                  : Container(
                      child: ListView(
                        children: [
                          for (var weatherReport
                              in homeController.weatherReports)
                            WeatherCard(weatherReport: weatherReport),
                          ElevatedButton(
                            onPressed: () {
                              Get.offAndToNamed("/home");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF654888),
                              padding: EdgeInsets.symmetric(
                                horizontal: displayWidth * 0.1,
                                vertical: displayHeight * 0.02,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  displayWidth * 0.05,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Refresh",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: displayHeight * 0.05,
                          )
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
