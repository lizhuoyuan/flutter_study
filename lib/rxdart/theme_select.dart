/*
 * author: Created by 李卓原 on 2018/10/30.
 * email: zhuoyuan93@gmail.com
 * rxdart 实现 主题切换
 */
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSelect {
  ThemeSelect() {
    print("theme select cons");

    initTheme();
  }

  var _subject = BehaviorSubject<bool>();

  Stream<bool> get value => _subject.stream;

  Future changeTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isNight", value);

    return _subject.add(value);
  }

  void dispose() {
    _subject.close();
  }

  void initTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isNight = preferences.getBool("isNight") ?? false;
    preferences.setBool("isNight", isNight);
    _subject.add(isNight);
  }
}
