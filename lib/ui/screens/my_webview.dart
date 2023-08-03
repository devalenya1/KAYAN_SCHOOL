import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class MyWebView extends StatelessWidget {
  // final String title;
  // final String selectedUrl;
// late final WebViewController controller;
 // final Completer<WebViewController> _controller = Completer<WebViewController>();
class MyWebView extends StatefulWidget {
  const MyWebView({super.key});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}
class _MyWebViewState extends State<MyWebView> {
  late final WebViewController controller;
 

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('http://kayanschool.atwebpages.com/chat'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Room'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Chat Room"),
  //     ),
  //     body: WebView(
  //       initialUrl: "http://kayanschool.atwebpages.com/chat",
  //       javascriptMode: JavascriptMode.unrestricted,
  //       onWebViewCreated: (WebViewController webViewController) {
  //         _controller.complete(webViewController);
  //       },
  //     ));
  // }
}
