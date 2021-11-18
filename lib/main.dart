import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_actual_combat/widget/carte_widget.dart';
import 'dart:ui' as ui;

import 'package:flutter_actual_combat/widget/case_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
      body: Stack(
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  /// 截屏图片生成图片流ByteData
  // Future<ByteData> _capturePngToByteData() async {
  //   try {
  //     RenderRepaintBoundary boundary = repaintWidgetKey.currentContext
  //         .findRenderObject();
  //     if (boundary.debugNeedsPaint) {
  //       print("Waiting for boundary to be painted.");
  //       await Future.delayed(const Duration(milliseconds: 20));
  //       return _capturePngToByteData();
  //     }
  //     double dpr = ui.window.devicePixelRatio; // 获取当前设备的像素比
  //     ui.Image images = await boundary.toImage(pixelRatio: dpr);
  //     ByteData _byteData = await images.toByteData(format: ui.ImageByteFormat.png);
  //     return _byteData;
  //   } catch (e) {
  //     print(e);
  //   }
  //   return null;
  // }

  /// 把图片ByteData写入File，并触发微信分享
  // Future<Null> _shareUiImage() async {
  //
  //   ByteData sourceByteData = await _capturePngToByteData();
  //   if (sourceByteData == null) {
  //     print("v got null");
  //     return;
  //   }
  //   Uint8List sourceBytes = sourceByteData.buffer.asUint8List();
  //   Directory tempDir = await getTemporaryDirectory();
  //
  //   String storagePath = tempDir.path;
  //   File file = new File('$storagePath/报告截图.png');
  //
  //   if (!file.existsSync()) {
  //     file.createSync();
  //   }
  //   file.writeAsBytesSync(sourceBytes);
  //
  //   print("保存图片成功");
  // }
}
