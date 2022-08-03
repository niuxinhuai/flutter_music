import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget {
  final String? url;
  final PageLoadingCallback? onProgress;
  final PageFinishedCallback? onPageFinished;

  WebViewWidget({this.url, this.onProgress, this.onPageFinished});

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
      onProgress: widget.onProgress,
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: widget.onPageFinished,
    );
  }
}
