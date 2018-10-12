/*
 * Created by 李卓原 on 2018/10/8.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_app/model/AppModel.dart';

import 'package:scoped_model/scoped_model.dart';

class ThemePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ThemeState();
}

class ThemeState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    final appModel = AppModel.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('夜间模式'),
      ),
      body: Row(
        children: <Widget>[
          Text('夜间模式'),
          Switch(
              value: appModel.isNight,
              onChanged: (bool value) {
                print('value:$value');
                appModel.changeTheme(value);
              }),
        ],
      ),
    );
  }
}
