import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageUtil {
  ///通过 文件读取 Image
  static Future<ui.Image> loadImageByFile(String path) async {
    var list = await File(path).readAsBytes();
    return loadImageByUint8List(list);
  }

  ///通过ImageProvider读取Image
  static Future<ui.Image> loadImageByProvider(
    ImageProvider provider, {
    ImageConfiguration config = ImageConfiguration.empty,
  }) async {
    Completer<ui.Image> completer = Completer<ui.Image>(); //完成的回调
    ImageStreamListener listener;
    ImageStream stream = provider.resolve(config); //获取图片流
    listener = ImageStreamListener((ImageInfo frame, bool sync) {
      //监听
      final ui.Image image = frame.image;
      completer.complete(image); //完成
      stream.removeListener(listener); //移除监听
    });
    stream.addListener(listener); //添加监听
    return completer.future; //返回
  }

  /// 通过assets路径，获取资源图片
  static Future<ui.Image> load(
    String asset, {
    int width,
    int height,
  }) async {
    ByteData data = await rootBundle.load(asset);
    return loadImageByUint8List(
      data.buffer.asUint8List(),
      width: width,
      height: height,
    );
  }

  ///通过[Uint8List]获取图片
  static Future<ui.Image> loadImageByUint8List(
    Uint8List list, {
    int width,
    int height,
  }) async {
    ui.Codec codec = await ui.instantiateImageCodec(
      list,
      targetWidth: width,
      targetHeight: height,
    );
    ui.FrameInfo frame = await codec.getNextFrame();
    return frame.image;
  }
}
