/*
 * Created by 李卓原 on 2018/9/19.
 * email: zhuoyuan93@gmail.com
 * 实现原理，使用AutomaticKeepAliveClientMixin，并重写wantKeepAlive方法，让状态不被回收掉。
 */

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


class AliveHomePage extends StatefulWidget {
  AliveHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<AliveHomePage> with AutomaticKeepAliveClientMixin{
  int _counter = 0;

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }


}