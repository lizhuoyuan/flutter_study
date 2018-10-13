/*
 * Created by 李卓原 on 2018/10/8.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  bool _isNight = false;
  ThemeData _darkTheme = ThemeData(
      backgroundColor: Colors.black,
      primaryColor: Colors.black,
      brightness: Brightness.dark);

  ThemeData _lightTheme = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: Colors.green,
      primarySwatch: Colors.blue,
      brightness: Brightness.light);

  get theme => _isNight ? _darkTheme : _lightTheme;

  get isNight => _isNight;

  ///true为夜间模式
  void changeTheme(bool value) {
    _isNight = value;
    notifyListeners();
  }

  static AppModel of(BuildContext context) => ScopedModel.of<AppModel>(context);
}
