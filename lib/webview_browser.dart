import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewBrowser extends StatefulWidget {
  const WebViewBrowser(
      {Key? key, this.cookieManager, required this.title, required this.url})
      : super(key: key);

  final CookieManager? cookieManager;
  final String title;
  final String url;

  @override
  State<WebViewBrowser> createState() => _WebViewBrowserState();
}

class _WebViewBrowserState extends State<WebViewBrowser> {
  String get title => widget.title;
  String get url => widget.url;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid || Platform.isIOS) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(title),
          backgroundColor: Colors.black87,
        ),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          backgroundColor: Colors.white70,
        ),
      ),
    );
  }
}