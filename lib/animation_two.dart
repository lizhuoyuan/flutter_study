/*
 * author: Created by 李卓原 on 2019/2/1.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';

class AnimationTwo extends StatefulWidget {
  @override
  _AnimationTwoState createState() => _AnimationTwoState();
}

class _AnimationTwoState extends State<AnimationTwo>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: _playAnimation),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            border: Border.all(
              color: Colors.black,
            )),
        child: StaggerAnimation(controller: _animationController),
      ),
    );
  }

  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _animationController.forward().orCancel;
      //再执行反向动画
      await _animationController.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
      print(' cancel');
    }
  }
}

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  StaggerAnimation({this.controller, Key key}) : super(key: key) {
    //高度动画
    height = Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));

    //颜色
    color = ColorTween(begin: Colors.red, end: Colors.green).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));

    //左侧间距
    padding = Tween(
            begin: EdgeInsets.only(left: 0.0), end: EdgeInsets.only(left: 300))
        .animate(CurvedAnimation(
            parent: controller, curve: Interval(0.6, 1.0, curve: Curves.ease)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAni,
    );
  }

  Widget _buildAni(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
      padding: padding.value,
    );
  }
}
