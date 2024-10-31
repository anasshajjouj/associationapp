import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreenn extends StatefulWidget {
  final String url;

  WebViewScreenn({required this.url});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreenn> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('موقع الجمعية'), // AppBar title in Arabic
        backgroundColor: Colors.white,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(widget.url),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
          ),
        ),
      ),
    );
  }
}
