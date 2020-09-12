/*
 * author: Created by 李卓原 on 2019/2/1.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'dart:math';

import 'package:flutter/material.dart';

class AnimationTwo extends StatefulWidget {
  @override
  _AnimationTwoState createState() => _AnimationTwoState();
}

class _AnimationTwoState extends State<AnimationTwo> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _rotateController;
  Animation<num> animation;
  bool isAnimating = false;
  double alreadyChoose = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));

    _rotateController = AnimationController(vsync: this, duration: Duration(seconds: 12));

    animation = Tween(begin: 0.0, end: 2 * pi).animate(_rotateController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _whirlAnimation();
          _playAnimation();
        },
        child: Icon(isAnimating ? Icons.stop : Icons.play_arrow),
      ),
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.black,
        )),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
            ),
            //Container(height: 300,color: Colors.green,),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  ConstellationAnimationWidget(
                    animation: animation,
                    alreadyChoose: alreadyChoose,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 300,
                  child: StaggerAnimation(controller: _animationController)),
            ),
          ],
        ),
        // child: StaggerAnimation(controller: _animationController),
      ),
    );
  }

  Future<Null> _whirlAnimation() async {
    try {
      if (_rotateController.isAnimating) {
        _rotateController?.stop(canceled: false);

        _rotateController.stop(canceled: false);
        setState(() {
          alreadyChoose = 1;
          isAnimating = false;
        });
        print('转到新位置');
        return;
      }
      print('执行动画');
      //先正向执行动画
      setState(() {
        isAnimating = true;
        alreadyChoose = 0;
      });
      await _rotateController?.repeat();
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
      print('动画被取消了');
    }
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

  @override
  void dispose() {
    _animationController?.dispose();
    _rotateController?.dispose();
    super.dispose();
  }
}

class ConstellationAnimationWidget extends AnimatedWidget {
  final double alreadyChoose;

  ConstellationAnimationWidget({Key key, Animation animation, this.alreadyChoose})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return Container(
      color: Colors.amber,
      width: 400,
      height: 100,
      child: OverflowBox(
        alignment: Alignment.topCenter,
        maxWidth: 500,
        maxHeight: 500,
        child: Transform.rotate(
          angle: alreadyChoose == 0 ? animation.value : alreadyChoose,
          child: Image.asset('images/timg.jpg'),
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  StaggerAnimation({this.controller, Key key}) : super(key: key) {
    //高度动画
    height = Tween(begin: 0.0, end: 300.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));

    //颜色
    color = ColorTween(begin: Colors.red, end: Colors.green).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));

    //左侧间距
    padding = Tween(begin: EdgeInsets.only(left: 0.0), end: EdgeInsets.only(left: 300)).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.6, 1.0, curve: Curves.ease)));
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
