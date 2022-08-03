import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomeDrawerState state, Dispatch dispatch, ViewService viewService) {
  return displayRrawerData(state, dispatch, viewService);
}

Widget displayRrawerData(
    HomeDrawerState state, Dispatch dispatch, ViewService viewService) {
  return ListView(
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://upload.jianshu.io/users/upload_avatars/2268884/df618e28-c6d0-43b6-a7e9-80a7da48d3db.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/300/h/300/format/webp"),
                  ),
                ),
                Text(
                  "大队辅导猿",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            Center(
              child: InkWell(
                //在最外层包裹InkWell组件
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular((15.0))),
                  child: Text('编辑资料',
                      style: TextStyle(color: Colors.blue, fontSize: 14)),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: new ExactAssetImage('assets/images/toLight.jpg'),
          fit: BoxFit.fitWidth,
        )),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: state.titles
            .map((e) => ListTile(
                  title: Text(
                    e,
                    textAlign: TextAlign.left,
                  ),
                  leading: Icon(
                    state.icons[state.titles.indexOf(e)],
                    size: 22.0,
                  ),
                  onTap: () =>
                      dispatch(HomeDrawerActionCreator.onTapSegmentAction(e)),
                ))
            .toList(),
      ),
    ],
  );
}
