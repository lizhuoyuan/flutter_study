import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/bean/picker_data.dart';
import 'package:flutter_picker/flutter_picker.dart';

class PickerPage extends StatefulWidget {
  @override
  _PickerPageState createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  final double listSpec = 4.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String stateText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Picker'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            (stateText != null) ? Text(stateText) : Container(),
            SizedBox(height: listSpec),
            RaisedButton(
              child: Text('Picker Show Modal'),
              onPressed: showPickerModal,
            ),
            SizedBox(height: listSpec),
            RaisedButton(
              child: Text('Picker Show Datetime (Round background)'),
              onPressed: showPickerDateTimeRoundBg,
            ),
            SizedBox(height: listSpec),
          ],
        ),
      ),
    );
  }

  showPickerModal() {
    Picker(
        adapter: PickerDataAdapter<String>(pickerdata: JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        hideHeader: false,
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.adapter.text);
        }).showModal(context); //_scaffoldKey.currentState);
  }

  Widget timePicker({ThemeData themeData, bool isModal = false}) {
    return Picker(
        height: 300,
        backgroundColor: Colors.transparent,
        headerDecoration:
            BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5))),
        adapter: DateTimePickerAdapter(
          type: PickerDateTimeType.kYMDHM,
          isNumberMonth: false,
        ),
        title: Text("选择时间"),
        onConfirm: (Picker picker, List value) {
          print('confirm:${picker.adapter.text}');
          this.setState(() {
            stateText = picker.adapter.toString();
          });
        },
        onSelect: (Picker picker, int index, List<int> selecteds) {
          print('onSelect:${picker.adapter.text}');
        }).makePicker(themeData, isModal);
  }

  /// 圆角背景
  showPickerDateTimeRoundBg() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Material(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: timePicker(isModal: true),
          );
        });
  }
}
