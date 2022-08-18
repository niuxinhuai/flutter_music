import 'package:fish_redux/fish_redux.dart';

class CustomWebViewState implements Cloneable<CustomWebViewState> {
  String? url;
  int progress = 0;
  bool showProgress = true;

  @override
  CustomWebViewState clone() {
    return CustomWebViewState()
      ..url = url
      ..progress = progress
      ..showProgress = showProgress;
  }
}

CustomWebViewState initState(Map<String, dynamic>? args) {
  String url = "";
  if (args != null && args.keys.contains("url")) {
    url = args["url"];
  }
  return CustomWebViewState()..url = url;
}
