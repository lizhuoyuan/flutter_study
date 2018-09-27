import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/GridViewPage.dart';
import 'package:flutter_app/ImagePage.dart';
import 'package:flutter_app/KeepAlivePage.dart';
import 'package:flutter_app/MyHomePage.dart';
import 'package:flutter_app/PavlovaPage.dart';
import 'package:flutter_app/RandomWords.dart';
import 'package:flutter_app/Routes.dart';
import 'package:flutter_app/StateWidgetPage.dart';
import 'package:flutter_app/SwiperPage.dart';
import 'package:flutter_app/TextFieldAndCheckPage.dart';
import 'package:flutter_app/WrapPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = new ScreenUtil(width: 750, height: 1334);

    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
          backgroundColor: Colors.red,
          primaryColor: Colors.green,
          primarySwatch: Colors.blue,
          brightness: Brightness.light),
      home: Routes(),
      routes: <String, WidgetBuilder>{
        //静态路由,无法传参
        'route': (_) => Routes(),
        'randomWords': (_) => RandomWords(),
        'Home': (_) => MyHomePage(),
        'Pavlova': (_) => PavlovaPage(),
        'Image': (_) => ImagePage(),
        'GridView': (_) => GridViewPage(),
        'StateWidget': (_) => StateWidgetPage(),
        'TextField': (_) => TextFieldAndCheckPage(),
        'KeepAlive': (_) => KeepAliveDemo(),
        'Swiper': (_) => SwiperPage(),
        'Wrap': (_) => WrapPage(),
      },
    );
  }

  void isNum() {
    String str = '12345';
  }
}
