import 'package:card_swiper/card_swiper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/podcast/models/banner.dart';
import 'package:flutter_music/sections/podcast/page/podcast/action.dart';

Widget buildView(
    PodcastBannerWrap bannerWrap, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 160,
    width: double.infinity,
    child: Swiper(
      loop: true,
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        PodcastBannerItem item = bannerWrap.data![index];
        return _buildBannerItem(viewService, context, index, item);
      },
      itemCount: bannerWrap.data?.length ?? 0,
      index: 0,
      onTap: (int index) {
        PodcastBannerItem item = bannerWrap.data![index];
        dispatch(PodcastActionCreator.onTapBannerAction(item));
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
    int index, PodcastBannerItem banner) {
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
          needAddParam: true,
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
                color: Colors.blue,
              ),
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
