import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jamal_car_buying_experience/core/models/car_model.dart';
import 'package:jamal_car_buying_experience/core/styles/app_colors.dart';
import 'package:jamal_car_buying_experience/core/styles/dimens.dart';
import 'package:jamal_car_buying_experience/core/styles/extensions.dart';
import 'package:jamal_car_buying_experience/screens/car_detail/widgets/action_buttons.dart';
import 'package:jamal_car_buying_experience/screens/car_detail/widgets/custom_app_bar.dart';
import 'package:jamal_car_buying_experience/screens/car_detail/widgets/explore_text.dart';
import 'package:jamal_car_buying_experience/screens/car_detail/widgets/header.dart';
import 'package:jamal_car_buying_experience/screens/car_detail/widgets/video_display.dart';

class CarDetailContent extends StatefulWidget {
  const CarDetailContent({super.key});

  @override
  State<CarDetailContent> createState() => _CarDetailContentState();
}

class _CarDetailContentState extends State<CarDetailContent> {
  late final ScrollController _scrollController;
  double _scrollValue = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _scrollController.addListener(_scrollListener);
    super.didChangeDependencies();
  }

  void _scrollListener() {
    double maxScrollDistance = context.screenHeight * .8;
    setState(() {
      _scrollValue = (_scrollController.offset / maxScrollDistance).clamp(
        0,
        1,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: toyotaCHR.name,
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Header(),
                const Gap(Dimens.p40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.p16),
                  child: Text.rich(TextSpan(
                      children: [
                        TextSpan(text: toyotaCHR.promotionalCopy_),
                        TextSpan(
                          text: toyotaCHR.promotionalCopy,
                          style: const TextStyle(
                            color: AppColors.darkerGray,
                          ),
                        ),
                      ],
                      style: const TextStyle(
                        fontSize: 28,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ))),
                ),
                const Gap(Dimens.p48),
                const VideoDisplay(),
                const Gap(Dimens.p48),
                const ExploreText(),
                Gap(context.viewPadding.bottom + Dimens.p32)
              ],
            ),
          )
        ],
      ),
      floatingActionButton: ActionButtons(scrollValue: _scrollValue),
    );
  }
}
