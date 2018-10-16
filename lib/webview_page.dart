/*
 * author: Created by 李卓原 on 2018/10/16.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://juejin.im/post/5bc5a56a5188255c352d88fe",
      appBar: AppBar(
        title: Text("Widget webview"),
      ),
    );
  }
}
