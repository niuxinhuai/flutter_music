import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart' hide Action;

/// 通用 Loading 页面
class Loading extends StatelessWidget {
  final double? strokeWidth;
  final Color? color;
  final String? text;
  final bool showModal;

  const Loading(
      {this.strokeWidth,
      this.color,
      this.text = '加载中...',
      this.showModal = false});

  @override
  Widget build(BuildContext context) {
    Widget content = text == null
        ? CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation(color ?? Theme.of(context).primaryColor),
            strokeWidth: strokeWidth ?? 4.0,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                    color ?? Theme.of(context).primaryColor),
                strokeWidth: strokeWidth ?? 4.0,
              ),
              if (text != null)
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(text!),
                )
            ],
          );

    if (showModal) {
      return Builder(
        builder: (context) => Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.8,
              child: ModalBarrier(
                color: Colors.black54,
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(color: Theme.of(context).dividerColor)),
                padding: EdgeInsets.all(20),
                child: content,
              ),
            )
          ],
        ),
      );
    } else {
      return Builder(
        builder: (context) => Center(
          child: content,
        ),
      );
    }
  }
}
