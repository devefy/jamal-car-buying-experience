import 'package:flutter/material.dart';
import 'package:jamal_car_buying_experience/core/gen/fonts.gen.dart';
import 'package:jamal_car_buying_experience/core/styles/app_colors.dart';
import 'package:jamal_car_buying_experience/core/styles/dimens.dart';
import 'package:jamal_car_buying_experience/core/widgets/outlined_text.dart';

class ExploreText extends StatelessWidget {
  const ExploreText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.p20),
            child: OutlinedText('EXPLORE',
                strokeColor: AppColors.lightGray,
                strokeWidth: 2,
                style: TextStyle(
                  fontSize: 152,
                  fontFamily: FontFamily.futuraNowHeadline,
                )),
          ),
        ),
        FittedBox(
          child: Padding(
            padding: EdgeInsets.only(
              left: Dimens.p20,
              right: Dimens.p20,
              top: Dimens.p12,
            ),
            child: Text('EXPLORE',
                style: TextStyle(
                  fontSize: 152,
                  fontFamily: FontFamily.futuraNowHeadline,
                )),
          ),
        ),
      ],
    );
  }
}
