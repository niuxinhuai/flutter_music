import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/page/action.dart';
import 'package:flutter_music/sections/home/widget/image.dart';

Widget buildView(MusicItem item, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 160,
    width: double.infinity,
    child: Swiper(
      loop: true,
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        MusicBanner banner = item.getBannerInfo()!.banners![index];
        return _buildBannerItem(viewService, context, index, banner);
      },
      itemCount: item.getBannerInfo()?.banners?.length ?? 0,
      index: 0,
      onTap: (int index) {
        MusicBanner banner = item.getBannerInfo()!.banners![index];
        dispatch(HomeMusicActionCreator.onTapBannerAction(banner));
      },
      pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: CommonColors.textColor999,
              activeColor: CommonColors.onPrimaryTextColor,
              size: 6)),
    ),
  );
}

Widget _buildBannerItem(ViewService viewService, BuildContext context,
    int index, MusicBanner banner) {
  double size = MediaQuery.of(viewService.context).size.width;
  return Container(
    padding: EdgeInsets.only(left: 15, right: 15, top: 15),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ImageItemWidget(
          url: banner.pic,
          width: size - 30,
          fit: BoxFit.fill,
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0)),
                  color: banner.getBgColor()),
              child: Text(
                banner.typeTitle ?? "",
                style: GpOtherTheme.size13(context)!.copyWith(
                    color: CommonColors.onPrimaryTextColor, fontSize: 12),
              ),
            ))
      ],
    ),
  );
}
