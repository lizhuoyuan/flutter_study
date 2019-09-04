/*
 * Created by 李卓原 on 2018/10/8.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_app/model/AppModel.dart';
import 'package:flutter_app/rxdart/bloc_provider.dart';
import 'package:flutter_app/rxdart/theme_select.dart';

import 'package:scoped_model/scoped_model.dart';

class ThemePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ThemeState();
}

class ThemeState extends State<ThemePage> {
  ThemeSelect themeSelect;

  @override
  Widget build(BuildContext context) {
    themeSelect = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('夜间模式'),
      ),
      body: StreamBuilder(
        builder: _builder,
        stream: themeSelect.value,
        initialData: false,
      ),
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot<bool> snapshot) {
    return Row(
      children: <Widget>[
        Text('夜间模式'),
        Switch(
            value: snapshot.data,
            onChanged: (bool value) {
              print('value:$value');
              themeSelect.changeTheme(value);
            })
      ],
    );
  }
}
