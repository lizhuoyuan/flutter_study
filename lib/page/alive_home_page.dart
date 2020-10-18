/*
 * Created by 李卓原 on 2018/9/19.
 * email: zhuoyuan93@gmail.com
 * 实现原理，使用AutomaticKeepAliveClientMixin，并重写wantKeepAlive方法，让状态不被回收掉。
 */

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AliveHomePage extends StatefulWidget {
  AliveHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<AliveHomePage> with AutomaticKeepAliveClientMixin {
  int _counter = 0;
  static const String OFFICIAL_WEBSITE = 'https://www.junohoro.com/';

  @override
  bool get wantKeepAlive => true;

  void _incrementCounter() async {
    const text = 'Juno：您身邊的星座專家，占星、塔羅、合盤全都有！$OFFICIAL_WEBSITE';

    String url = "whatsapp://send?text=$text";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.button,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
