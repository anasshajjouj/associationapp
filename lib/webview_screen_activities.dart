import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreenActivities extends StatefulWidget {
  final String url;

  WebViewScreenActivities({required this.url});

  @override
  _WebViewScreenActivitiesState createState() => _WebViewScreenActivitiesState();
}

class _WebViewScreenActivitiesState extends State<WebViewScreenActivities> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('انشطة الجمعية'), // AppBar title in Arabic
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(widget.url), // Convert to Uri
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true, // Enable JavaScript
          ),
        ),
      ),
    );
  }
}
