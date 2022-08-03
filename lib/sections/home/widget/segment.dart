import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/page/action.dart';
import 'package:flutter_music/sections/home/widget/header.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/utils/colorUtils.dart';
import 'package:flutter_music/utils/typeUtils.dart';
import 'package:flutter_music/widgets/segment.dart';

class SegmentWidget extends StatefulWidget {
  final MusicItem? item;
  final double? width;
  final Dispatch? dispatch;

  SegmentWidget({this.item, this.width, this.dispatch});

  @override
  _SegmentWidgetState createState() => _SegmentWidgetState();
}

class _SegmentWidgetState extends State<SegmentWidget> {
  List<List<CreativesItem>> children = [];
  List<String> titles = [];
  double itemWidth = 0;
  double imageSize = 60.0;
  int index = 0;
  List<CreativesItem> list = [];
  bool isVlog = false;

  @override
  void initState() {
    super.initState();

    if (widget.item != null &&
        widget.item?.creatives != null &&
        widget.item?.creatives?.isNotEmpty == true) {
      isVlog = widget.item!.blockCode == HomeBlockCodeUtils.vlog;
      List<CreativesItem> songList = [];
      List<CreativesItem> albumList = [];
      List<CreativesItem> digitalList = [];
      for (CreativesItem childItem in widget.item!.creatives!) {
        if (childItem.creativeType == NewAlbumTypeUtils.song) {
          //新歌
          songList.add(childItem);
        } else if (childItem.creativeType == NewAlbumTypeUtils.album) {
          //新碟
          albumList.add(childItem);
        } else if (childItem.creativeType == NewAlbumTypeUtils.digital) {
          //数字专辑
          digitalList.add(childItem);
        } else if (childItem.creativeType == RCMDTypeUtils.vlog) {
          //热门播客
          songList.add(childItem);
        } else if (childItem.creativeType == RCMDTypeUtils.book) {
          //有声书
          albumList.add(childItem);
        }
      }
      if (songList.length != 0) {
        titles.add(songList.first.uiElement?.mainTitle?.title ?? "");
        children.add(songList);
      }
      if (albumList.length != 0) {
        titles.add(albumList.first.uiElement?.mainTitle?.title ?? "");
        children.add(albumList);
      }
      if (digitalList.length != 0) {
        titles.add(digitalList.first.uiElement?.mainTitle?.title ?? "");
        children.add(digitalList);
      }
      list = children[index];
    }
    if (widget.width != null) {
      itemWidth = widget.width! - 15.0 - 25.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildHeader(), _buildSegWidget(list)],
    );
  }

  Widget _buildHeader() {
    String buttonTitle = children[index].first.uiElement?.button?.text ?? "";
    return RHeaderWidget(
      titles: titles,
      index: index,
      buttonTitle: buttonTitle,
      callback: (int idx) {
        if (mounted) {
          setState(() {
            index = idx;
            list = children[index];
          });
        }
      },
      buttonCallback: () {
        UiElementButton elementButton = list.first.uiElement!.button!;
        if (widget.dispatch != null) {
          widget.dispatch!(
              HomeMusicActionCreator.onTapRecommendMoreAction(elementButton));
        }
      },
    );
  }

  Widget _buildSegWidget(List<CreativesItem> items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15, right: 25),
      child: Row(
        children: items.map((e) => _buildColumn(e)).toList(),
      ),
    );
  }

  Widget _buildColumn(CreativesItem childItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: childItem.resources!.map((e) => _buildItemWidget(e)).toList(),
    );
  }

  Widget _buildItemWidget(ResourcesItem resourcesItem) {
    String named = "";
    if (resourcesItem.resourceExtInfo?.artists != null &&
        resourcesItem.resourceExtInfo?.artists?.isNotEmpty == true) {
      for (ResourceExtInfoArtists artists
          in resourcesItem.resourceExtInfo!.artists!) {
        if (named.isEmpty) {
          named = " - ${artists.name ?? ""}";
        } else {
          named += "/${artists.name}";
        }
      }
    }
    Color indicatorColor = Colors.red;
    if (ColorUtils.colorMap()
        .containsKey(resourcesItem.uiElement?.labelType ?? "")) {
      indicatorColor =
          ColorUtils.colorMap()[resourcesItem.uiElement!.labelType!]!;
    }

    return GestureDetector(
      onTap: () {
        if (widget.dispatch != null) {
          widget.dispatch!(
              HomeMusicActionCreator.onTapAlbumItemAction(resourcesItem));
        }
      },
      child: Container(
        width: itemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildImage(
                    context, resourcesItem.uiElement?.image?.imageUrl ?? ""),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isVlog == false)
                        Row(
                          children: [
                            Container(
                              child: Text(
                                resourcesItem.uiElement?.mainTitle?.title ?? "",
                                softWrap: true,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GpOtherTheme.size17(context),
                              ),
                              constraints:
                                  BoxConstraints(maxWidth: itemWidth - 140),
                            ),
                            Expanded(
                                child: Text(
                              named,
                              softWrap: true,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GpOtherTheme.size12(context)!
                                  .copyWith(color: CommonColors.textColor999),
                            ))
                          ],
                        ),
                      if (isVlog == true)
                        Text(
                          resourcesItem.uiElement?.mainTitle?.title ?? "",
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GpOtherTheme.size17(context),
                        ),
                      Row(
                        children: [
                          _buildIndicator(
                              isVlog == false
                                  ? "Hi-Res"
                                  : resourcesItem.uiElement?.labelTexts
                                          ?.join("") ??
                                      "123",
                              indicatorColor),
                          Text(
                            resourcesItem.uiElement?.subTitle?.title ?? "",
                            style: GpOtherTheme.size12(context)!
                                .copyWith(color: CommonColors.textColor999),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
            Container(
              width: itemWidth,
              height: 1,
              color: CommonColors.divider,
              margin: EdgeInsets.only(
                  right: 20, left: imageSize + 10, top: 5, bottom: 5),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(String str, Color color) {
    return Container(
      padding: EdgeInsets.only(left: 3, right: 3),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: Text(
        str,
        style:
            GpOtherTheme.size12(context)!.copyWith(fontSize: 10, color: color),
      ),
    );
  }

  Widget _buildImage(BuildContext context, String url) {
    return ImageItemWidget(
      url: url,
      width: imageSize,
      height: imageSize,
    );
  }
}
