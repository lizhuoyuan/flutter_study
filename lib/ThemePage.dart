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
    //final appModel = ScopedModel.of<AppModel>(context);
    return ScopedModelDescendant<AppModel>(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(
          title: Text('主题'),
        ),
        body: Row(
          children: <Widget>[
            Text('夜间模式'),
            Switch(
                value: model.isNight,
                onChanged: (bool value) {
                  print('value:$value');
                  model.changeTheme(value);
                }),
          ],
        ),
      );
    });
  }
}
