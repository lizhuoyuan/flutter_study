/*
 * Created by 李卓原 on 2018/10/9.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';

class ExpansionTilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExpandsionState();
}

class ExpandsionState extends State<ExpansionTilePage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  var _iconColor;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animation = Tween(begin: 0.0, end: 0.125).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ExpansionTile'),
        ),
        body: Builder(builder: (BuildContext context) {
          return ExpansionTile(
            title: Text('title'),
            leading: Icon(Icons.title),
            trailing: RotationTransition(
              turns: animation,
              child: Icon(
                Icons.add,
                color: _iconColor,
              ),
            ),
            onExpansionChanged: (bool value) {
              print(value);
              setState(() {
                if (value) {
                  animationController.forward();
                  _iconColor = Colors.red;
                } else {
                  animationController.reverse();
                  _iconColor = Colors.green;
                }
              });
            },
            children: <Widget>[
              ListTile(
                title: Text('1'),
                leading: Icon(Icons.map),
              )
            ],
          );
        }));
  }
}
