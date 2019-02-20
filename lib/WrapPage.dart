/*
 * Created by 李卓原 on 2018/9/27.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class WrapPage extends StatelessWidget {
  final List list = ['斗破苍穹', '遮天', '斗罗大陆', '大主宰', '凡人修仙传', '盗墓笔记', '校花的贴身高手', '诛仙'];

  List<Widget> _childList(BuildContext context) {
    List<Widget> childs = [];
    /*for (int i = 0; i < list.length; i++) {
      childs.add(Text(list[i]));
    }*/
    childs.addAll(
      list.map((item) => Textbook(item)),
    );
    // list.forEach((item) => childs.add(Text(item)));
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Wrap(
          alignment: WrapAlignment.start,
          children: _childList(context),
          spacing: 10.0,
          runSpacing: 10.0,
          direction: Axis.horizontal,
          //children: list.map((item) => (Text(item))).toList(),
        ),
      ),
    );
  }
}

class Textbook extends StatelessWidget {
  final item;

  Textbook(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Fluttertoast.showToast(msg: item);
          /* Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(item),
            action: new SnackBarAction(
              label: "撤回",
              onPressed: () {},
            ),
          ));*/
        },
        child: Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.blue, width: 2.0, style: BorderStyle.solid),
            borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
          ),
          child: Text(
            item,
            style: TextStyle(fontSize: 18.0),
          ),
        ));
  }
}
