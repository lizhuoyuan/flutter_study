/*
 * @Author: zhuoyuan93@gmail.com
 * @Date: 2018-11-20 10:43:49
 * @LastEditors: zhuoyuan93@gmail.com
 * @LastEditTime: 2018-11-20 12:09:21
 * @Description: 
 */

import 'package:flutter/material.dart';

class DraggableDragtargets extends StatefulWidget {
  @override
  DraggableDragtargetsState createState() {
    return new DraggableDragtargetsState();
  }
}

class DraggableDragtargetsState extends State<DraggableDragtargets>
    with TickerProviderStateMixin {

  bool accept = true;
  bool accept2 = false;

  Widget _dragGableWidget() {
    return Draggable(
      child: _moveWidget('卓'),
      feedback: _moveWidget('卓'),
      childWhenDragging: _moveWidget(''),
      onDragStarted: () {
        print('drag start');
      },
      data: '卓',
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('可拖动的组件'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DragTarget(
            builder: (BuildContext context, List<String> candidateData,
                List rejectedData) {
              return accept ? _dragGableWidget() : _moveWidget('');
            },
            onWillAccept: (data) {
              print('right will accept : $data');
              if (data != '卓') return false;
              return true;
            },
            onAccept: (data) {
              setState(() {
                accept = true;
                accept2 = false;
              });
              print('accept : $data');
            },
          ),
          SizedBox(
            height: 150.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DragTarget(
                builder: (BuildContext context, List<String> candidateData,
                    List rejectedData) {
                  return _moveWidget('Left Target');
                },
                onWillAccept: (data) {
                  print('left will accept : $data');
                  if (data == '卓') return false;
                  return true;
                },
                onAccept: (data) {
                  print('accept : $data');
                },
              ),
              DragTarget(
                builder: (BuildContext context, List<String> candidateData,
                    List rejectedData) {
                  return accept2 ? _dragGableWidget() : _moveWidget('');
                },
                onWillAccept: (data) {
                  print('right will accept : $data');
                  if (data != '卓') return false;
                  return true;
                },
                onAccept: (data) {
                  setState(() {
                    accept2 = true;
                    accept = false;
                  });
                  print('accept : $data');
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _moveWidget(string) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        string,
        style: TextStyle(fontSize: 24.0, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
