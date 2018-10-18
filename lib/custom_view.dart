/*
 * author: Created by 李卓原 on 2018/10/18.
 * email: zhuoyuan93@gmail.com
 * 
 */
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('自定义View'),
      ),
      body: Container(
        child: CustomPaint(
          painter: LinePainter(),
        ),
      ),
    ));
  }
}

///新建类继承于CustomPainter并且实现CustomPainter里面的paint（）和shouldRepaint方法
class LinePainter extends CustomPainter {
  /*Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..blendMode = BlendMode.exclusion //颜色混合模式
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    ..colorFilter = ColorFilter.mode(Colors.blueAccent,
        BlendMode.exclusion) //颜色渲染模式，一般是矩阵效果来改变的,但是flutter中只能使用颜色混合模式
    ..maskFilter =
    MaskFilter.blur(BlurStyle.inner, 3.0) //模糊遮罩效果，flutter中只有这个
    ..filterQuality = FilterQuality.high //颜色渲染模式的质量
    ..strokeWidth = 15.0 //画笔的宽度
      ;*/

  Paint _paint = new Paint()
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = 5.0;

  ///Flutter中负责View绘制的地方，使用传递来的canvas和size即可完成对目标View的绘制
  @override
  void paint(Canvas canvas, Size size) {
    //绘制直线
    canvas.drawLine(Offset(20.0, 20.0), Offset(120.0, 100.0), _paint);
    canvas.drawLine(Offset(130.0, 80.0), Offset(220.0, 100.0), _paint);
    //绘制点
    canvas.drawPoints(

        ///PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
        PointMode.polygon,
        [
          Offset(20.0, 130.0),
          Offset(100.0, 210.0),
          Offset(100.0, 310.0),
          Offset(200.0, 310.0),
          Offset(200.0, 210.0),
          Offset(280.0, 130.0),
          Offset(20.0, 130.0),
        ],
        _paint..color = Colors.redAccent);

    //绘制圆 参数(圆心，半径，画笔)
    canvas.drawCircle(
        Offset(100.0, 350.0),
        30.0,
        _paint
          ..color = Colors.greenAccent
          ..style = PaintingStyle.stroke //绘画风格改为stroke
        );

    //绘制椭圆
    //使用左上和右下角坐标来确定矩形的大小和位置,椭圆是在这个矩形之中内切的
    Rect rect1 = Rect.fromPoints(Offset(150.0, 200.0), Offset(300.0, 250.0));
    canvas.drawOval(rect1, _paint);

    //绘制圆弧
    // Rect来确认圆弧的位置，还需要开始的弧度、结束的弧度、是否使用中心点绘制、以及paint弧度
    Rect rect2 = Rect.fromCircle(center: Offset(200.0, 50.0), radius: 80.0);
    canvas.drawArc(rect2, 0.0, 0.8, false, _paint);
  }

  ///控制自定义View是否需要重绘的，返回false代表这个View在构建完成后不需要重绘。
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
