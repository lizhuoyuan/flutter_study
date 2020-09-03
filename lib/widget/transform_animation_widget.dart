import 'package:flutter/material.dart';

class TransformAnimationWidget extends AnimatedWidget {
  TransformAnimationWidget({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Transform.rotate(
      angle: animation.value / 10,
      child: Container(
        height: animation.value,
        width: animation.value,
        color: Colors.amber,
        child: Text('方块 '),
      ),
    );
  }
}
