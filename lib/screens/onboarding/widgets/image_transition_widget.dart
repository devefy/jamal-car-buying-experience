import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jamal_car_buying_experience/core/models/car_model.dart';
import 'package:jamal_car_buying_experience/core/styles/extensions.dart';
import 'package:jamal_car_buying_experience/screens/onboarding/widgets/image_switcher.dart';

class ImageTransitionWidget extends StatefulWidget {
  const ImageTransitionWidget({
    super.key,
    required this.onOnboardingComplete,
  });
  final Function() onOnboardingComplete;

  @override
  State<ImageTransitionWidget> createState() => _ImageTransitionWidgetState();
}

class _ImageTransitionWidgetState extends State<ImageTransitionWidget> {
  int _imgIndex = 0;
  Timer? _timer;

  void _next() {
    if (_imgIndex == onboardingImages.length - 1) {
      widget.onOnboardingComplete();
      _timer?.cancel();
      return;
    }

    setState(() {
      _imgIndex += 1;
    });
  }

  @override
  void initState() {
    Future.delayed(600.ms, () {
      _timer = Timer.periodic(600.ms, (timer) {
        _next();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImageSwitcher(imgUrl: onboardingImages[_imgIndex]);
  }
}
