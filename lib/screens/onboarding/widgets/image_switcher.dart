import 'package:flutter/material.dart';
import 'package:jamal_car_buying_experience/core/styles/extensions.dart';

class ImageSwitcher extends StatefulWidget {
  const ImageSwitcher({
    super.key,
    required this.imgUrl,
  });
  final String imgUrl;

  @override
  State<ImageSwitcher> createState() => _ImageSwitcherState();
}

class _ImageSwitcherState extends State<ImageSwitcher> with SingleTickerProviderStateMixin {
  late String previousImage;
  late String currentImage;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    previousImage = widget.imgUrl;
    currentImage = '';
    _animationController = AnimationController(
      vsync: this,
      duration: 600.ms,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ImageSwitcher oldWidget) {
    if (widget.imgUrl != oldWidget.imgUrl) {
      setState(() {
        currentImage = widget.imgUrl;
        previousImage = oldWidget.imgUrl;
      });
      _animationController.forward(from: 0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: 1 - _animation.value,
              child: Image.asset(
                previousImage,
                fit: BoxFit.cover,
              ),
            ),
            if (currentImage.isNotEmpty)
              Transform.scale(
                scale: 2 - _animation.value,
                child: FadeTransition(
                  opacity: _animation,
                  child: Image.asset(
                    currentImage,
                    fit: BoxFit.cover,
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
