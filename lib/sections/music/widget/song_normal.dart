import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';

class SongNormalWidget extends StatefulWidget {
  final double? width;
  final String? imageUrl;

  SongNormalWidget({this.width, this.imageUrl});

  @override
  _SongNormalWidgetState createState() => _SongNormalWidgetState();
}

class _SongNormalWidgetState extends State<SongNormalWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  double scale = 40.0;
  double size = 0.0;

  List<String> imageNameList = [
    "cm8_my_music_intelligent~iphone.png",
    "ad_icn_download~iphone.png",
    "cm8_nav_icn_throughtrain~iphone.png",
    "cm8_mlog_playlist_comment~iphone.png",
    "cm8_my_music_more_playlist~iphone.png"
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 10000));

    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
//        print("status is completed");
        //重置起点
        controller!.reset();
        //开启
        controller!.forward();
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
//        print("status is dismissed");
      } else if (status == AnimationStatus.forward) {
//        print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
//        print("status is reverse");
      }
    });

    ///只有歌曲播放时，旋转动画才执行
//    controller!.forward();
    if (widget.width != null) {
      size = widget.width! - scale * 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
//          color: Colors.cyan,
            child: Stack(
              children: [
                Container(
                  height: size,
                  width: size,
//                decoration: BoxDecoration(
//                    color: Colors.white.withOpacity(0.2),
//                    borderRadius:
//                        BorderRadius.all(Radius.circular(size / 2.0))),
                  margin: EdgeInsets.only(left: scale, right: scale, top: 100),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: new ExactAssetImage(
                          'assets/images/ic_play_share_listen_together_blackcover~iphone.png'),
                      fit: BoxFit.fitWidth,
                    )),
                    child: RotationTransition(
                      alignment: Alignment.center,
                      turns: controller!,
                      child: Container(
                        margin: EdgeInsets.all(50),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(110)),
                          child: Image.network(
                            widget.imageUrl ?? "",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: widget.width! / 2.0 - 20,
                  child: Container(
                    child: Image.asset(
                      'assets/images/cm7_share_card_needle~iphone.png',
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
//          color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: imageNameList
                  .map((e) => Container(
//                      color: CommonColors.randomColor,
                        child: Image.asset(
                          'assets/images/$e',
                          color: Colors.white,
                          width: 30,
                          height: 30,
                          fit: BoxFit.fitHeight,
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
