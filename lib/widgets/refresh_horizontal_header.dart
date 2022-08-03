import 'dart:async';
import 'package:flutter/material.dart'
    hide RefreshIndicatorState, RefreshIndicator;
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/cupertino.dart';

class CustomWaterDropHeader extends RefreshIndicator {
  /// refreshing content
  final Widget? refresh;

  /// complete content
  final Widget? complete;

  /// failed content
  final Widget? failed;

  /// idle Icon center in waterCircle
  final Widget idleIcon;

  /// waterDrop color,default grey
  final Color waterDropColor;

  const CustomWaterDropHeader({
    Key? key,
    this.refresh,
    this.complete,
    Duration completeDuration: const Duration(milliseconds: 600),
    this.failed,
    this.waterDropColor: Colors.grey,
    this.idleIcon: const Icon(
      Icons.autorenew,
      size: 15,
      color: Colors.white,
    ),
  }) : super(
            key: key,
            height: 60.0,
            completeDuration: completeDuration,
            refreshStyle: RefreshStyle.UnFollow);

  @override
  State<StatefulWidget> createState() {
    return _CustomWaterDropHeaderState();
  }
}

class _CustomWaterDropHeaderState
    extends RefreshIndicatorState<CustomWaterDropHeader>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _dismissCtl;

  @override
  void onOffsetChange(double offset) {
    final double realOffset =
        offset - 44.0; //55.0 mean circleHeight(24) + originH (20) in Painter
    // when readyTorefresh
    if (!_animationController.isAnimating)
      _animationController.value = realOffset;
  }

  @override
  Future<void> readyToRefresh() {
    _dismissCtl.animateTo(0.0);
    return _animationController.animateTo(0.0);
  }

  @override
  void initState() {
    _dismissCtl = AnimationController(
        vsync: this, duration: Duration(milliseconds: 400), value: 1.0);
    _animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 50.0,
        duration: Duration(milliseconds: 400));
    super.initState();
  }

  @override
  bool needReverseAll() {
    return false;
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    Widget? child;
    print('>>>>>>>>>>>mode:$mode');
    if (mode == RefreshStatus.refreshing) {
      child = widget.refresh ??
          SizedBox(
            width: 25.0,
            height: 25.0,
            child: defaultTargetPlatform == TargetPlatform.iOS
                ? const CupertinoActivityIndicator()
                : const CircularProgressIndicator(strokeWidth: 2.0),
          );
    } else if (mode == RefreshStatus.completed) {
      child = widget.complete ??
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.done,
                color: Colors.grey,
              ),
              Container(
                width: 15.0,
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  (RefreshLocalizations.of(context)?.currentLocalization ??
                          EnRefreshString())
                      .refreshCompleteText!,
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          );
    } else if (mode == RefreshStatus.failed) {
      child = widget.failed ??
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.close,
                color: Colors.grey,
              ),
              Container(
                width: 15.0,
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                    (RefreshLocalizations.of(context)?.currentLocalization ??
                            EnRefreshString())
                        .refreshFailedText!,
                    style: TextStyle(color: Colors.grey)),
              )
            ],
          );
    } else if (mode == RefreshStatus.idle || mode == RefreshStatus.canRefresh) {
      Widget widget = SizedBox(
        width: 25.0,
        height: 25.0,
        child: const CupertinoActivityIndicator(animating: false),
      );
//      if (mode == RefreshStatus.idle) {
//        return widget;
//      }
      return Row(
        children: <Widget>[
          widget,
          RotatedBox(
            quarterTurns: 1,
            child: Text("你松开我~", style: TextStyle(color: Colors.grey)),
          )
        ],
      );
    }
    return Container(
      height: 60.0,
      child: Center(
        child: child,
      ),
    );
  }

  @override
  void resetValue() {
    _animationController.reset();
    _dismissCtl.value = 1.0;
  }

  @override
  void dispose() {
    _dismissCtl.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
