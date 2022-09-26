import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/search/models/search_result.dart';

class SearchArtistWidget extends StatelessWidget {
  //歌手/艺人
  final List<ArtistsItem>? artists;

  final bool? showFans;

  SearchArtistWidget({this.artists, this.showFans = true});

  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 20, right: 20),
      itemCount: artists?.length,
      itemBuilder: (BuildContext context, int index) {
        ArtistsItem artistsItem = artists![index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: _buildItem(context, artistsItem),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, ArtistsItem artistsItem) {
    return Row(
//      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ImageItemWidget(
              url: artistsItem.img1v1Url,
              width: 50,
              height: 50,
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            if (artistsItem.identityIconUrl != null)
              Positioned(
                bottom: 0,
                right: 0,
                child: CachedNetworkImage(
                  width: 20,
                  height: 20,
                  imageUrl: artistsItem.identityIconUrl ?? "",
                ),
              )
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(text: artistsItem.name, children: [
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
                if (showFans == true)
                  Text(
                    '粉丝：322.2 万',
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
