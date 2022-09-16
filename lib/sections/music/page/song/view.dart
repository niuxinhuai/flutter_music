import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/music/widget/song_control.dart';
import 'package:flutter_music/sections/music/widget/song_lyric.dart';
import 'package:flutter_music/sections/music/widget/song_normal.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/effect.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AudioPlayerState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.white,
    child: Stack(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Image.network(
            state.imageUrl ?? "",
            fit: BoxFit.fill,
          ),
        ),
        EffectWidget(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _buildAppbar(state, dispatch, viewService),
          body: _buildBody(state, dispatch, viewService),
        )
      ],
    ),
  );
}

PreferredSizeWidget _buildAppbar(
    AudioPlayerState state, Dispatch dispatch, ViewService viewService) {
  return GpAppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: GestureDetector(
      onTap: () {
        print(">>>>>>>>>点击了");
      },
      child: UnconstrainedBox(
        child: Image.asset(
          'assets/images/cm6_search_arrow_down~iphone.png',
          color: Colors.white,
          width: 30,
          height: 30,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
    title: Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Text(
            state.name ?? "",
            softWrap: true,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GpOtherTheme.size15(viewService.context)!
                .copyWith(color: CommonColors.onPrimaryTextColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 150),
                child: Text(
                  state.singer ?? "",
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GpOtherTheme.size15(viewService.context)!
                      .copyWith(color: CommonColors.onPrimaryTextColor),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 4, right: 5, top: 1, bottom: 2),
                decoration: BoxDecoration(
                    border: Border.all(color: CommonColors.textColor999),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Text(
                  '关注',
                  style: GpOtherTheme.size13(viewService.context)!
                      .copyWith(color: CommonColors.textColor999, fontSize: 11),
                ),
              )
            ],
          )
        ],
      ),
    ),
    actions: [
      UnconstrainedBox(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
//                    color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: CommonColors.textColor999)),
          child: UnconstrainedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              child: CachedNetworkImage(
                imageUrl: state.imageUrl ?? "",
//                    fit: BoxFit.fitWidth,
                width: 30.0,
              ),
            ),
          ),
        ),
      ),
      UnconstrainedBox(
        child: Container(
//                color: Colors.red,
          margin: EdgeInsets.only(left: 10, right: 20),
          width: 30,
          child: Image.asset(
            'assets/images/cm6_set_icn_share~iphone.png',
            color: Colors.white,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    ],
  );
}

Widget _buildBody(
    AudioPlayerState state, Dispatch dispatch, ViewService viewService) {
  double width = MediaQuery.of(viewService.context).size.width;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: GestureDetector(
        onTap: () => dispatch(AudioPlayerActionCreator.didTapShowLyricAction()),
        child: state.showLyric!
            ? AudioLyricWidget(
                songLyric: state.songLyric,
              )
            : SongNormalWidget(
                imageUrl: state.imageUrl,
                width: width,
              ),
      )),
      if (state.url != null)
        AudioControl(
          url: state.url,
        )
    ],
  );
}
