/*
 * author: Created by 李卓原 on 2019/2/1.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:path_drawing/path_drawing.dart';

class DottedLineUnderlineInputBorder extends UnderlineInputBorder {
  final double textSize; //字体大小
  final spaceWidth; //虚线间隔
  final int textLength; //数字个数
  final borderSide;
  final letterSpacing; //字体间隔

  DottedLineUnderlineInputBorder(
      {this.textSize,
      this.borderSide,
      this.spaceWidth,
      this.textLength,
      this.letterSpacing});

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection textDirection,
  }) {
    Path path = Path();
    var textWidth = calcTrueTextSize(textSize);
    var startOffset = letterSpacing / 2;
    path.moveTo(rect.bottomLeft.dx + startOffset, rect.bottomLeft.dy);
    path.lineTo(rect.bottomLeft.dx + (textWidth + spaceWidth) * textLength,
        rect.bottomRight.dy);
    path = dashPath(path,
        dashArray: CircularIntervalList<double>([
          textWidth,
          spaceWidth,
        ]));
    canvas.drawPath(path, borderSide.toPaint());
  }

  ///测量单个数字宽度
  double calcTrueTextSize(double textSize) {
    var paragraph = ui.ParagraphBuilder(ui.ParagraphStyle(fontSize: textSize))
      ..addText("0");
    var p = paragraph.build()
      ..layout(ui.ParagraphConstraints(width: double.infinity));

    return p.minIntrinsicWidth;
  }
}
