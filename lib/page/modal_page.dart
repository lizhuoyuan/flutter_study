import 'package:flutter/material.dart';

class ModalPage extends StatefulWidget {
  @override
  _ModalPageState createState() => _ModalPageState();
}

class _ModalPageState extends State<ModalPage> {
  String fileContent;

  String timeZone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹窗'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('show bottom sheet'),
            onPressed: _showBottom,
          )
        ],
      ),
    );
  }

  Future<void> _showBottom() async {
    var res = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Colors.blue,
          width: 5
        ),
      ),
      builder: (context) => Container(
        height: 400,
        child: Column(
          children: [
            Text('top'),
            RaisedButton(
              child: Text('pop pop'),
              onPressed: () {
                Navigator.of(context).pop('pop');
              },
            ),
            SizedBox(
              height: 300,
            ),
            Text('bottom')
          ],
        ),
      ),
    );
    tt(res, (result, index) => {print(result)});
  }

  void tt(String s, MyFun f) {
    f(s, 1);
  }
}

typedef MyFun = Function(String result, int index);
