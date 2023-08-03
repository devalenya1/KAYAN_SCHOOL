import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class CommonWebviewScreen extends StatefulWidget {
  String url;
  String page_name;

  CommonWebviewScreen({Key key, this.url = "", this.page_name = ""})
      : super(key: key);

  @override
  _CommonWebviewScreenState createState() => _CommonWebviewScreenState();
}

class _CommonWebviewScreenState extends State<CommonWebviewScreen> {
  WebViewController _webViewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(

      child: Scaffold(
       // backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return SizedBox.expand(
      child: Container(
        child: WebView(
          debuggingEnabled: false,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _webViewController = controller;
            _webViewController.loadUrl(widget.url);
          },
          onWebResourceError: (error) {},
          onPageFinished: (page) {
            //print(page.toString());
          },
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
//backgroundColor: Colors.blue,
      centerTitle: true,
      leading: Builder(
       // builder: (context) => IconButton(
         // icon: Icon(Icons.arrow_back, Color.dark_grey),
          //onPressed: () => Navigator.of(context).pop(),
      // ),
      ),
      title: Text(
        "Chat Room",
        //style: TextStyle(fontSize: 16, Color.white),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }
}
