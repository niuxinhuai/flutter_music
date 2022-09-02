import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';

class PraisedWidget extends StatefulWidget {
  final int? count;

  PraisedWidget({this.count = 0});

  @override
  _PraisedWidgetState createState() => _PraisedWidgetState();
}

class _PraisedWidgetState extends State<PraisedWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/cm2_act_icn_praise~iphone.png"),
        Padding(
          padding: EdgeInsets.only(left: 3),
          child: Text(
            "${widget.count}",
            style: GpOtherTheme.size12(context)!
                .copyWith(color: CommonColors.textColor999),
          ),
        )
      ],
    );
  }
}
