import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/utils/mathUtil.dart';
import 'package:flutter_music/widgets/search_text.dart';

class SearchplaylistWidget extends StatelessWidget {
  final List<PlaylistStage>? playLists;
  final String? searchKey;

  SearchplaylistWidget({this.playLists, this.searchKey});

  @override
  Widget build(BuildContext context) {
    return _buildListView(context);
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 20, right: 20),
      itemCount: playLists?.length,
      itemBuilder: (BuildContext context, int index) {
        PlaylistStage stage = playLists![index];
        return _buildItem(context, stage);
      },
    );
  }

  Widget _buildItem(BuildContext context, PlaylistStage stage) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageItemWidget(
                url: stage.coverImgUrl,
                width: 50,
                height: 50,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
//                      Text(
//                        stage.name ?? "",
//                        softWrap: true,
//                        textAlign: TextAlign.left,
//                        overflow: TextOverflow.ellipsis,
//                        maxLines: 1,
//                        style: GpOtherTheme.size17(context)!
//                            .copyWith(color: CommonColors.onSurfaceTextColor),
//                      ),
                      CustomSearchText(
                        searchKey: searchKey,
                        searchContent: stage.name,
                      ),
                      Text.rich(
                        TextSpan(
                            text: "${stage.trackCount ?? 0}首音乐",
                            children: [
                              if (stage.creator?.nickname != null)
                                TextSpan(
                                    text:
                                        " by ${stage.creator?.nickname ?? ""}，"),
                              if (stage.playCount != null)
                                TextSpan(
                                    text:
                                        " 播放${MathUtils.getPlayNumberStr(stage.playCount!)}")
                            ]),
                        softWrap: true,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GpOtherTheme.size13(context)!.copyWith(
                            color: CommonColors.textColor999, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              Text.rich(
                TextSpan(text: "8.9", children: [
                  TextSpan(text: "分", style: GpOtherTheme.size11Grey(context))
                ]),
                style: GpOtherTheme.size17(context)!
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
          if (stage.officialTags != null &&
              stage.officialTags?.isNotEmpty == true)
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: Row(
                children: stage.officialTags!
                    .map((e) => Container(
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          padding: EdgeInsets.all(3.0),
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            e,
                            style: GpOtherTheme.size12(context)!
                                .copyWith(fontSize: 9, color: Colors.orange),
                          ),
                        ))
                    .toList(),
              ),
            ),
          if (stage.specialType != null && stage.specialType == 300)
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: Text.rich(
                TextSpan(text: "包含", children: [
                  TextSpan(
                      text: "《",
                      style: GpOtherTheme.size13(context)!
                          .copyWith(color: CommonColors.textColor999)),
                  TextSpan(
                      text: "哪里都是你",
                      style: GpOtherTheme.size13(context)!
                          .copyWith(color: Colors.blue)),
                  TextSpan(
                      text: "》",
                      style: GpOtherTheme.size13(context)!
                          .copyWith(color: CommonColors.textColor999)),
                ]),
                style: GpOtherTheme.size13(context)!
                    .copyWith(color: CommonColors.textColor999),
              ),
            )
        ],
      ),
    );
  }
}
