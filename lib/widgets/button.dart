import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';

class GpButton extends StatelessWidget {
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final bool isSmall;
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final Size? minimumSize;

  const GpButton(
      {required this.child,
      required this.onPressed,
      this.buttonStyle,
      this.textStyle,
      this.isSmall = false,
      this.padding,
      this.minimumSize = const Size(0, 0)});

  @override
  Widget build(BuildContext context) {
    double fontSize = isSmall ? 13 : 17;
    TextStyle buttonTextStyle =
        (textStyle ?? Theme.of(context).textTheme.button!)
            .copyWith(fontSize: fontSize);

    var finalPadding = padding ??
        (isSmall
            ? EdgeInsets.symmetric(vertical: 6, horizontal: 12)
            : EdgeInsets.symmetric(vertical: 10, horizontal: 16));
    var finalButtonStyle = buttonStyle ??
        _defaultBtnStyle(
          primary: Theme.of(context).colorScheme.primary,
          onPrimary: Theme.of(context).colorScheme.onPrimary,
        );

    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: finalButtonStyle.copyWith(
          textStyle: MaterialStateProperty.all(buttonTextStyle),
          padding: MaterialStateProperty.all(finalPadding),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all(minimumSize)),
    );
  }
}

class GPRedCornerButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final bool? isSmall;

  const GPRedCornerButton({
    required this.child,
    required this.onPressed,
    this.padding,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.button;
    return GpButton(
      child: child,
      onPressed: onPressed,
      buttonStyle: _defaultCornerBtnStyle(
          primary: Colors.red, onPrimary: CommonColors.onPrimaryTextColor),
      padding: padding,
      textStyle: textStyle,
      isSmall: isSmall!,
    );
  }
}

///矩形按钮
ButtonStyle _defaultBtnStyle(
    {required Color primary,
    required Color onPrimary,
    OutlinedBorder? shape,
    Color? disableColor,
    Color? onDisableColor}) {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return disableColor ?? CommonColors.disableColor;
        } else {
          return primary;
        }
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return onDisableColor ?? onPrimary;
        } else {
          return onPrimary;
        }
      }),
      shape: MaterialStateProperty.all(shape ??
          RoundedRectangleBorder(
            side: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          )),
      elevation: MaterialStateProperty.all(0));
}

///圆角按钮
ButtonStyle _defaultCornerBtnStyle(
    {required Color primary,
    required Color onPrimary,
    OutlinedBorder? shape,
    Color? disableColor,
    Color? onDisableColor}) {
  return _defaultBtnStyle(
      primary: primary,
      onPrimary: onPrimary,
      shape: shape ??
          RoundedRectangleBorder(
            side: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(Radius.circular(23.0)),
          ),
      disableColor: disableColor,
      onDisableColor: onDisableColor);
}
