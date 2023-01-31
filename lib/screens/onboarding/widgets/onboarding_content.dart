import 'package:flutter/material.dart';
import 'package:jamal_car_buying_experience/core/gen/fonts.gen.dart';
import 'package:jamal_car_buying_experience/core/styles/app_colors.dart';
import 'package:jamal_car_buying_experience/core/styles/dimens.dart';
import 'package:jamal_car_buying_experience/core/styles/extensions.dart';
import 'package:jamal_car_buying_experience/core/widgets/outlined_text.dart';
import 'package:jamal_car_buying_experience/screens/onboarding/widgets/image_transition_widget.dart';
import 'package:jamal_car_buying_experience/screens/onboarding/widgets/onboarding_animator.dart';
import 'package:jamal_car_buying_experience/screens/onboarding/widgets/sign_in_widget.dart';

class OnboardingContent extends StatelessWidget {
  OnboardingContent({
    super.key,
    required this.controller,
  }) : animator = OnboardingAnimator(controller: controller);
  final OnboardingAnimator animator;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BackgroundText(animation: animator.textAnim),
        SignInWidget(
          animator: animator,
        ),
        SizedBox(
          height: context.screenHeight * (1 - .45 * animator.heightAnim.value),
          child: ImageTransitionWidget(
            onOnboardingComplete: () {
              controller.forward();
            },
          ),
        ),
        Positioned(
          right: Dimens.p16,
          top: context.viewPadding.top + Dimens.p32,
          child: FadeTransition(
            opacity: controller,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bgColor,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('car_detail');
                },
                child: const Text(
                  'Guest Enter',
                )),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: context.screenHeight * .5,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.p20),
            child: FittedBox(
              child: Text(
                'JAMAL',
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: FontFamily.watchmen,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _BackgroundText extends StatelessWidget {
  const _BackgroundText({
    required this.animation,
  });
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 0; i < 5; i += 1)
          Positioned(
            left: Dimens.p24,
            right: Dimens.p24,
            bottom: (context.screenHeight * .2) + (i * Dimens.p32 * animation.value),
            child: FittedBox(
              child: OutlinedText(
                'JAMAL',
                style: const TextStyle(
                  fontSize: 122,
                  fontFamily: FontFamily.watchmen,
                ),
                strokeColor: AppColors.darkerGray.withOpacity(.4),
              ),
            ),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: context.screenHeight * .5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [.5, 1.0],
                colors: [
                  AppColors.bgColor,
                  AppColors.bgColor.withOpacity(0),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
