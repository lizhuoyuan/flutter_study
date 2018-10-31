/*
 * author: Created by 李卓原 on 2018/10/30.
 * email: zhuoyuan93@gmail.com
 * rxdart 实现 主题切换
 */
import 'dart:async';

import 'package:rxdart/rxdart.dart';

class ThemeSelect {
  bool isNight = false;

  var _subject = BehaviorSubject<bool>();

  Stream<bool> get value => _subject.stream;

  void changeTheme(bool value) => _subject.add(value);

  void dispose() {
    _subject.close();
  }
}
