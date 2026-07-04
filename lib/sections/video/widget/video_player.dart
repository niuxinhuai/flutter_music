import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/utils/image_url_utils.dart';
import 'package:flutter_music/utils/local_media_store.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String? url;
  final String? coverUrl;
  final Function(double, Duration)? call;
  final VoidCallback? onTapVideo;
  //用于弹出评论框时，视频衔接播放
  final Duration? position;

  VideoPlayerWidget({
    this.url,
    this.coverUrl,
    this.call,
    this.onTapVideo,
    this.position,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller;
  Object? _playError;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.url != oldWidget.url) {
      _controller?.dispose();
      _controller = null;
      _initController();
    }
  }

  void _initController() {
    final playUrl = widget.url;
    _playError = null;
    if (playUrl == null || playUrl.isEmpty) {
      return;
    }
    _controller = LocalMediaStore.isLocalPath(playUrl)
        ? VideoPlayerController.file(File(playUrl))
        : VideoPlayerController.networkUrl(
            Uri.parse(playUrl),
            httpHeaders: _headersForUrl(playUrl),
          );
    _controller
        ?.initialize()
        .then((value) {
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
        })
        .catchError((e) {
          if (mounted) {
            setState(() {
              _playError = e;
            });
          }
        });

    _controller?.addListener(() {
      if (_controller?.value.position != null &&
          _controller?.value.duration != null &&
          _controller!.value.duration.inMilliseconds != 0) {
        double v =
            _controller!.value.position.inMilliseconds *
            1.0 /
            _controller!.value.duration.inMilliseconds *
            1.0;
        if (widget.call != null && !v.isNaN && v <= 1.0) {
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
          child: _controller?.value.isInitialized == true
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
              : Container(child: _buildPlaceholder(context)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  Map<String, String> _headersForUrl(String url) {
    final uri = Uri.tryParse(url);
    final host = uri?.host ?? "";
    if (host.endsWith("music.126.net") || host.endsWith("music.163.com")) {
      return ImageUrlUtils.musicImageHeaders;
    }
    return const <String, String>{};
  }

  Widget _buildPlaceholder(BuildContext context) {
    final playUrl = widget.url;
    final text = playUrl == null || playUrl.isEmpty
        ? "暂无可播放视频"
        : _playError == null
        ? "视频加载中"
        : "视频播放失败，请稍后重试";

    return Stack(
      fit: StackFit.expand,
      children: [
        if (widget.coverUrl?.isNotEmpty == true)
          CachedNetworkImage(
            imageUrl: ImageUrlUtils.normalizeMusicImageUrl(widget.coverUrl!),
            httpHeaders: ImageUrlUtils.musicImageHeaders,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const SizedBox.shrink(),
          ),
        Container(color: Colors.black.withOpacity(0.55)),
        Center(
          child: Text(
            text,
            style: GpOtherTheme.size17(
              context,
            )!.copyWith(color: CommonColors.onPrimaryTextColor),
          ),
        ),
      ],
    );
  }
}
