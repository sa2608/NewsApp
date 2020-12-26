import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({this.blogUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
     print(widget.blogUrl);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, //puts to center
          children: [
            Text("Flutter"),
            Text("News", style: TextStyle(color: Colors.blue))
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.more_vert )
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        child: WebView(
            // initialUrl: 'https://cointelegraph.com/news/when-altseason-here-s-why-bitcoin-is-leaving-major-altcoins-like-ethereum-behind',
            initialUrl: widget.blogUrl,
            //enables javascript in webview
            javascriptMode: JavascriptMode.unrestricted,
            //enbales to select text and copy etc....
            gestureNavigationEnabled: true,
            onWebViewCreated: ((WebViewController webViewController) {
              _completer.complete(webViewController);
            }),
   
      ),
   
    ),
   
    );
  }
}
