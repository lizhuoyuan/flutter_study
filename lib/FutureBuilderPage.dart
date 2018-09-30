/*
 * Created by 李卓原 on 2018/9/30.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/HttpUtil.dart';

class FutureBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FutureBuilderState();
}

class FutureBuilderState extends State<FutureBuilderPage> {
  Future _gerData() async {
    var response = HttpUtil().get('http://api.douban.com/v2/movie/top250',
        data: {'start': 25, 'count': 20});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder使用'),
      ),
      body: RefreshIndicator(
        onRefresh: _gerData,
        child: FutureBuilder(
          builder: _buildFuture,
          future: _gerData(), // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
        ),
      ),
    );
  }

  ///snapshot就是_calculation在时间轴上执行过程的状态快照
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return Text('还没有开始网络请求');
      case ConnectionState.active:
      case ConnectionState.waiting:
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
    }
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List movies = snapshot.data['subjects'];
    return ListView.builder(
      itemBuilder: (context, index) =>
          _itemBuilder(context, index, movies[index]),
      itemCount: movies.length,
    );
  }

  Widget _itemBuilder(BuildContext context, int index, movie) {
    if (index.isOdd) {
      return Divider();
    }
    return ListTile(
      title: Text(movie['title']),
      leading: Text(movie['year']),
    );
  }
}
