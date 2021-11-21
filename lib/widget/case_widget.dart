
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaseWidget extends StatefulWidget {

  // flutterUi.Image _originImage = Image.asset('images/test.jpeg');

  @override
  State<StatefulWidget> createState() => _CaseWidgetState();
}

class _CaseWidgetState extends State<CaseWidget> {

  double _width = ui.window.physicalSize.width;
  double _height = ui.window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      child: Stack(
        children: [
          _getBackgroundImage(),
          _getMainContent()
        ],
      ),
    );
  }

  /// 背景图
  Widget _getBackgroundImage() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
            alignment: Alignment.topLeft,
            child: Image(image: AssetImage('images/test.jpeg'), width: _width, height: _height, fit: BoxFit.cover)),
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                alignment: Alignment.topLeft,
                color: Colors.white.withOpacity(0.1)
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 获取主体内容
  Widget _getMainContent() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: _getContent()
        ),
        _getQrCode()
      ],
    );
  }

  /// 内容
  Widget _getContent() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30, top: 28, right: 30),
          height: 450,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        ),
        Container(
          margin: EdgeInsets.only(left: 46, top: 44, right: 46),
          height: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            image: DecorationImage(
                image: AssetImage('images/test.jpeg'),
                fit: BoxFit.cover
            )
          ),
        ),
        Container(
          margin: EdgeInsets.only(),
          child: _getInfo()
        )
      ],
    );
  }

  Widget _getInfo() {
    return Container(
      margin: EdgeInsets.only(left: 46, top: 350, right: 46),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget> [
              CircleAvatar(backgroundImage: AssetImage('images/test.jpeg'), radius: 20),
              Padding(
                padding: EdgeInsets.only(left: 4),
                child: Text(
                    '秋意造型小狮子',
                    style: TextStyle(color: Color.fromARGB(255, 40, 40, 41), fontSize: 14)
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 4),
            child: Text(
              '网红刘海2021新发型，轻盈飘逸的发丝轻让人一眼对视久久不能忘怀！',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 2, overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Text('标签一', style: TextStyle(fontSize: 12)),
              Text('标签二', style: TextStyle(fontSize: 12))
            ],
          ),
        ],
      ),
    );
  }

  /// 二维码
  Widget _getQrCode() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 16),
          child: Image(image: AssetImage('images/test.jpeg'), width: 64, height: 64, fit: BoxFit.fill,),
        ),
        Container(
          padding: EdgeInsets.only(top: 12, bottom: 28),
          child: Text('扫一扫，get同款发型', style: TextStyle(color: Colors.white, fontSize: 14)),
        ),
      ],
    );
  }
}

class DrawPainter extends CustomPainter {
  DrawPainter(this._image);

  ui.Image _image;
  Paint _paint = new Paint();

  @override
  void paint(Canvas canvas, Size size) {
    if (_image != null) {
      print("draw this Image");
      print("width =" + size.width.toString());
      print("height =" + size.height.toString());

      canvas.drawImageRect(
          _image,
          Rect.fromLTWH(
              0, 0, _image.width.toDouble(), _image.height.toDouble()),
          Rect.fromLTWH(0, 0, size.width, size.height),
          _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}