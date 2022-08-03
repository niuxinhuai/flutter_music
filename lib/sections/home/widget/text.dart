import 'package:flutter/material.dart';
import 'package:flutter_music/models/common_model.dart';
import 'package:flutter_music/models/simple_model.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';

class RTextAnimationWidget extends StatefulWidget {
  final String? text;
  final double? size;
  RTextAnimationWidget({this.text, this.size});

  @override
  _RTextAnimationWidgetState createState() => _RTextAnimationWidgetState();
}

class _RTextAnimationWidgetState extends State<RTextAnimationWidget> {
  String title = "";

  @override
  void initState() {
    super.initState();
    title = widget.text ?? "";
    eventBus.on<StringSimpleModel>().listen((event) {
      if (mounted) {
        setState(() {
          title = event.data ?? "";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      child: AnimatedSwitcher(
        child: Text(
          title,
          key: ValueKey(title),
          maxLines: 2,
          style: GpOtherTheme.size13(context)!
              .copyWith(color: CommonColors.onSurfaceTextColor),
        ),
        duration: Duration(milliseconds: 500),
        transitionBuilder: (child, anim1) {
          return ScaleTransition(child: child, scale: anim1);
        },
      ),
    );
  }
}
