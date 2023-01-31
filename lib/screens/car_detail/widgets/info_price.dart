import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jamal_car_buying_experience/core/styles/app_colors.dart';
import 'package:jamal_car_buying_experience/core/styles/dimens.dart';

class InfoPrice extends StatelessWidget {
  const InfoPrice({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.lightGray,
          ),
        ),
        const Gap(Dimens.p12),
        Text(
          price,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
