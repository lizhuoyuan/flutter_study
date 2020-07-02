/*
 * author: Created by 李卓原 on 2018/10/16.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  String url;

  String title = "Widget webview";
  bool isloading = false;
  FlutterWebviewPlugin flutterWebviewPlugin;

  // WebView加载状态变化监听器
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<double> _onScrollYChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: isloading
                ? CupertinoActivityIndicator()
                : IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      flutterWebviewPlugin.reload();
                    }),
          )
        ],
      ),
      body: Container(
        height: 200,
        width: 200,
        child: WebviewScaffold(
          url: url,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    url = "";
    flutterWebviewPlugin = new FlutterWebviewPlugin();

    _onScrollYChanged =
        flutterWebviewPlugin.onScrollYChanged.listen((double offsetY) {
      // latest offset value in vertical scroll
      // compare vertical scroll changes here with old value
      print('最新偏移：$offsetY');
    });

    _onStateChanged =
        flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (mounted) {
        switch (state.type) {
          case WebViewState.startLoad:
            setState(() {
              isloading = true;
            });
            break;
          case WebViewState.shouldStart:
            setState(() {
              isloading = true;
            });
            break;
          case WebViewState.finishLoad:
            setState(() {
              isloading = false;
            });
            break;
          case WebViewState.abortLoad:
            // TODO: Handle this case.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onStateChanged.cancel();
    _onScrollYChanged.cancel();
    flutterWebviewPlugin.dispose();
  }
}
