import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/models/common_model.dart';
import 'package:flutter_music/models/simple_model.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/page/action.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/home/widget/text.dart';
import 'package:flutter_music/sections/music/widget/play_count.dart';
import 'package:flutter_music/utils/mathUtil.dart';

class RItemWidget extends StatefulWidget {
  final CreativesItem? item;
  final double? size;
  final Dispatch? dispatch;

  RItemWidget({this.item, this.size, this.dispatch});

  @override
  _RItemWidgetState createState() => _RItemWidgetState();
}

class _RItemWidgetState extends State<RItemWidget> {
  String title = "";
  int index = 0;

  @override
  void initState() {
    super.initState();
    if (widget.item!.resources!.first.uiElement?.mainTitle?.title != null) {
      title = widget.item!.resources!.first.uiElement!.mainTitle!.title!;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.item?.resources == null ||
        widget.item?.resources?.isEmpty == true) {
      return Container(
        width: 0,
        height: 0,
      );
    }
    if (widget.item!.resources!.length == 1) {
      String? url = widget.item!.resources!.first.uiElement?.image?.imageUrl;
      int? playCount = widget.item!.resources!.first.resourceExtInfo?.playCount;
      return _buildlSingleItem(context, url, playCount);
    }
    return _buildSwiperWidget(context);
  }

  Widget _buildlSingleItem(BuildContext context, String? url, int? count) {
    return GestureDetector(
      onTap: () {
        if (widget.dispatch != null) {
          widget.dispatch!(HomeMusicActionCreator.onTapRecommendItemAction(
              widget.item!.resources!.first));
        }
      },
      child: Container(
        width: widget.size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                if (url != null) _buildImage(context, url),
                if (count != null)
                  Container(
                    width: widget.size,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30,
                          height: 10,
                        ),
                        _buildCount(context, count)
                      ],
                    ),
                  )
              ],
            ),
            Container(
              height: 42,
              padding: EdgeInsets.only(top: 3),
              child: Text(
                title,
                maxLines: 2,
                style: GpOtherTheme.size13(context)!
                    .copyWith(color: CommonColors.onSurfaceTextColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSwiperWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: widget.size,
          height: widget.size,
          child: Swiper(
            loop: true,
            autoplay: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              ResourcesItem resourcesItem = widget.item!.resources![index];
              String? url = resourcesItem.uiElement?.image?.imageUrl;
              return _buildImage(context, url!);
            },
            itemCount: widget.item!.resources!.length,
            index: index,
            onTap: (int index) {
              ResourcesItem resourcesItem = widget.item!.resources![index];
//        dispatch(HomeMusicActionCreator.onTapBannerAction(banner));
              if (widget.dispatch != null) {
                widget.dispatch!(
                    HomeMusicActionCreator.onTapRecommendItemAction(
                        resourcesItem));
              }
            },
            onIndexChanged: (int index) {
              ResourcesItem resourcesItem = widget.item!.resources![index];
              title = resourcesItem.uiElement?.mainTitle?.title ?? "";
              StringSimpleModel model = StringSimpleModel();
              model.data = title;
              eventBus.fire(model);
            },
          ),
        ),
        Container(
          height: 42,
          padding: EdgeInsets.only(top: 3),
          child: RTextAnimationWidget(
            text: title,
            size: widget.size,
          ),
        )
      ],
    );
  }

  Widget _buildImage(BuildContext context, String url) {
    return ImageItemWidget(
      url: url,
      width: widget.size,
      height: widget.size,
      needAddParam: true,
    );
  }

  ///count
  Widget _buildCount(BuildContext context, int count) {
    return PlayCountWidget(
      count: count,
    );
  }
}
