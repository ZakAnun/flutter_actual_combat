
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 遮盖浮层测试
class TestOverlayEntity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestOverlayEntityState();
}

class _TestOverlayEntityState extends State<TestOverlayEntity> {
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          child: CupertinoTextField(placeholder: '其他内容000', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.red,
          width: double.infinity,
          child: Text('其他内容123', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.blue,
          width: double.infinity,
          child: Text('其他内容456', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.green,
          width: double.infinity,
          child: Text('其他内容789', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.yellow,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // 创建一个悬浮按钮的 OverlayEntry
            _overlayEntry = OverlayEntry(
              builder: (context) => Positioned(
                top: 120.0, // 控制位置
                left: 160.0,
                child: FloatingActionButton(
                  onPressed: () {
                    // 点击悬浮按钮时执行的操作
                    _overlayEntry!.remove(); // 移除 OverlayEntry
                  },
                  child: Icon(Icons.add),
                ),
              ),
            );

            // 在 Overlay 中插入 OverlayEntry
            Overlay.of(context).insert(_overlayEntry!);
          },
          child: Text('显示悬浮按钮'),
        ),
      ],
    );
  }
}