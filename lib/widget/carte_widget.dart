import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CarteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CarteWidgetState();
}

class _CarteWidgetState extends State<CarteWidget> {

  double _width = ui.window.physicalSize.width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: 667,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getTopContent(),
          _getBottomContent()
        ],
      ),
    );
  }

  /// 上部分内容
  Widget _getTopContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 12),
          child: Image(image: AssetImage('images/test.jpeg'), width: 238, height: 300, fit: BoxFit.cover),
        ),
        Expanded(
          flex: 1,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/test.jpeg'), width: 40, height: 40, fit: BoxFit.cover),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text('小狮子', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 40, 40, 41), fontWeight: FontWeight.bold),),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, top: 6, right: 12),
              child: Text('秋意造型南山店秋意造型南山店', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 150, 151, 153)), maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Image(image: AssetImage('images/test.jpeg'), width: 72, height: 72, fit: BoxFit.fill),
            ),
            Container(
              padding: EdgeInsets.only(top: 4),
              child: Text('扫码预约我噢', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 150, 151, 153))),
            )
          ],
        ))
      ],
    );
  }

  /// 下部分内容
  Widget _getBottomContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 12, top: 30, right: 12),
          child: Image(image: AssetImage('images/test.jpeg'), width: 86, height: 261, fit: BoxFit.fill,),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 354,
            child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7),
                itemBuilder: (BuildContext ctx, int idx) {
                  return Image(image: AssetImage('images/test.jpeg'));
                }
            ),
          )
        )
      ],
    );
  }
}