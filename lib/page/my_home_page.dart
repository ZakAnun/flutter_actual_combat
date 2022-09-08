import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_actual_combat/widget/test_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  GlobalKey posterKey = GlobalKey();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: RepaintBoundary(
        key: posterKey,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.blue,
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            CaseWidget(),
            CarteWidget(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add)),
          TextButton(
            onPressed: () => _capturePoster(),
            child: Text(
              'Capture Poster',
              style: TextStyle(color: Colors.white, backgroundColor: Colors.black),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _capturePoster() async {
    try {
      /// 权限检测
      // PermissionStatus storageStatus = await Permission.storage.status;
      // if (storageStatus != PermissionStatus.granted) {
      //   storageStatus = await Permission.storage.request();
      //   if (storageStatus != PermissionStatus.granted) {
      //     print('无法存储图片，请先授权！');
      //     Map<Permission, PermissionStatus> status = await [
      //       Permission.storage
      //     ].request();
      //     print(status[Permission.storage]);
      //     return;
      //   }
      // }

      final RenderRepaintBoundary boundary = posterKey.currentContext.findRenderObject();
      if (boundary.debugNeedsPaint) {
        print('Waiting for boundary to be painted.');
        await Future<void>.delayed(const Duration(milliseconds: 20));
        return _capturePoster();
      }
      final double dpr = ui.window.devicePixelRatio; // 获取当前设备的像素比
      final ui.Image image = await boundary.toImage(pixelRatio: dpr);
      final ByteData _byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List imageBytes = _byteData.buffer.asUint8List(_byteData.offsetInBytes, _byteData.lengthInBytes);

      // final result = await ImageGallerySaver.saveImage(imageBytes);

      // if (result == null || result == '') {
      //   print('图片保存失败');
      // }
      //
      // print('result = $result, 图片保存成功');
    } catch (e) {
      print(e);
    }
  }
}
