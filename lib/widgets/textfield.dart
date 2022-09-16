import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String? hintText;
  final String? text;

  final Function(String)? onSubmit;

  CustomTextFieldWidget({this.hintText, this.onSubmit, this.text});

  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  String regStr =
      "[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]";

  TextEditingController textEditingController = TextEditingController();
  bool autoFocus = false;
  @override
  void initState() {
    super.initState();
    if (widget.text != null) {
      textEditingController = TextEditingController(text: widget.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 40, maxHeight: 40),
      decoration: BoxDecoration(
        color: CommonColors.divider,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        enabled: true,
        autofocus: autoFocus,
        enableInteractiveSelection: false,
        //禁用menu
        maxLines: 1,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            hintText: widget.hintText ?? '发现更多精彩',
            hintStyle: GpOtherTheme.size13Grey(context)),
        keyboardType: TextInputType.multiline,
        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(regStr))],
        textInputAction: TextInputAction.search,
        onSubmitted: (String str) {
          print(">>>>>>>>>>>>>str:$str");
          if (widget.onSubmit != null) {
            widget.onSubmit!(str);
          }
        },
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(color: CommonColors.onSurfaceTextColor, fontSize: 15),
        controller: textEditingController,
        textCapitalization: TextCapitalization.sentences,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }
}
