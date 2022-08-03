import 'package:flutter/material.dart' hide Action;
import 'package:flutter_music/widgets/appbar.dart';

///加载失败显示error页面，可点击重新加载

class GpErrorWidget extends StatelessWidget {
  final Widget? errorWidget;
  final VoidCallback? onTap;
  final bool showBackOnError;

  const GpErrorWidget(
      {this.errorWidget, this.onTap, this.showBackOnError = false});

  @override
  Widget build(BuildContext context) {
    Widget content = GestureDetector(
      onTap: onTap, behavior: HitTestBehavior.opaque, //需要设置，不然点击范围会变小
      child: errorWidget ??
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/girl_cry.png',
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('哎呀，程序出错了\n点击屏幕重新加载'),
                  ),
                ]),
          ),
    );
    if (showBackOnError) {
      return Scaffold(
        appBar: GpAppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
        ),
        body: content,
      );
    } else {
      return content;
    }
  }
}
