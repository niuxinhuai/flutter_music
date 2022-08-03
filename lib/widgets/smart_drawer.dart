import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SmartDrawer extends StatelessWidget {
  final double elevation;
  final Widget? child; //设置展示内容
  final String? semanticLabel;

  ///new start
  final double? widthPercent; // 设置宽度比例
  ///new end
  const SmartDrawer({
    Key? key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,

    ///new start
    this.widthPercent = 0.7, // 默认比例
    ///new end
  })  :

        ///new start
        assert(widthPercent != null && widthPercent < 1.0 && widthPercent > 0.0)

        ///new end
        ,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String label = semanticLabel!;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        label = semanticLabel!;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        label = semanticLabel ?? MaterialLocalizations.of(context).drawerLabel;
    }

    ///获取宽度
    final double _width = MediaQuery.of(context).size.width * widthPercent!;

    ///new end
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        ///edit start
        constraints: BoxConstraints.expand(width: _width),

        ///edit end
        child: Material(
          elevation: elevation,
          child: child,
        ),
      ),
    );
  }
}
