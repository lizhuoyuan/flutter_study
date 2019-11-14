/*
 * author: Created by 李卓原 on 2019/3/6.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FlutterNativeWebPage extends StatefulWidget {
  @override
  _FlutterNativeWebPageState createState() => _FlutterNativeWebPageState();
}

class _FlutterNativeWebPageState extends State<FlutterNativeWebPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutterwebview'),
      ),
      body: Container(
          height:300,
          width: ScreenUtil.screenWidthDp,
          child: WebView(
            initialUrl: 'https://www.youtube.com/watch?v=GWqwOOg6IUE',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            // Remove this when collection literals makes it to stable.
            // ignore: prefer_collection_literals
            javascriptChannels: <JavascriptChannel>[
              _toasterJavascriptChannel(context),
            ].toSet(),
          )),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
