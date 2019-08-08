/*
 * author: Created by 李卓原 on 2019/3/12.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_app/model/note.dart';
import 'package:flutter_app/utils/dbHelper.dart';

class SqfLite extends StatefulWidget {
  @override
  _SqfLiteState createState() => _SqfLiteState();
}

class _SqfLiteState extends State<SqfLite> {
  List notes = [];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqflite的使用'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  onPressed: _insertData,
                  child: Text('存储数据'),
                ),
                RaisedButton(
                  onPressed: getNotes,
                  child: Text('点一次取2条数据'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: _itemBuilder,
                shrinkWrap: true,
                itemCount: notes.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _insertData() async {
    var db = DatabaseHelper();
    Note todo = new Note(DateTime.now().millisecondsSinceEpoch, 'imarge', i, i,
        0.1 * i, 0.1 * i);
    i++;
    await db.saveNote(todo);

    getNotes();
  }

  void getNotes() async {
    var db = DatabaseHelper();
    var res = await db.getAllNotes(limit: 2, offset: notes.length);
    setState(() {
      notes.addAll(res);
    });
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Text('${notes[index]}');
  }
}
