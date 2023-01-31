import 'package:flutter/material.dart';

class OnboardingAnimator {
  OnboardingAnimator({required this.controller})
      : heightAnim = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.8,
              curve: Curves.fastOutSlowIn,
            ))),
        textAnim = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.4,
              0.85,
              curve: Curves.fastOutSlowIn,
            ))),
        logInButtonAnim = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.42,
              0.9,
              curve: Curves.fastOutSlowIn,
            ))),
        signUpButtonAnim = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.48,
              1.0,
              curve: Curves.fastOutSlowIn,
            )));

  final AnimationController controller;
  final Animation<double> heightAnim;
  final Animation<double> logInButtonAnim;
  final Animation<double> textAnim;
  final Animation<double> signUpButtonAnim;
}
