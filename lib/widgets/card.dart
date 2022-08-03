import 'package:flutter/material.dart';

class GpCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxDecoration? decoration;

  const GpCard(
      {required this.child,
      this.padding,
      this.margin,
      this.width,
      this.height,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: decoration ??
            BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      offset: Offset(0, 2),
                      blurRadius: 6.0)
                ],
                borderRadius: BorderRadius.circular(6)),
        padding: padding ?? EdgeInsets.zero,
        margin: margin ?? EdgeInsets.zero,
        child: child);
  }
}
