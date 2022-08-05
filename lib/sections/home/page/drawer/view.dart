import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/models/home_module.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/card.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomeDrawerState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: GpAppBar(
      backgroundColor: CommonColors.backgroundColor,
      elevation: 0,
      titleSpacing: 0,
      centerTitle: false,
      title: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildAuth(state, dispatch, viewService),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () =>
                  dispatch(HomeDrawerActionCreator.onTapQRCodeAction()),
              child: Container(
                width: 44,
                height: 44,
                child: Image.asset("assets/images/cm8_nav_icn_scan~iphone.png"),
              ),
            ),
          ],
        ),
      ),
      automaticallyImplyLeading: false,
    ),
    body: _buildBody(state, dispatch, viewService),
  );
}

Widget _buildBody(
    HomeDrawerState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildVipWidget(state, dispatch, viewService),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: state.sectionModels!
              .map((e) => _buildCardWidget(state, dispatch, viewService, e))
              .toList(),
        )
      ]),
    ),
  );
}

Widget _buildAuth(
    HomeDrawerState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () => dispatch(HomeDrawerActionCreator.onTapLoginAction()),
    child: Row(
      children: [
        Image.asset(
          "assets/images/cm8_my_music_default_avatar~iphone.png",
          width: 28,
          height: 28,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            "立即登录",
            style: GpOtherTheme.size15(viewService.context)!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        Image.asset("assets/images/cm8_profile_arrow~iphone.png"),
      ],
    ),
  );
}

Widget _buildVipWidget(
    HomeDrawerState state, Dispatch dispatch, ViewService viewService) {
  Color lineColor = Color(0xFF404040);
  Color textColor = Color(0xFFF9E5E1);
  Color detailColor = Color(0xFF847774);
  Color border = Color(0xFF887B78);

  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF323232),
              Color(0xFF383838),
              Color(0xFF3C3C3C),
            ])),
    margin: const EdgeInsets.only(top: 10, bottom: 15),
    padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "开通黑胶VIP",
                  style: GpOtherTheme.size17(viewService.context)!
                      .copyWith(color: textColor, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    "立享超21项专属特权 >",
                    style: GpOtherTheme.size13(viewService.context)!
                        .copyWith(color: detailColor),
                  ),
                )
              ],
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 4),
              decoration: BoxDecoration(
                  border: Border.all(color: border),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              child: Text(
                "会员中心",
                style: GpOtherTheme.size13(viewService.context)!
                    .copyWith(color: Color(0xFFB49F9A)),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          color: lineColor,
          width: double.infinity,
          height: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "受邀专享，黑胶VIP首月仅1元",
              style: GpOtherTheme.size13(viewService.context)!
                  .copyWith(color: detailColor),
            ),
            Container(
              width: 40,
              height: 43,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                '受邀专享',
                textAlign: TextAlign.center,
                style: GpOtherTheme.size15(viewService.context)!.copyWith(
                    color: CommonColors.onPrimaryTextColor,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget _buildCardWidget(HomeDrawerState state, Dispatch dispatch,
    ViewService viewService, DrawerSectionModel sectionModel) {
  return GpCard(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (sectionModel.title != null)
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Text(
                sectionModel.title!,
                style: GpOtherTheme.size13(viewService.context)!
                    .copyWith(color: CommonColors.textColor999),
              ),
            ),
          if (sectionModel.title != null)
            Container(
              width: double.infinity,
              height: 1,
              color: CommonColors.divider,
            ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                DrawerCellModel cellModel = sectionModel.models![index];
                String named = cellModel.imageNamed ?? "";
                String title = cellModel.title ?? "";
                return Container(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/$named"),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              title,
                              style: GpOtherTheme.size17(viewService.context),
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        "assets/images/cm8_profile_arrow~iphone.png",
                        color: CommonColors.textColor999,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  height: 1,
                  color: CommonColors.divider,
                );
              },
              itemCount: sectionModel.models!.length)
        ],
      ));
}
