import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/video/models/info.dart';

class VideoComponentWidget extends StatefulWidget {
  final VideoDetailInfoWrap? infoWrap;

  VideoComponentWidget({this.infoWrap});

  @override
  _VideoComponentWidgetState createState() => _VideoComponentWidgetState();
}

class _VideoComponentWidgetState extends State<VideoComponentWidget> {
  List<String> images = [];
  List<String> titles = [];

  @override
  void initState() {
    super.initState();
    String praisePic = widget.infoWrap?.liked == true ? "" : "";
    images = [
      "cm6_video_icn_praise~iphone.png",
      "cm8_mlog_playlist_comment~iphone.png",
      "cm8_menu_comment_forward~iphone.png",
      "cm8_mlog_playlist_collection_normal~iphone.png"
    ];
    titles = [
      "${widget.infoWrap?.likedCount}",
      "${widget.infoWrap?.commentCount}",
      "${widget.infoWrap?.shareCount}",
      "收藏"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: images
            .map((imageName) =>
                _buildItem(imageName, titles[images.indexOf(imageName)]))
            .toList(),
      ),
    );
  }

  Widget _buildItem(String imageName, String title) {
    bool last = images.last == imageName;
    return Padding(
      padding: EdgeInsets.only(bottom: last ? 0 : 10),
      child: Column(
        children: [
          Image.asset(
            "assets/images/$imageName",
            color: CommonColors.onPrimaryTextColor,
            width: 30,
            height: 30,
            fit: BoxFit.fitWidth,
          ),
          Text(
            title,
            style: GpOtherTheme.size15(context)!
                .copyWith(color: CommonColors.onPrimaryTextColor),
          )
        ],
      ),
    );
  }
}
