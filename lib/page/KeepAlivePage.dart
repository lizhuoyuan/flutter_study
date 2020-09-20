/*
 * Created by 李卓原 on 2018/9/19.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_app/page/alive_home_page.dart';

class KeepAliveDemo extends StatefulWidget {
  @override
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

class _KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    print('dispose');
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
        title: Text('Keep Alive Demo'),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          AliveHomePage(
            title: 'Keep Alive demo',
          ),
          AliveHomePage(
            title: 'Keep Alive demo',
          ),
          AliveHomePage(
            title: 'Keep Alive demo',
          ),
        ],
      ),
    );
  }
}
