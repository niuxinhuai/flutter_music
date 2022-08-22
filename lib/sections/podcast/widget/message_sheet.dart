import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/podcast/models/detail.dart';
import 'package:flutter_music/sections/podcast/models/detail_list.dart';

class PodcastDetailMessageSheet extends StatelessWidget {
  final DetailProgramsItem? item;
  final int? rewardCount;
  final double? width;

  PodcastDetailMessageSheet({this.item, this.rewardCount, this.width});

  List<String> imgNameList = [
    "cm8_mlog_playlist_collection_normal~iphone.png",
    "cm7_more_icon_reward~iphone.png",
    "cm8_mlog_playlist_comment~iphone.png",
    "cm8_playlist_download~iphone.png",
    "cm8_menu_comment_share~iphone.png",
    "cm7_more_icon_inform~iphone.png"
  ];
  List<String> titles = ["收藏声音", "赞赏主播", "评论", "下载", "分享", "举报"];

  @override
  Widget build(BuildContext context) {
    List<DetailSheetModel> models = imgNameList.map((e) {
      int index = imgNameList.indexOf(e);
      DetailSheetModel m = DetailSheetModel();
      m.imgNamed = e;
      m.title = titles[index];
      if (index == 1) {
        m.title = m.title! + "(${rewardCount ?? 0}次)";
      } else if (index == 2) {
        m.title = m.title! + "(${item?.commentCount ?? 0})";
      }
      return m;
    }).toList();

    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 20),
      width: width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageItemWidget(
                url: item?.coverUrl,
                width: 70,
                height: 70,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item?.name ?? "",
                      style:
                          GpOtherTheme.size17(context)!.copyWith(fontSize: 16),
                      maxLines: 2,
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      item?.dj?.nickname ?? "",
                      style: GpOtherTheme.size13(context)!
                          .copyWith(color: CommonColors.textColor999),
                    )
                  ],
                ),
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: width,
            height: 1,
            color: CommonColors.divider,
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.only(top: 20, bottom: 30),
            shrinkWrap: true,
            itemCount: models.length,
            itemBuilder: (BuildContext context, int index) {
              DetailSheetModel model = models[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.asset(
                        "assets/images/${model.imgNamed}",
                        width: 30,
                        height: 30,
                        color: CommonColors.onSurfaceTextColor,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Text(
                      model.title ?? "",
                      style: GpOtherTheme.size17(context),
                    ),
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
