/*
 * author: Created by 李卓原 on 2019/2/19.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_app/widget/searchbar_delegate.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
      ),
      body: Container(
        child: RaisedButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchBarDelegate());
            },
            child: Text('去搜索')),
      ),
    );
  }
}
