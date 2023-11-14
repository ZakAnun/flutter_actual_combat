import 'dart:math';

import 'package:flutter/material.dart';

///
/// 上下两个半圆 Widget
///
/// @author Zak
/// @date 2023/11/14
class TwoHalfCircleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 12,
        height: 124,
        color: Colors.red,
        child: CustomPaint(
          painter: TwoHalfCirclesPainter(),
        ),
      )
    );
  }
}

class TwoHalfCirclesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    double radius = size.width / 2;

    // 上半圆
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, 0), radius: radius),
      0, // 开始角度
      pi, // 结束角度
      false,
      paint,
    );

    // 下半圆
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: radius),
      pi, // 开始角度
      pi, // 结束角度
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
