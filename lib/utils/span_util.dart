import 'package:flutter/material.dart';

class CustomTextSpan {
  ///searchContent    输入的搜索内容
  ///textContent      需要显示的文字内容
  ///frontContent     需要另外添加在最前面的文字
  ///fontSize         需要显示的字体大小
  ///fontColor        需要显示的正常字体颜色
  ///selectFontColor  需要显示的搜索字体颜色
  static List<TextSpan> getSearchLightTextSpanList(String textContent,
      {String searchContent = '',
      String frontContent = '',
      int fontSize = 17,
      Color fontColor = const Color(0xff3c3c3c),
      Color selectFontColor = const Color(0xff2b78d6)}) {
    List<TextSpan> textSpanList = [];

    if (frontContent.isEmpty == false) {
      textSpanList.add(TextSpan(
          text: frontContent,
          style: TextStyle(fontSize: fontSize.toDouble(), color: fontColor)));
    }

    ///搜索内容不为空并且 显示内容中存在与搜索内容相同的文字
    if (searchContent.isNotEmpty && textContent.contains(searchContent)) {
      List<Map> _strMapList = [];
      bool _isContains = true;
      while (_isContains) {
        int startIndex = textContent.indexOf(searchContent);
        String showStr = textContent.substring(
            startIndex, startIndex + searchContent.length);
        Map _strMap;
        if (startIndex > 0) {
          String normalStr = textContent.substring(0, startIndex);
          _strMap = Map();
          _strMap['content'] = normalStr;
          _strMap['isHighlight'] = false;
          _strMapList.add(_strMap);
        }
        _strMap = Map();
        _strMap['content'] = showStr;
        _strMap['isHighlight'] = true;
        _strMapList.add(_strMap);
        textContent = textContent.substring(
            startIndex + searchContent.length, textContent.length);

        _isContains = textContent.contains(searchContent);
        if (!_isContains && textContent != '') {
          _strMap = Map();
          _strMap['content'] = textContent;
          _strMap['isHighlight'] = false;
          _strMapList.add(_strMap);
        }
      }
      _strMapList.forEach((map) {
        textSpanList.add(TextSpan(
            text: map['content'],
            style: TextStyle(
                fontSize: fontSize.toDouble(),
                color: map['isHighlight'] ? selectFontColor : fontColor,
//                letterSpacing: 2,
                height: 1.8)));
      });
    } else {
      ///正常显示所有文字
      textSpanList.add(TextSpan(
        text: textContent,
        style: TextStyle(
            fontSize: fontSize.toDouble(),
            color: fontColor,
//            letterSpacing: 2,
            height: 1.8),
      ));
    }
    return textSpanList;
  }
}
