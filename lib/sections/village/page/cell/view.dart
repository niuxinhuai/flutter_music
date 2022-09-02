import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(String str, Dispatch dispatch, ViewService viewService) {
//  print(
//      ">>>>>>>>>>>>>>>>str:${"https://ct-test-pic.oss-cn-zhangjiakou.aliyuncs.com/img/compress/test_$str.webp"}");
//  print(
//      ">>>>>>>>>>>str:http://cdn-grape.iwordnet.com/yuhang/test20220824/第二课 1 谓语构成与时态_$str-min.png");
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Stack(
      children: [
//        CachedNetworkImage(
//          imageUrl:
//              "http://cdn-grape.iwordnet.com/yuhang/test20220824/第二课 1 谓语构成与时态_$str-min.png",
//          fit: BoxFit.fitWidth,
//        ),
        CachedNetworkImage(
//          imageUrl:
//              "https://ct-test-pic.oss-cn-zhangjiakou.aliyuncs.com/img/compress/test_$str.png",
          imageUrl:
              "https://ct-test-pic.oss-cn-zhangjiakou.aliyuncs.com/img/compress/test_$str.webp",
          fit: BoxFit.fitWidth,
        ),
        Positioned.fill(child: Text("$str")),
//        Image(
//            image: NetworkImage(
//                "http://cdn-grape.iwordnet.com/yuhang/test20220823/知米英语第十一课 长难句分析_$str-min.png")),
//        Positioned.fill(child: Text(str)),
      ],
    ),
  );
//  return Image.asset(
//    "assets/compress/知米英语第十一课 长难句分析_$str-min.png",
//    width: double.infinity,
//    fit: BoxFit.fitWidth,
//  );
}
