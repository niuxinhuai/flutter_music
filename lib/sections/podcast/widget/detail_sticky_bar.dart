import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';

class DetailStickyWidget extends StatefulWidget {
  final int? count;

  DetailStickyWidget({this.count});

  @override
  _DetailStickyWidgetState createState() => _DetailStickyWidgetState();
}

class _DetailStickyWidgetState extends State<DetailStickyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.only(left: 15, right: 15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 0, right: 30),
                height: 30,
                child: Text("声音"),
              ),
              Positioned(
                top: 0,
                left: 35,
                child: Text(
                  "${widget.count ?? 0}",
                  style: GpOtherTheme.size12(context)!
                      .copyWith(color: CommonColors.textColor999, fontSize: 10),
                ),
              )
            ],
          ),
          Row(
            children: [
              Image.asset(
                  "assets/images/cm8_voicelist_bold_icon_sort_desc~iphone.png"),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Image.asset(
                    "assets/images/cm8_voicelist_icon_check~iphone.png"),
              )
            ],
          )
        ],
      ),
    );
  }
}
