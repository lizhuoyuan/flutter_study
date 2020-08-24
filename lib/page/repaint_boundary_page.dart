import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RepaintBoundaryPage extends StatefulWidget {
  @override
  _RepaintBoundaryPageState createState() => _RepaintBoundaryPageState();
}

class _RepaintBoundaryPageState extends State<RepaintBoundaryPage> {
  GlobalKey _globalKey = GlobalKey();
  Uint8List uint8list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('屏幕/组件截图'),
        ),
        body: Column(
          children: [
            RaisedButton(
              child: Text('以下的东西会截图'),
              onPressed: _screenShot,
            ),
            RepaintBoundary(
              key: _globalKey,
              child: Row(
                children: [
                  Text('图里的文字'),
                  Icon(Icons.accessibility),
                ],
              ),
            ),
            Text('以下为截图的内容'),
            if (uint8list != null) Image.memory(uint8list),
          ],
        ));
  }

  Future<void> _screenShot() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    var image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    print(pngBytes);
    setState(() {
      uint8list = pngBytes;
    });
  }
}
