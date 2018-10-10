/*
 * Created by 李卓原 on 2018/9/30.
 * email: zhuoyuan93@gmail.com
 * 关于状态改变引起的不必要的页面刷新：https://github.com/flutter/flutter/issues/11426#issuecomment-414047398
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/HttpUtil.dart';

class FutureBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FutureBuilderState();
}

class FutureBuilderState extends State<FutureBuilderPage> {
  String title = 'FutureBuilder使用';
  var _futureBuilderFuture;

  Future _gerData() async {
    var response = HttpUtil()
        .get('http://api.douban.com/v2/movie/top250', data: {'count': 15});
    return response;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///用_futureBuilderFuture来保存_gerData()的结果，以避免不必要的ui重绘
    _futureBuilderFuture = _gerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            title = title + '.';
          });
        },
        child: Icon(Icons.title),
      ),
      body: RefreshIndicator(
        onRefresh: _gerData,
        child: FutureBuilder(
          builder: _buildFuture,
          future:
              _futureBuilderFuture, // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
        ),
      ),
    );
  }

  ///snapshot就是_calculation在时间轴上执行过程的状态快照
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return Text('还没有开始网络请求');
    }
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List movies = snapshot.data['subjects'];
    return ListView.builder(
      itemBuilder: (context, index) => _itemBuilder(context, index, movies),
      itemCount: movies.length * 2,
    );
  }

  Widget _itemBuilder(BuildContext context, int index, movies) {
    if (index.isOdd) {
      return Divider();
    }
    index = index ~/ 2;
    return ListTile(
      title: Text(movies[index]['title']),
      leading: Text(movies[index]['year']),
      trailing: Text(movies[index]['original_title']),
    );
  }
}
