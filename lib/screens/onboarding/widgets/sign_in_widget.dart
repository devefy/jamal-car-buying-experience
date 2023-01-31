import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jamal_car_buying_experience/core/styles/app_colors.dart';
import 'package:jamal_car_buying_experience/core/styles/dimens.dart';
import 'package:jamal_car_buying_experience/core/styles/extensions.dart';
import 'package:jamal_car_buying_experience/screens/onboarding/widgets/onboarding_animator.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    super.key,
    required this.animator,
  });
  final OnboardingAnimator animator;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.p20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.translate(
              offset: Offset(0, (1 - animator.textAnim.value) * 120),
              child: FadeTransition(
                opacity: animator.textAnim,
                child: const Text(
                  'The best choice for buying cars',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.lightGray,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const Gap(Dimens.p48),
            Transform.translate(
              offset: Offset(0, 120 * (1 - animator.logInButtonAnim.value)),
              child: Transform.scale(
                scale: .8 + (.2 * animator.logInButtonAnim.value),
                child: FadeTransition(
                  opacity: animator.logInButtonAnim,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        alignment: Alignment.center,
                        backgroundColor: AppColors.primaryColor,
                        minimumSize: Size(
                          context.screenWidth,
                          60,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimens.p20),
                      child: Row(children: const [
                        Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.bgColor,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          FluentIcons.arrow_up_right_16_filled,
                          color: AppColors.bgColor,
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(Dimens.p32),
            Transform.translate(
              offset: Offset(0, (1 - animator.signUpButtonAnim.value) * 120),
              child: Container(
                padding: const EdgeInsets.only(bottom: Dimens.p8),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                )),
                child: const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Gap(context.viewPadding.bottom + Dimens.p40)
          ],
        ),
      ),
    );
  }
}
