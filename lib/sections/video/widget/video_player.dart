import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String? url;
  final Function(double, Duration)? call;
  final VoidCallback? onTapVideo;
  //用于弹出评论框时，视频衔接播放
  final Duration? position;

  VideoPlayerWidget({this.url, this.call, this.onTapVideo, this.position});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url!);
    _controller?.initialize().then((value) {
      // 确保在初始化视频后显示第一帧，直至在按下播放按钮。
      if (mounted) {
        setState(() {
          if (widget.position != null) {
            _controller?.seekTo(widget.position!);
          }
          _controller?.play();
          _controller?.setLooping(true);
        });
      }
    });

    _controller?.addListener(() {
      if (_controller?.value.position != null &&
          _controller?.value.duration != null &&
          _controller!.value.duration.inMilliseconds != 0) {
        double v = _controller!.value.position.inMilliseconds *
            1.0 /
            _controller!.value.duration.inMilliseconds *
            1.0;
        if (widget.call != null && v != double.nan && v <= 1.0) {
          widget.call!(v, _controller!.value.position);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTapVideo != null) {
          widget.onTapVideo!();
        }
        print(">>>>>>>>>>点击了视频");
        if (_controller != null) {
          if (_controller!.value.isPlaying == true) {
            _controller!.pause();
          } else {
            _controller!.play();
          }
        }
      },
      child: Container(
        color: Colors.black,
        child: Center(
          child: _controller!.value.isInitialized
              ? Stack(
                  children: [
                    Center(
                      child: AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                    ),
                    if (_controller!.value.isPlaying == false)
                      Center(
                        child: Image.asset(
                          "assets/images/cm6_square_feed_video~iphone.png",
                          width: 70,
                          height: 70,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                  ],
                )
              : Container(
                  child: Text(
                    "无法播放视频时，记得把debug关掉",
                    style: GpOtherTheme.size17(context)!
                        .copyWith(color: CommonColors.onPrimaryTextColor),
                  ),
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
