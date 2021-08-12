import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

class RepaintBoundaryPage extends StatefulWidget {
  @override
  _RepaintBoundaryPageState createState() => _RepaintBoundaryPageState();
}

class _RepaintBoundaryPageState extends State<RepaintBoundaryPage> {
  GlobalKey _globalKey = GlobalKey();
  Uint8List uint8list;
  File file;

  @override
  void initState() {
    super.initState();
    //getFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete_forever),
          onPressed: deleteFile,
        ),
        appBar: AppBar(
          title: Text('屏幕/组件截图'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: share,
            )
          ],
        ),
        body: Container(
          color: Colors.grey,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('以下的东西会截图'),
                onPressed: _screenShot,
              ),
              RepaintBoundary(
                key: _globalKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '图里的文字',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Icon(
                      Icons.accessibility,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              Text('↓以下为截图的内容↓'),
              if (uint8list != null) Image.memory(uint8list),
              Text('↓下面的图片为本地保存的图片文件↓'),
              if (file?.existsSync() == true) Image.file(file),
            ],
          ),
        ));
  }

  Future<void> deleteFile() async {
    bool fileIsExist = await file.exists();
    if (fileIsExist) {
      file.deleteSync();
      setState(() {});
      print('删除图片成功:${file.existsSync()}');
    }
  }

  Future<void> _screenShot() async {
    RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
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
    await getFile();
    if (!file.existsSync()) {
      file.createSync();
      print('生成图片文件:$file');
    }
    file.writeAsBytesSync(pngBytes);
    if (file.existsSync()) {
      print('图片保存成功');
      Fluttertoast.showToast(msg: '图片保存成功');
    }
  }

  Future<void> getFile() async {
    Directory tempDir = await getTemporaryDirectory();
    file = File('${tempDir.path}/img${DateTime.now()}.png');

    setState(() {});
  }

  void share() {
    FlutterShareMe().shareToWhatsApp(imagePath: file.path, msg: 'ssss');
  }
}
