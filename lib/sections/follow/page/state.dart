import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class MyFocusState implements Cloneable<MyFocusState> {
  String? pdfUrl;
  String? pdfFilePath;
  LoadingState? loadingState;
  List<int> list = [];
  int max = 23;
  int page = 0;
  GlobalKey<ExtendedImageGestureState> gestureKey =
      GlobalKey<ExtendedImageGestureState>();

  @override
  MyFocusState clone() {
    return MyFocusState()
      ..pdfUrl = pdfUrl
      ..pdfFilePath = pdfFilePath
      ..loadingState = loadingState
      ..list = list
      ..max = max
      ..page = page
      ..gestureKey = gestureKey;
  }
}

MyFocusState initState(Map<String, dynamic>? args) {
  return MyFocusState()
    ..pdfUrl = "https://cdn-grape.iwordnet.com/yuhang/202207/yy.pdf"
    ..loadingState = LoadingState.isLoading;
}
