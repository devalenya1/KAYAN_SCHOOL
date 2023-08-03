import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  // final String title;
  // final String selectedUrl;
late final WebViewController controller;
 // final Completer<WebViewController> _controller = Completer<WebViewController>();

  // MyWebView({
  //   @required this.title,
  //   @required this.selectedUrl,
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Room"),
      ),
      body: WebView(
        initialUrl: "http://kayanschool.atwebpages.com/chat",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ));
  }
}
