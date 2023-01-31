import 'package:flutter/material.dart';
import 'package:jamal_car_buying_experience/screens/car_detail/car_detail.dart';

import 'screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jamal',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        'car_detail': (context) => const CarDetailScreen(),
      },
    );
  }
}
