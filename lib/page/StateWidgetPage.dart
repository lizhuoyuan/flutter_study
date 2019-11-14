/*
   父组件管理子组件状态(控制背景色和文字)
   子组件控制自己的状态(按下和抬起的边框高亮)
 */

import 'dart:io';

import 'package:flutter/material.dart';

class StateWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateWidgetState();
  }
}

class StateWidgetState extends State<StateWidgetPage> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('state'),
      ),
      body: Container(
        child: TabBox(active: _active, onClick: _onclick),
      ),
    );
  }

  _onclick() {
    setState(() {
      _active = !_active;
    });
  }
}

class TabBox extends StatefulWidget {
  TabBox({Key key, this.active: false, @required this.onClick})
      : super(key: key);
  final bool active;
  final onClick;

  @override
  State<StatefulWidget> createState() {
    return TabBoxState();
  }
}

class TabBoxState extends State<TabBox> {
  bool _highlight = false;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      // Handle the tap events in the order that
      onTapUp: _handleTapUp,
      // they occur: down, up, tap, cancel
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,

      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
                decorationColor: Colors.yellow),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
                  color: Colors.yellow[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    _highlight = false;
  }

  void _handleTap() {
    widget.onClick();
  }

  void _handleTapCancel() {
    _highlight = false;
  }
}
