/*
 * author: Created by 李卓原 on 2018/10/16.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String url = "https://juejin.im/post/5bc5a56a5188255c352d88fe";

class WebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  String title = "Widget webview";
  bool isloading = false;
  FlutterWebviewPlugin flutterWebviewPlugin;

  // WebView加载状态变化监听器
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<double> _onScrollYChanged;
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
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
    );
  }

  @override
  void initState() {
    super.initState();
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
        /* setState(() {
          isloading =
              '${state.type}' == 'WebViewState.finishLoad' ? false : true;
        });*/
        //Fluttertoast.showToast(msg: '$isloading');
        //print('${state.type}');
        switch ('${state.type}') {
          case 'WebViewState.startLoad':
            setState(() {
              isloading = true;
            });
            break;
          case 'WebViewState.shouldStart':
            setState(() {
              isloading = true;
            });
            break;
          case 'WebViewState.finishLoad':
            setState(() {
              isloading = false;
            });
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
