import 'dart:core';

import 'package:flutter/material.dart' hide Action;
import 'package:flutter_music/res/colors.dart';

class TabBarSegmentController extends StatefulWidget {
  @required
  final List<String?>? tabTitles;
  final List<Widget>? children;
  final String? navgationTitle;
  final ValueChanged<int>? onTap;
  final bool useScaffold;
  final List<Widget>? actions;
  final Color? backgroundColor;

  final bool tabBarIsScrollable;
  final int initialIndex;
  final BoxDecoration? decoration;

  TabBarSegmentController(
      {required this.tabTitles,
      required this.children,
      this.navgationTitle = '',
      this.onTap,
      this.useScaffold = true,
      this.tabBarIsScrollable = true,
      this.actions,
      this.backgroundColor,
      this.initialIndex = 0,
      this.decoration});

  @override
  _TabBarSegmentControllerState createState() =>
      _TabBarSegmentControllerState();
}

class _TabBarSegmentControllerState extends State<TabBarSegmentController>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  late bool isTap;
  int? lastIndex;

  @override
  void initState() {
    isTap = false;
    lastIndex = widget.initialIndex;
    _controller = TabController(
        length: widget.tabTitles!.length,
        vsync: this,
        initialIndex: widget.initialIndex);
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
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.useScaffold) {
      return Scaffold(
        backgroundColor: widget.backgroundColor == null
            ? CommonColors.backgroundColor
            : widget.backgroundColor,
        appBar: AppBar(
          title: Text(widget.navgationTitle ?? ''),
          bottom: widget.tabTitles!.length <= 1
              ? null
              : TabBar(
                  tabs: widget.tabTitles!
                      .map((value) => Tab(
                            text: value,
                          ))
                      .toList(),
                  controller: _controller,
                  onTap: _segmentButtonDidClick,
                  isScrollable: widget.tabBarIsScrollable,
                  indicator: widget.decoration,
                ),
          actions: widget.actions == null ? [] : widget.actions,
        ),
        body: TabBarView(
          controller: _controller,
          children: widget.children!
              .map((childWidget) => KeepAliveWidget(
                    childWidget: childWidget,
                  ))
              .toList(),
        ),
      );
    } else {
      return Column(children: [
        Container(
          color: CommonColors.foregroundColor,
          child: TabBar(
            tabs: widget.tabTitles!
                .map((value) => Tab(
                      text: value,
                    ))
                .toList(),
            controller: _controller,
            onTap: _segmentButtonDidClick,
            isScrollable: widget.tabBarIsScrollable,
            indicator: widget.decoration,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: widget.children!
                .map((childWidget) => KeepAliveWidget(
                      childWidget: childWidget,
                    ))
                .toList(),
          ),
        )
      ]);
    }
  }

  _segmentButtonDidClick(int tag) {
    isTap = true;
    if (tag != lastIndex && widget.onTap != null) {
      widget.onTap!(tag);
    }
    lastIndex = tag;
  }
}

class KeepAliveWidget extends StatefulWidget {
  final Widget? childWidget;

  KeepAliveWidget({this.childWidget});

  @override
  _KeepAliveWidgetState createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.childWidget!;
  }
}
