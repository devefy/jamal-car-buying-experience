import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:jamal_car_buying_experience/core/styles/app_colors.dart';
import 'package:jamal_car_buying_experience/core/styles/dimens.dart';
import 'package:jamal_car_buying_experience/core/styles/extensions.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key, required this.scrollValue});
  final double scrollValue;

  @override
  Widget build(BuildContext context) {
    final colorTween = ColorTween(
      begin: AppColors.primaryColor,
      end: AppColors.bgColor,
    );
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: (context.screenWidth / 2 - (Dimens.p20 / 2)) * (1 - scrollValue),
          bottom: 0,
          child: _ActionButton(
            text: 'Compare',
            textColor: AppColors.white,
            bgColor: AppColors.darkerGray,
            scrollValue: scrollValue,
            icon: FluentIcons.arrows_bidirectional_20_filled,
          ),
        ),
        _ActionButton(
          text: 'Buy',
          textColor: AppColors.bgColor,
          bgColor: colorTween.transform(scrollValue)!,
          scrollValue: scrollValue,
          icon: FluentIcons.arrow_left_12_filled,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.bgColor,
    required this.scrollValue,
    required this.icon,
  }) : super(key: key);
  final double scrollValue;
  final String text;
  final Color textColor;
  final Color bgColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    const minButtonWidth = 68.0;
    final maxButtonWidth = (context.screenWidth / 2) - Dimens.p20;
    const height = minButtonWidth;
    double opacity = ((scrollValue - 0.7) / 0.3).clamp(0, 1);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        customBorder: const StadiumBorder(),
        child: Ink(
          width: lerpDouble(maxButtonWidth, minButtonWidth, scrollValue),
          height: height,
          decoration: ShapeDecoration(
            color: bgColor,
            shape: const StadiumBorder(),
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: opacity,
                  child: Icon(
                    icon,
                    color: AppColors.white,
                  ),
                ),
                Opacity(
                  opacity: 1 - opacity,
                  child: Text(
                    text,
                    maxLines: 1,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
