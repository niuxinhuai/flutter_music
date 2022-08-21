import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/widgets/segment.dart';

class CatelistSegmentWidget extends StatefulWidget {
  final List<String>? titles;
  final List<Widget>? widgets;
  final int? initialIndex;
  final ValueChanged<int>? onTap;

  CatelistSegmentWidget(
      {this.titles, this.widgets, this.initialIndex = 0, this.onTap});

  @override
  _CatelistSegmentWidgetState createState() => _CatelistSegmentWidgetState();
}

class _CatelistSegmentWidgetState extends State<CatelistSegmentWidget>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  late bool isTap;
  int? lastIndex;

  @override
  void initState() {
    isTap = false;
    lastIndex = widget.initialIndex;
    _controller = TabController(
        length: widget.titles!.length,
        vsync: this,
        initialIndex: widget.initialIndex!);
    _controller!.addListener(() {
      if (_controller!.index.toDouble() == _controller!.animation!.value) {
        if (isTap) {
          isTap = false;
        } else {
          if (_controller!.index != lastIndex && widget.onTap != null) {
            widget.onTap!(_controller!.index);
          }
          lastIndex = _controller!.index;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        height: 30,
        child: TabBar(
          padding: EdgeInsets.only(left: 15, right: 15),
          tabs: widget.titles!
              .map((value) => Tab(
                    text: value,
                  ))
              .toList(),
          controller: _controller,
          onTap: _segmentButtonDidClick,
          isScrollable: true,
          labelColor: CommonColors.onPrimaryTextColor,
          labelStyle: GpOtherTheme.size15(context)!
              .copyWith(fontWeight: FontWeight.bold),
          unselectedLabelColor: CommonColors.onSurfaceTextColor,
          unselectedLabelStyle: GpOtherTheme.size15(context)!
              .copyWith(fontWeight: FontWeight.bold),
          indicator: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            color: Colors.red,
          ),
        ),
      ),
      Expanded(
        child: TabBarView(
          controller: _controller,
          children: widget.widgets!
              .map((childWidget) => KeepAliveWidget(
                    childWidget: childWidget,
                  ))
              .toList(),
        ),
      )
    ]);
  }

  _segmentButtonDidClick(int tag) {
    isTap = true;
    if (tag != lastIndex && widget.onTap != null) {
      widget.onTap!(tag);
    }
    lastIndex = tag;
  }
}
