import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoActionSheetPage extends StatefulWidget {
  @override
  _CupertinoActionSheetPAGEState createState() =>
      _CupertinoActionSheetPAGEState();
}

class _CupertinoActionSheetPAGEState extends State<CupertinoActionSheetPage> {
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoActionSheet'),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: _showCupertinoActionSheet,
          child: Text('show'),
        ),
      ),
    );
  }

  void _showCupertinoActionSheet() async {
    var result = await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            messageScrollController: scrollController,
            title: Text('兄弟  '),
            message: Text('不能删啊'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                isDestructiveAction: true,
                onPressed: () {
                  Fluttertoast.showToast(msg: '删除了');

                  Navigator.of(context).pop('删除');
                },
                child: Text('删除'),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop('cancel');
              },
              child: Text('取消'),
            ),
          );
        });
    print(result.toString());
  }
}
