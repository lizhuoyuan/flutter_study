/*
 * Created by 李卓原 on 2018/9/7.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:path_drawing/path_drawing.dart';

class TextFieldAndCheckPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextFieldAndCheckPageState();
}

class TextFieldAndCheckPageState extends State<TextFieldAndCheckPage> {
  //手机号的控制器
  TextEditingController phoneController = TextEditingController();

  //密码的控制器
  TextEditingController passController = TextEditingController();

  TextEditingController _textController = TextEditingController();

  String value;

  FocusNode secondTextFieldNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      print(_textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('输入和选择'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            /* onChanged: (text) {
          value = text;
          print(value);
        },*/
            autofocus: false, //是否自动获取焦点
            controller: _textController,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.chevron_right),
              //输入框内右侧图标
              icon: Icon(Icons.person),
              //输入框左侧图标
              prefixIcon: Icon(Icons.skip_previous),
              //输入框内左侧图标
              labelText: 'labelText',
              hintText: 'hintText',
              helperText: 'helperText',
            ),
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(secondTextFieldNode),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              focusNode: secondTextFieldNode,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20.0),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.characters,
              maxLength: 5,
            ),
          ),
          verificationCode(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.print),
        onPressed: () {
          //print(value);
        },
      ),
    );
  }

  void _login() {
    print({'phone': phoneController.text, 'password': passController.text});
    if (phoneController.text.length != 11) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('手机号码格式不对'),
              ));
    } else if (passController.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('请填写密码'),
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('登录成功'),
              ));
      onTextClear();
    }
  }

  void onTextClear() {
    setState(() {
      phoneController.clear();
      passController.clear();
    });
  }

  ///验证码组件
  verificationCode() {
    var textSize = 50.0;
    var spaceWidth = 30.0;
    var letterSpacing = 30.0;
    var underLineBorder = DottedLineUnderlineInputBorder(
      spaceWidth: spaceWidth,
      textWidth: calcTrueTextSize(textSize),
      textLength: 4,
      letterSpacing: letterSpacing,
      borderSide: BorderSide(color: Colors.black26, width: 2.0),
    );
    return TextField(
      maxLength: 4,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: textSize,
        color: Colors.black87,
        letterSpacing: letterSpacing,
      ),
      decoration: InputDecoration(
        hintText: 'Please input verification code',
        hintStyle: TextStyle(fontSize: 14.0, letterSpacing: 0.0),
        enabledBorder: underLineBorder,
        focusedBorder: underLineBorder,
      ),
    );
  }

  ///测量单个数字宽度
  double calcTrueTextSize(double textSize) {
    var paragraph = ui.ParagraphBuilder(ui.ParagraphStyle(fontSize: textSize))
      ..addText("0");
    var p = paragraph.build()
      ..layout(ui.ParagraphConstraints(width: double.infinity));

    return p.minIntrinsicWidth;
  }

  Widget _form() {
    return (Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.phone),
              labelText: '请输入你的用户名)',
              helperText: '请输入注册的手机号',
            ),
            autofocus: false,
          ),
          TextField(
              controller: passController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                icon: Icon(Icons.lock),
                labelText: '请输入密码)',
              ),
              obscureText: true),
          RaisedButton(
            onPressed: _login,
            child: Text('登录'),
          ),
        ],
      ),
    ));
  }
}

class DottedLineUnderlineInputBorder extends UnderlineInputBorder {
  final double textWidth; //字体宽度
  final spaceWidth; //虚线间隔
  final int textLength; //数字个数
  final borderSide;
  final letterSpacing; //字体间隔

  DottedLineUnderlineInputBorder(
      {this.textWidth,
      this.borderSide,
      this.spaceWidth,
      this.textLength,
      this.letterSpacing});

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection textDirection,
  }) {
    Path path = Path();
    var startOffset = letterSpacing / 2;
    path.moveTo(rect.bottomLeft.dx + startOffset, rect.bottomLeft.dy);
    path.lineTo(rect.bottomLeft.dx + (textWidth + spaceWidth) * textLength,
        rect.bottomRight.dy);
    path = dashPath(path,
        dashArray: CircularIntervalList<double>([
          textWidth,
          spaceWidth,
        ]));
    canvas.drawPath(path, borderSide.toPaint());
  }
}
