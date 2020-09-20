import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExtensionPage extends StatefulWidget {
  @override
  _ExtensionPagState createState() => _ExtensionPagState();
}

class _ExtensionPagState extends State<ExtensionPage> {
  bool isShowBlur = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('扩展函数'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () => setState(() {
                  isShowBlur = !isShowBlur;
                }),
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '模糊',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Image.asset(
              'images/pavlova.png',
              width: ScreenUtil.screenWidth,
              height: ScreenUtil.screenHeight,
            ),
            if (isShowBlur)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Center(
                  child: InkWell(
                    onTap: _onTap,
                    child: Container(
                      color: Colors.blue,
                      child: Text(
                        '显示',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ).click(() {
                    print('extension');
                    setState(() {
                      isShowBlur = !isShowBlur;
                    });
                  }),
                ),
              ),
          ],
        ));
  }

  void _onTap() {
    print('on tap');
  }
}

extension Ink on InkWell {
  InkWell click(Function f) {
    return InkWell(
      child: child,
      onTap: () {
        f();
      },
    );
  }
}
