import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jamal_car_buying_experience/core/gen/assets.gen.dart';
import 'package:jamal_car_buying_experience/core/gen/fonts.gen.dart';
import 'package:jamal_car_buying_experience/core/models/car_model.dart';
import 'package:jamal_car_buying_experience/core/styles/app_colors.dart';
import 'package:jamal_car_buying_experience/core/styles/dimens.dart';
import 'package:jamal_car_buying_experience/core/styles/extensions.dart';
import 'package:jamal_car_buying_experience/core/widgets/asset_video_widget.dart';
import 'package:jamal_car_buying_experience/screens/car_detail/widgets/info_price.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * .8,
      width: double.infinity,
      child: Stack(children: [
        AssetVideoWidget(
          videoUrl: Assets.videos.featuredVid,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.p20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                toyotaCHR.name,
                style: const TextStyle(
                  fontFamily: FontFamily.futuraNowHeadline,
                  fontSize: 32,
                ),
              ),
              const Gap(Dimens.p12),
              const Divider(
                thickness: 2,
                color: AppColors.white,
              ),
              const Gap(Dimens.p12),
              Row(
                children: [
                  InfoPrice(
                    title: 'Financing',
                    price: '\$ ${toyotaCHR.monthlyPrice}/month',
                  ),
                  const Gap(Dimens.p40),
                  InfoPrice(
                    title: 'Buy Now',
                    price: '\$ ${toyotaCHR.price}',
                  ),
                ],
              ),
              const Gap(Dimens.p40)
            ],
          ),
        )
      ]),
    );
  }
}
