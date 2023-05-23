import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_weather_app/utils/app_layout.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutStatusBar(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: displayWidth,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: displayHeight * 0.23,
              ),
              Image.asset(
                "assets/images/onboarding_cloud_1.png",
                width: displayWidth * 0.8,
                height: displayHeight * 0.3,
              ),
              SizedBox(
                height: displayHeight * 0.15,
              ),
              Container(
                height: displayHeight * 0.3,
                width: displayWidth * 0.8,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Discover the world's top cities",
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      height: displayHeight * 0.03,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed("/home");
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize: Size(displayWidth * 0.7, displayHeight * 0.06)
                        ),
                      child: const Text("Get Started"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
