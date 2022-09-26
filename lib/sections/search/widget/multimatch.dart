import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/search/models/search_multimatch.dart';
import 'package:flutter_music/utils/mathUtil.dart';
import 'package:flutter_music/utils/span_util.dart';
import 'package:flutter_music/widgets/card.dart';
import 'package:flutter_music/widgets/search_text.dart';

class SearchMultimatchWidget extends StatelessWidget {
  final SearchMultimatchWrap? wrap;
  final String? searchKey;

  SearchMultimatchWidget({this.wrap, this.searchKey});

  @override
  Widget build(BuildContext context) {
    if (wrap?.result?.artist == null) {
      return Container();
    }
    return GpCard(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
            child: Text(
              "你可能感兴趣",
              style: GpOtherTheme.size12(context)!
                  .copyWith(fontSize: 11, color: CommonColors.textColor999),
            ),
          ),
          if (wrap?.result?.artist != null &&
              wrap?.result?.artist?.isNotEmpty == true)
            _buildListView(),
//          TotalBottomWidget(
//            text: item?.moreText,
//          )
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 20, right: 20),
      itemCount: wrap?.result?.artist?.length,
      itemBuilder: (BuildContext context, int index) {
        MultimatchArtistItem artistsItem = wrap!.result!.artist![index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: _buildItem(context, artistsItem),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, MultimatchArtistItem artistsItem) {
    String singer = artistsItem.occupation != null &&
            artistsItem.occupation?.isNotEmpty == true
        ? "${artistsItem.occupation!}:"
        : "";
    return Row(
      children: [
        ImageItemWidget(
          url: artistsItem.img1v1Url,
          width: 50,
          height: 50,
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        children: CustomTextSpan.getSearchLightTextSpanList(
                            "$singer${artistsItem.name}",
                            searchContent: searchKey ?? "哪里都是你",
                            fontSize: 15,
                            fontColor: Color(0xff3c3c3c))),
                    if (artistsItem.alias != null &&
                        artistsItem.alias?.isNotEmpty == true)
                      TextSpan(
                          text: "（${artistsItem.alias!.join(" | ")}）",
                          style: GpOtherTheme.size15(context)!
                              .copyWith(color: CommonColors.textColor999)),
                  ]),
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GpOtherTheme.size15(context),
                ),
                Text(
                  '粉丝：${MathUtils.getPlayNumberStr(artistsItem.fansSize ?? 0)}，歌曲：${MathUtils.getPlayNumberStr(artistsItem.musicSize ?? 0)}',
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GpOtherTheme.size12(context)!
                      .copyWith(color: CommonColors.textColor999),
                ),
                Text.rich(
                  TextSpan(text: "TA的乐迷团", children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.blue,
                      size: 12,
                    )),
                  ]),
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GpOtherTheme.size13(context)!
                      .copyWith(color: Colors.blue),
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: Colors.red,
                size: 13,
              ),
              Text(
                "关注",
                style:
                    GpOtherTheme.size13(context)!.copyWith(color: Colors.red),
              )
            ],
          ),
        )
      ],
    );
  }
}
