import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  GlobalKey repaintWidgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return RepaintBoundary(
      key: repaintWidgetKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Icon(Icons.bathtub_sharp),
              InkWell(
                child: Text("Capture Screen and ready to share"),
                onTap: () {
                  _shareUiImage();
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  /// 截屏图片生成图片流ByteData
  Future<ByteData> _capturePngToByteData() async {
    try {
      RenderRepaintBoundary boundary = repaintWidgetKey.currentContext
          .findRenderObject();
      if (boundary.debugNeedsPaint) {
        print("Waiting for boundary to be painted.");
        await Future.delayed(const Duration(milliseconds: 20));
        return _capturePngToByteData();
      }
      double dpr = ui.window.devicePixelRatio; // 获取当前设备的像素比
      ui.Image image = await boundary.toImage(pixelRatio: dpr);
      ByteData _byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return _byteData;
    } catch (e) {
      print(e);
    }
    return null;
  }

  /// 把图片ByteData写入File，并触发微信分享
  Future<Null> _shareUiImage() async {

    ByteData sourceByteData = await _capturePngToByteData();
    if (sourceByteData == null) {
      print("v got null");
      return;
    }
    Uint8List sourceBytes = sourceByteData.buffer.asUint8List();
    Directory tempDir = await getTemporaryDirectory();

    String storagePath = tempDir.path;
    File file = new File('$storagePath/报告截图.png');

    if (!file.existsSync()) {
      file.createSync();
    }
    file.writeAsBytesSync(sourceBytes);

    print("保存图片成功");
  }
}
