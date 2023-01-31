import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jamal_car_buying_experience/core/styles/app_colors.dart';
import 'package:jamal_car_buying_experience/core/styles/dimens.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(
          FluentIcons.ios_arrow_ltr_24_filled,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
        ),
      ),
      actions: const [
        Icon(
          FluentIcons.heart_12_filled,
          size: Dimens.iconExtraLarge,
        ),
        Gap(Dimens.p12),
        Icon(
          FluentIcons.arrow_up_right_16_filled,
          size: Dimens.iconExtraLarge,
        ),
        Gap(Dimens.p16),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
