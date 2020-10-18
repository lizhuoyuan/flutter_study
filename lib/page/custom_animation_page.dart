/*
 * author: Created by 李卓原 on 2018/10/18.
 * email: zhuoyuan93@gmail.com
 *  自定义view
 */

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/image_util.dart';

class CustomAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomAnimationPageState();
}

class CustomAnimationPageState extends State<CustomAnimationPage> with SingleTickerProviderStateMixin {
  Animation<double> _doubleAnimation;
  AnimationController _controller;
  CurvedAnimation curvedAnimation;
  Animation<double> _progressAnimation;
  ui.Image _img;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _doubleAnimation = Tween(begin: 0.0, end: 360.0).animate(_controller);

    _progressAnimation = Tween(begin: 0.0, end: 0.6).animate(_controller);
    _controller.addListener(() {
      this.setState(() {});
    });
    onAnimationStart();
    getImage();
  }

  void getImage() async {
    _img = await ImageUtil.load('images/jay.jpg', width: 80, height: 80);
    //_img = await ImageUtil.loadImageByProvider(AssetImage('images/pic1.jpg'));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('自定义View'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              margin: EdgeInsets.all(8.0),
              child: CustomPaint(
                  child: Center(child: Text((_doubleAnimation.value / 3.6).round().toString())),
                  painter: CircleProgressBarPainter(_doubleAnimation.value)),
            ),
            Container(
              width: 100,
              height: 100,
              child: CustomPaint(
                painter: LabelViewPainter(
                  labelColor: Colors.redAccent,
                  labelAlignment: LabelAlignment.leftTop,
                  useAngle: true,
                ),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Transform.rotate(
                      angle: -3.1415926 / 4,
                      child: Text(
                        'Hot',
                        style: TextStyle(color: Colors.white),
                      ),
                      origin: Offset(100.0 / 2, 0.0),
                    )),
              ),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              margin: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                value: _progressAnimation.value,
              ),
            ),
            Container(
              width: 100,
              height: 10,
              margin: EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                value: _progressAnimation.value,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: 80,
              child: CustomPaint(
                painter: ImagePainter(_img),
                child: Text(
                  '这是绘制的图片',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  void onAnimationStart() {
    _controller.forward(from: 0.0);
  }

  @override
  void reassemble() {
    super.reassemble();
    onAnimationStart();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    ..strokeWidth = 15.0 ;//画笔的宽度
      */

  Paint _paint = new Paint()
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = 5.0
    ..style = PaintingStyle.stroke;

  ///Flutter中负责View绘制的地方，使用传递来的canvas和size即可完成对目标View的绘制
  @override
  void paint(Canvas canvas, Size size) {
    //绘制直线
    //canvas.drawLine(Offset(20.0, 20.0), Offset(120.0, 20.0), _paint);
    /*canvas.drawLine(Offset(130.0, 80.0), Offset(220.0, 100.0), _paint);
    //绘制点
    canvas.drawPoints(

        ///PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
        PointMode.lines,
        [
          Offset(20.0, 130.0),
          Offset(100.0, 210.0),
          Offset(100.0, 310.0),
          Offset(200.0, 310.0),
          Offset(200.0, 210.0),
          Offset(280.0, 130.0),
          Offset(20.0, 130.0),
        ],
        _paint..color = Colors.redAccent);*/

    //绘制圆 参数(圆心，半径，画笔)
    /* canvas.drawCircle(
        Offset(100.0, 350.0),
        30.0,
        _paint
          ..color = Colors.greenAccent
          ..style = PaintingStyle.fill //绘画风格改为stroke
        );*/

    //绘制椭圆
    //使用左上和右下角坐标来确定矩形的大小和位置,椭圆是在这个矩形之中内切的
    /* Rect rect1 = Rect.fromPoints(Offset(150.0, 200.0), Offset(300.0, 250.0));
    canvas.drawOval(rect1, _paint);
*/
    //绘制圆弧
    // Rect来确认圆弧的位置，还需要开始的弧度、结束的弧度、是否使用中心点绘制、以及paint弧度
    /*const PI = 3.1415926;
    Rect rect2 = Rect.fromCircle(center: Offset(200.0, 50.0), radius: 80.0);
    canvas.drawArc(rect2, 0.0, PI / 2, true, _paint);*/

    //用Rect构建一个边长50,中心点坐标为100,100的矩形
    /* Rect rect = Rect.fromCircle(center: Offset(100.0, 150.0), radius: 50.0);
    //根据上面的矩形,构建一个圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(50.0));
    canvas.drawRRect(rrect, _paint);*/

    //绘制两个矩形
    /*Rect rect1 = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 60.0);
    Rect rect2 = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 40.0);

    //分别绘制外部圆角矩形和内部的圆角矩形
    RRect outer = RRect.fromRectAndRadius(rect1, Radius.circular(30.0));
    RRect inner = RRect.fromRectAndRadius(rect2, Radius.circular(5.0));
    canvas.drawDRRect(outer, inner, _paint);*/

    /* path.arcTo(Rect.fromCircle(center: Offset(100.0, 100.0), radius: 80.0), 0.0,
        3.14, false);*/
    //新建了一个path,然后将路径起始点移动到坐标(100,100)的位置
    //Path path = new Path()..moveTo(100.0, 100.0);

    /* path.lineTo(200.0, 200.0);
    path.lineTo(100.0, 300.0);
    path.lineTo(150.0, 350.0);
    path.lineTo(150.0, 500.0);*/
/*    Rect rect = Rect.fromCircle(center: Offset(200.0, 200.0), radius: 60.0);

    path.arcTo(rect, 0.0, 3.14*2, true);
        canvas.drawPath(path, _paint);
    */

    /*var width = 200;
    var height = 300;
    path.moveTo(width / 2, height / 4);
    path.cubicTo((width * 6) / 7, height / 9, (width * 13) / 13,
        (height * 2) / 5, width / 2, (height * 7) / 12);
    canvas.drawPath(
        path,
        _paint
          ..style = PaintingStyle.fill
          ..color = Colors.red);

    Path path2 = new Path();
    path2.moveTo(width / 2, height / 4);
    path2.cubicTo(width / 7, height / 9, width / 21, (height * 2) / 5,
        width / 2, (height * 7) / 12);
    canvas.drawPath(path2, _paint);*/
    canvas.drawCircle(Offset(100.0, 100.0), 50.0, _paint);
    canvas.drawColor(Colors.red, BlendMode.colorDodge);
  }

  ///控制自定义View是否需要重绘的，返回false代表这个View在构建完成后不需要重绘。
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LabelViewPainter extends CustomPainter {
  Paint _paint;
  final Color labelColor;
  final int labelAlignment;
  final bool useAngle;

  LabelViewPainter({
    this.labelColor = Colors.blue,
    this.labelAlignment = LabelAlignment.leftTop,
    this.useAngle = false,
  }) {
    _paint = Paint()
      ..color = labelColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print(size);

    Path path = new Path();
    drawThisPath(size, path);
    path.close();
    canvas.drawPath(path, _paint);
  }

  void drawThisPath(
    Size size,
    Path path,
  ) {
    switch (labelAlignment) {
      case LabelAlignment.leftTop:
        if (useAngle) {
          path.moveTo(0.0, size.height / 2);
          path.lineTo(size.width / 2, 0.0);
        }
        path.lineTo(size.width, 0.0);
        path.lineTo(0.0, size.height);

        break;
      case LabelAlignment.leftBottom:
        if (useAngle) {
          path.lineTo(0.0, size.height / 2);
          path.lineTo(size.width / 2, size.height);
        }
        path.lineTo(size.width, size.height);
        path.lineTo(0.0, 0.0);
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LabelAlignment {
  int labelAlignment;

  LabelAlignment(this.labelAlignment);

  static const leftTop = 0;
  static const leftBottom = 1;
  static const rightTop = 2;
  static const rightBottom = 3;
}

class CircleProgressBarPainter extends CustomPainter {
  Paint _paintBackground;
  Paint _paintFore;
  final double pi = 3.1415926;
  var progress;

  CircleProgressBarPainter(this.progress) {
    _paintBackground = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
    _paintFore = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, _paintBackground);
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    canvas.drawArc(rect, 0.0, progress * 3.14 / 180, false, _paintFore);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ImagePainter extends CustomPainter {
  Paint _paint;
  ui.Image _img;

  ImagePainter(this._img) {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) async {
    canvas.drawImage(_img, Offset(0, 0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
