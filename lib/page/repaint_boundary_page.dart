import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
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
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();

    setState(() {
      uint8list = pngBytes;
    });

    byte2File(pngBytes);
  }

  /// 把图片ByteData写入File
  Future<void> byte2File(Uint8List pngBytes) async {
    Directory tempDir = await getTemporaryDirectory();
    String storagePath = tempDir.path;

    File file = new File('$storagePath/截图.png');

    if (!file.existsSync()) {
      file.createSync();
    }
    file.writeAsBytesSync(pngBytes);
  }

  //path_provider 提供的方法
  Future getTemporaryDirectory() {}
}
