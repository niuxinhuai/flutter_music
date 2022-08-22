import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/music/widget/detail_sheet.dart';
import 'package:flutter_music/sections/music/widget/play_count.dart';
import 'package:flutter_music/sections/music/widget/user_focus.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/utils/mathUtil.dart';
import 'package:flutter_music/widgets/card.dart';
import 'package:flutter_music/widgets/clipper/bottom_clipper.dart';

class PlaylistDetailHeaderWidget extends StatefulWidget {
  final PlaylistStage? stage;

  PlaylistDetailHeaderWidget({this.stage});

  @override
  _PlaylistDetailHeaderWidgetState createState() =>
      _PlaylistDetailHeaderWidgetState();
}

class _PlaylistDetailHeaderWidgetState
    extends State<PlaylistDetailHeaderWidget> {
  List<String> named = [
    "cm8_mlog_playlist_collection_normal~iphone.png",
    "cm8_mlog_playlist_comment~iphone.png",
    "cm6_set_icn_share~iphone.png"
  ];
  List<String> counts = [];

  @override
  void initState() {
    super.initState();

    int subscribedCount = widget.stage?.subscribedCount ?? 0;
    int commentCount = widget.stage?.commentCount ?? 0;
    int shareCount = widget.stage?.shareCount ?? 0;

    counts.add(MathUtils.getPlayNumberStr(subscribedCount));
    counts.add(MathUtils.getPlayNumberStr(commentCount));
    counts.add(MathUtils.getPlayNumberStr(shareCount));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 30),
          child: Row(
            children: [
              Stack(
                children: [
                  ImageItemWidget(
                    url: widget.stage?.coverImgUrl ?? "",
                    width: 150,
                    height: 150,
                  ),
                  Positioned.fill(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(8.0)),
                        child: Image.asset(
                            "assets/images/cm6_list_sup_hot_big~iphone.png"),
                      ),
                      PlayCountWidget(
                        count: widget.stage?.playCount,
                      )
                    ],
                  ))
                ],
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                          widget.stage?.name ?? "",
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GpOtherTheme.size17(context)!
                              .copyWith(color: CommonColors.onPrimaryTextColor),
                        )),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        )
                      ],
                    ),
                    if (widget.stage?.creator != null) _buildUserAvaFocus(),
                    if (widget.stage?.description != null) _buildDetail(),
                  ],
                ),
              ))
            ],
          ),
        ),
        _buildBottomCountWidget(),
      ],
    );
  }

  ///用户个人头像，用户名，关注按钮
  Widget _buildUserAvaFocus() {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 20),
      child: DetailUserFocusWidget(
        avatarUrl: widget.stage?.creator?.avatarUrl,
        name: widget.stage?.creator?.nickname,
      ),
    );
  }

  Widget _buildDetail() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return DetailSheetWidget(
                stage: widget.stage,
                callback: () {
                  Navigator.pop(context);
                },
              );
            },
            backgroundColor: Colors.transparent);
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.stage?.description ?? "",
              softWrap: true,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: GpOtherTheme.size17(context)!
                  .copyWith(fontSize: 13, color: CommonColors.textColor999),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: CommonColors.textColor999,
            size: 14,
          )
        ],
      ),
    );
  }

  ///底部分享，评论，订阅按钮
  Widget _buildBottomCountWidget() {
    return Stack(
      children: [
        ClipPath(
          clipper: BottonClipper(),
          child: Container(
            height: 100,
            width: double.infinity,
            color: Colors.white,
          ),
        ),
        GpCard(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            padding: EdgeInsets.only(top: 12, bottom: 12),
            margin: EdgeInsets.only(left: 50, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: named.map((e) {
                int index = named.indexOf(e);
                String text = counts[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/$e",
                      width: 30,
                    ),
                    Text(
                      text,
                      style: GpOtherTheme.size12(context),
                    )
                  ],
                );
              }).toList(),
            ))
      ],
    );
  }
}
