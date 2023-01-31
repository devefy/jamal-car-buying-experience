import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AssetVideoWidget extends StatefulWidget {
  const AssetVideoWidget({
    Key? key,
    required this.videoUrl,
    this.width,
    this.height,
  }) : super(key: key);
  final String videoUrl;
  final double? width;
  final double? height;

  @override
  State<AssetVideoWidget> createState() => _AssetVideoWidgetState();
}

class _AssetVideoWidgetState extends State<AssetVideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then(
        (value) => setState(() {}),
      )
      ..setVolume(0)
      ..setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: UniqueKey(),
        onVisibilityChanged: (info) {
          if (mounted) {
            if (info.visibleFraction > .8 && !_controller.value.isPlaying) {
              _controller.play();
            } else {
              _controller.pause();
            }
            setState(() {});
          }
        },
        child: _controller.value.isInitialized
            ? SizedBox(
                width: widget.width,
                height: widget.height,
                child: VideoPlayer(_controller),
              )
            : const SizedBox());
  }
}
