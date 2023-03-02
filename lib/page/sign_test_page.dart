import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui show ImageByteFormat, Image;

import 'package:path_provider/path_provider.dart';

/// 签字测试页面
class SignTestPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SignTestPageState();
  }
}

class _SignTestPageState extends State<SignTestPage> {

  /// 标记签名画板的Key，用于截图
  GlobalKey? _globalKey;

  /// 已描绘的点
  List<Offset> _points = <Offset>[];

  /// 记录截图的本地保存路径
  String _imageLocalPath = '';
  /// 是否预览图片
  bool _isShow = false;

  @override
  void initState() {
    super.initState();
    _globalKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: <Widget> [
          Expanded(
            flex: 1,
            child: Stack(
              children: <Widget> [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1)
                  ),
                  child: RepaintBoundary(
                    key: _globalKey,
                    child: Stack(
                      children: <Widget> [
                        GestureDetector(
                          onPanUpdate: (details) => _addPoints(details),
                          // onPanEnd: (details) => _points.add(null),
                        ),
                        CustomPaint(painter: BoardPainter(_points),)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  child: Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: Text(_imageLocalPath,
                      style: TextStyle(fontSize: 8, color: Colors.white,),),
                  )
                ),
                Positioned(
                  top: 80,
                  child: Offstage(
                    offstage: !_isShow,
                    child: Container(
                      height: 180,
                      child: Image.file(
                        File(_imageLocalPath)
                      ),
                    ),
                  )
                ),
              ],
            )
          ),
          Row(
            children: <Widget> [
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('清空', style: TextStyle(color: Colors.white),),
                  ),
                  onTap: () {
                    setState(() {
                      _points.clear();
                      _points = [];
                      _imageLocalPath = '';
                    });
                  },
                )),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('保存', style: TextStyle(color: Colors.white),),
                  ),
                  onTap: () async {
                    File file = await _saveImageToFile();
                    String path = await _capturePng(file);
                    print('sign img path = $path');
                    setState(() {
                      _imageLocalPath = path;
                    });
                  },
                )
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('预览', style: TextStyle(color: Colors.white),),
                  ),
                  onTap: () async {
                    setState(() {
                      _isShow = !_isShow;
                    });
                  },
                )
              )
            ],
          )
        ],
      ),
    );
  }

  /// 绘制线条
  void _addPoints(DragUpdateDetails details) {
    RenderRepaintBoundary? referenceBox = _globalKey?.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    Offset? localPosition = referenceBox?.globalToLocal(details.globalPosition);
    double maxW = referenceBox?.size.width ?? 0;
    double maxH = referenceBox?.size.height ?? 0;
    if (localPosition == null) {
      return;
    }
    // 校验范围
    if (localPosition.dx <= 0 || localPosition.dy <= 0) {
      return;
    }
    if (localPosition.dx > maxW || localPosition.dy > maxH) {
      return;
    }
    setState(() {
      _points = List.from(_points)..add(localPosition);
    });
  }

  /// 保存图片
  Future<File> _saveImageToFile() async {
    Directory tempDir = await getTemporaryDirectory();
    int curT = DateTime.now().millisecondsSinceEpoch;
    String toFilePath = '${tempDir.path}/$curT.png';
    File toFile = File(toFilePath);
    bool exists = await toFile.exists();
    if (!exists) {
      await toFile.create(recursive: true);
    }
    return toFile;
  }

  /// 截图
  Future<String> _capturePng(File file) async {
    RenderRepaintBoundary? boundary = _globalKey?.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      return '';
    }
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? pngBytes = byteData?.buffer.asUint8List();
    if (pngBytes != null) {
      file.writeAsBytes(pngBytes);
    }
    return file.path;
  }
}

class BoardPainter extends CustomPainter {
  BoardPainter(this.points);

  final List<Offset> points;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant BoardPainter oldDelegate) => oldDelegate.points != points;

}