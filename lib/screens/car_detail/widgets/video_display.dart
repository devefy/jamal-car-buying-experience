import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamal_car_buying_experience/core/gen/assets.gen.dart';
import 'package:jamal_car_buying_experience/core/styles/dimens.dart';
import 'package:jamal_car_buying_experience/core/widgets/asset_video_widget.dart';

class VideoDisplay extends StatelessWidget {
  const VideoDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.p20),
      child: SizedBox(
        height: 350,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                Assets.images.pattern.path,
                width: 200,
                height: 200,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: AssetVideoWidget(
                videoUrl: Assets.videos.dispVid1,
                width: 300,
                height: 250,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: AssetVideoWidget(
                videoUrl: Assets.videos.dispVid2,
                width: 200,
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
