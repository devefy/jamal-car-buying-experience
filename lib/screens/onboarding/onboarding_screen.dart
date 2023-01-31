import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamal_car_buying_experience/core/styles/app_colors.dart';
import 'package:jamal_car_buying_experience/core/styles/extensions.dart';
import 'package:jamal_car_buying_experience/screens/onboarding/widgets/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: 1.sec,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return OnboardingContent(
                controller: _controller,
              );
            }),
      ),
    );
  }
}
