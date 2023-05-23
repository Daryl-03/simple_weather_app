import 'package:get/get.dart';
import 'package:simple_weather_app/presentation/bindings/home_bindings.dart';
import 'package:simple_weather_app/presentation/screens/home_screen.dart';
import 'package:simple_weather_app/presentation/screens/onboarding_screen.dart';

final routes = <GetPage>[
  GetPage(
    name: '/',
    page: () => const OnboardingScreen(),
  ),
  GetPage(
    name: "/home",
    page: ()=> const HomeScreen(),
    binding: HomeBindings(),
  )
];
