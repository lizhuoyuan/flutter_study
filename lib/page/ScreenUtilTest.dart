/*
 * Created by 李卓原 on 2018/9/29.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilTest extends StatefulWidget {
  final String title;

  const ScreenUtilTest({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<ScreenUtilTest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('设备宽度:${ScreenUtil().screenWidth}'); //设备宽度
    print('设备高度:${ScreenUtil().screenHeight}'); //设备高度
    print('设备的像素密度:${ScreenUtil().pixelRatio}'); //设备的像素密度
    print('底部安全区距离:${ScreenUtil().bottomBarHeight}'); //底部安全区距离，适用于全面屏下面有按键的
    print('状态栏高度:${ScreenUtil().statusBarHeight}px'); //状态栏高度 刘海屏会更高
    print(
        '宽度相对于设计稿放大的倍数:${ScreenUtil().scaleWidth}'); //宽度相对于设计稿放大的倍数
    print(
        '高度相对于设计稿放大的倍数:${ScreenUtil().scaleHeight}'); //高度相对于设计稿放大的倍数
    print('17px的字体:${ScreenUtil().setSp(17)}');
    print('17px的宽度:${ScreenUtil().setWidth(17)}');
    print('25px的高度：${ScreenUtil().setHeight(25)}');
    print(50.h);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 5.h,),
            Row(
              children: <Widget>[

                Container(
                  width: ScreenUtil().setWidth(375),
                  height: ScreenUtil().setHeight(200),
                  color: Colors.red,
                  child: Text(
                    '我的宽度${ScreenUtil().setWidth(375)}dp',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(375),
                  height: ScreenUtil().setHeight(200),
                  color: Colors.blue,
                  child: Text('我的宽度${ScreenUtil().setWidth(375)}dp',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Text('设备的屏幕宽度：${ScreenUtil().screenWidth}px'),
            Text('设备的屏幕高度:${ScreenUtil().screenHeight}px'),
            Text('设备的像素密度:${ScreenUtil().pixelRatio}'),
            Text('底部安全区距离:${ScreenUtil().bottomBarHeight}px'),
            Text('状态栏高度:${ScreenUtil().statusBarHeight}px'),
            Text(
              '我的大小是17px',
              style: TextStyle(fontSize: ScreenUtil().setSp(17)),
            ),
          ],
        ),
      ),
    );
  }
}
