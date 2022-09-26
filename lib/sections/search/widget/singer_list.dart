import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/iconfont.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/music/models/recommend.dart';
import 'package:flutter_music/widgets/search_text.dart';

class SearchSingerWidget extends StatefulWidget {
  final List<DailySongItem>? songs;
  final String? searchKey;
  final bool fromLyric;

  SearchSingerWidget({this.songs, this.searchKey, this.fromLyric = false});

  @override
  _SearchSingerWidgetState createState() => _SearchSingerWidgetState();
}

class _SearchSingerWidgetState extends State<SearchSingerWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.songs?.length,
      padding: const EdgeInsets.only(left: 20, right: 20),
      itemBuilder: (BuildContext context, int index) {
        DailySongItem songItem = widget.songs![index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.fromLyric == false ||
                (widget.fromLyric == true && index != 0))
              Container(
                width: double.infinity,
                height: 1,
                color: CommonColors.divider,
              ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRowWidget(context, songItem),
                  if (songItem.officialTags != null &&
                      songItem.officialTags?.isNotEmpty == true)
                    Row(
                      children: songItem.officialTags!
                          .map((e) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)),
                                ),
                                padding: const EdgeInsets.all(3.0),
                                margin: const EdgeInsets.only(right: 10),
                                child: Text(
                                  e,
                                  style: GpOtherTheme.size12(context)!.copyWith(
                                      fontSize: 9, color: Colors.orange),
                                ),
                              ))
                          .toList(),
                    ),
                  if (songItem.lyrics?.txt != null &&
                      songItem.lyrics?.txt?.isNotEmpty == true)
                    _buildLyric(songItem.lyrics!.txt!, songItem)
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildRowWidget(BuildContext context, DailySongItem songItem) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                left: widget.fromLyric == true ? 20 : 10, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchText(
                  searchContent: songItem.name,
                  searchKey: widget.searchKey,
                ),
                Row(
                  children: [
                    _buildIndicator(songItem, context),
                    Expanded(
                      child: CustomSearchText(
                        searchContent: songItem.getSongString(),
                        searchKey: widget.searchKey,
                        fontSize: 13,
                        fontColor: CommonColors.textColor999,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          width: 40,
          height: 40,
//            color: Colors.red,
          child: songItem.hasMV()
              ? Image.asset(
                  'assets/images/cm6_list_tag_mv~iphone.png',
                  color: CommonColors.textColor999,
                )
              : Container(
                  width: 0,
                ),
        ),
        Container(
          width: 30,
//            color: Colors.cyan,
          child: Icon(
            IconF.music_menu,
            color: CommonColors.textColor999,
          ),
        )
      ],
    );
  }

  Widget _buildLyric(String lyric, DailySongItem item) {
    String lyrics = lyric.split("\n").sublist(0, 3).join("\n");
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 7, top: 3),
                decoration: BoxDecoration(
                    color: CommonColors.textColorDDD,
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                padding: EdgeInsets.only(left: 2, right: 2),
                child: Text(
                  "词",
                  style: GpOtherTheme.size12(context)!
                      .copyWith(color: Colors.white, fontSize: 12),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchText(
                    searchContent: item.open == false ? lyrics : lyric,
                    searchKey: widget.searchKey,
                    fontColor: CommonColors.textColor999,
                    fontSize: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (mounted) {
                        setState(() {
                          item.open = !item.open;
                        });
                      }
                    },
                    child: Text.rich(
                      TextSpan(
                          text: item.open == false ? "展开歌词 " : "收起歌词 ",
                          children: [
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.only(top: 0),
//                              color: Colors.cyan,
                              width: 20,
                              height: 20,
                              child: Icon(
                                item.open == false
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_up,
                                color: CommonColors.textColor999,
//                                size: 20,
                              ),
                            ))
                          ]),
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GpOtherTheme.size13(context)!
                          .copyWith(color: CommonColors.textColor999),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(DailySongItem songItem, BuildContext context) {
    if (songItem.canShowSQ()) {
      List<Widget> widgets = [];

      if (songItem.canShowAuthSinger()) {
        widgets.add(_buildNormalIndicator(context, "原唱"));
      }

      if (songItem.canShowVipState()) {
        widgets.add(_buildNormalIndicator(context, "VIP"));

        if (songItem.canShowTryListening()) {
          widgets.add(_buildNormalIndicator(context, "试听"));
        }
      }

      widgets.add(_buildNormalIndicator(context, "SQ"));
      return Row(
        children: widgets.toList(),
      );
    }

    if (songItem.canShowNoRcmd()) {
      ///显示无音乐
      return _buildNormalIndicator(context, "无音源", sq: false);
    }
    return Container(
      width: 0,
      height: 0,
    );
  }

  ///vip
  Widget _buildNormalIndicator(BuildContext context, String text,
      {bool sq = true}) {
    return Container(
      padding: const EdgeInsets.only(left: 1, right: 1),
      margin: const EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(2.0)),
          border:
              Border.all(color: sq ? Colors.red : CommonColors.textColor999)),
      child: Text(
        text,
        style: GpOtherTheme.size12(context)!.copyWith(
            color: sq ? Colors.red : CommonColors.textColor999, fontSize: 8),
      ),
    );
  }
}
