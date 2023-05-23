import 'package:flutter/material.dart';
import 'package:simple_weather_app/domain/models/weather_report.dart';
import 'package:simple_weather_app/utils/app_layout.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key, required this.weatherReport}) : super(key: key);

  final WeatherReport weatherReport;

  static const nightColors = [
    Color(0xFF7E2080),
    Color(0xFF421653),
  ];

  static const dayColors = [
    // Color(0xFF00B4DB),
    // Color(0xFF0083B0),
    Colors.yellowAccent,
    Colors.red
  ];

  Color getTextColor(){
    return weatherReport.current.isDay == 1 ? Colors.black87 : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutAppBar(context);
    return Container(
      margin: EdgeInsets.only(
        top: displayHeight * 0.03,
        bottom: displayHeight * 0.02,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: displayWidth * 0.03,
        vertical: displayHeight * 0.03,
      ),
      width: displayWidth,
      height: displayHeight * 0.3,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: weatherReport.current.isDay == 1 ? dayColors : nightColors,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(displayWidth * 0.06),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${weatherReport.current.tempC}°",
                  style: TextStyle(
                    fontSize: 60,
                    color: getTextColor(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "H: ${weatherReport.current.humidity}%  W: ${weatherReport.current.tempF} km/h",
                      style: TextStyle(
                        fontSize: 14,
                        color: getTextColor(),
                      ),
                    ),
                    SizedBox(
                      height: displayHeight * 0.005,
                    ),
                    Text(
                      "${weatherReport.location.name}, ${weatherReport.location.country}",
                      style: TextStyle(
                        fontSize: 18,
                        color: getTextColor(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: displayHeight * 0.009,
                    ),
                    Text(
                      weatherReport.location.localtime,
                      style: TextStyle(
                        fontSize: 14,
                        color: getTextColor(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https:${weatherReport.current.condition.icon}",
                  width: displayWidth * 0.5,
                  height: displayHeight * 0.2,
                  fit: BoxFit.cover,
                ),
                Text(
                  weatherReport.current.condition.text,
                  style: TextStyle(
                    fontSize: 20,
                    color: getTextColor(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
