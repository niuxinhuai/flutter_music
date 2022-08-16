import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/page/action.dart';
import 'package:flutter_music/sections/home/widget/header.dart';
import 'package:flutter_music/sections/home/widget/item.dart';
import 'package:flutter_music/widgets/refresh_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Widget buildView(MusicItem item, Dispatch dispatch, ViewService viewService) {
  double size = MediaQuery.of(viewService.context).size.width;
  double itemSie = (size - 70) / 3.0;

  return Container(
    padding: const EdgeInsets.only(bottom: 20),
    margin: const EdgeInsets.only(bottom: 10),
    color: CommonColors.foregroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RHeaderWidget(
          item: item,
          dispatch: dispatch,
        ),
        if (item.creatives != null && item.creatives?.isNotEmpty == true)
          SizedBox(
            width: size,
            height: itemSie + 45,
            child: CustomRefreshIndicator(
              controller: item.controller,
              onLoading: () {
                Future.delayed(Duration(seconds: 3), () {
                  item.controller.loadComplete();
                  dispatch(
                      HomeMusicActionCreator.onChildItemScrollLoadingAction(
                          item));
                });
              },
              footer: _buildFooter(),
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: item.creatives!.map((e) {
                    return Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: RItemWidget(
                        item: e,
                        size: itemSie,
                        dispatch: dispatch,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
//          SingleChildScrollView(
//            scrollDirection: Axis.horizontal,
//            child: Row(
//              children: item.creatives!.map((e) {
////                int index = item.creatives!.indexOf(e);
//                return Padding(
//                  padding: EdgeInsets.only(left: 15),
//                  child: RItemWidget(
//                    item: e,
//                    size: itemSie,
//                  ),
//                );
//              }).toList(),
//            ),
//          ),
      ],
    ),
  );
}

Widget _buildFooter() {
  return CustomFooter(
    height: 30,
    builder: (BuildContext context, LoadStatus? mode) {
      Widget body = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 13,
          ),
          SizedBox(
            width: 8,
            child: Text("左滑更多",
                style: TextStyle(color: Colors.grey, fontSize: 13)),
          )
        ],
      );
      return Container(
        height: 55.0,
        width: 100,
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.only(left: 30),
        decoration: BoxDecoration(
            color: CommonColors.divider,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: body,
      );
    },
  );
}
