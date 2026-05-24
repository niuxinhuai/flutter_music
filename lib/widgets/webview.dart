import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' as webview;

class WebViewWidget extends StatefulWidget {
  final String? url;
  final void Function(int)? onProgress;
  final void Function(String)? onPageFinished;

  WebViewWidget({this.url, this.onProgress, this.onPageFinished});

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  late final webview.WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        webview.WebViewController()
          ..setJavaScriptMode(webview.JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            webview.NavigationDelegate(
              onProgress: widget.onProgress,
              onPageFinished: widget.onPageFinished,
            ),
          );

    final url = widget.url;
    if (url != null && url.isNotEmpty) {
      _controller.loadRequest(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return webview.WebViewWidget(controller: _controller);
  }
}
