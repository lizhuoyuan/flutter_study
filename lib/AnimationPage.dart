/*
 * Created by 李卓原 on 2018/9/27.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimationState();
}

class AnimationState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController imageAnimationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    imageAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = Tween(begin: 0.0, end: 200.0).animate(imageAnimationController)
      ..addStatusListener(_imageAnimationStatusListener);
    /*animation =
        CurvedAnimation(parent: imageAnimationController, curve: Curves.easeIn)
          ..addStatusListener(_imageAnimationStatusListener);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动画'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _startAnimation,
          child: Icon(Icons.play_arrow),
        ),
        body: Column(
          children: <Widget>[
            GrowTransition(
              animation: animation,
              child: Image.asset(
                'images/pic3.jpg',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 50.0),
            AnimationImage(
              animation: animation,
            )
          ],
        ));
  }

  @override
  void dispose() {
    imageAnimationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    imageAnimationController.forward();
  }

  void _imageAnimationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      //动画结束之后执行反向动画
      imageAnimationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      //动画恢复到初始状态后执行正向动画
      imageAnimationController.forward();
    }
  }
}

class AnimationImage extends AnimatedWidget {
  /*static final _sizeAnimation = Tween(begin: 0.0, end: 200.0);
  static final _opacityAni = Tween(begin: 0.0, end: 1.0);*/

  AnimationImage({
    Key key,
    Animation animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation animation = listenable;
    return Opacity(
      opacity: animation.value / 200,
      child: Image.asset(
        'images/pic3.jpg',
        width: animation.value,
        height: animation.value,
        fit: BoxFit.fill,
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: _animatedBuilder,
        child: child,
      ),
    );
  }

  Widget _animatedBuilder(BuildContext context, Widget child) {
    return Opacity(
      child: Container(
        child: child,
        height: animation.value,
        width: animation.value,
      ),
      opacity: animation.value / 200,
    );
  }
}
