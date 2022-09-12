import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_actual_combat/widget/test_widget.dart';

class DragGridItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DragGridItemPageState();
  }
}

class _DragGridItemPageState extends State<DragGridItemPage> {

  final List<int> _items = List<int>.generate(10, (int index) => index);

  @override
  Widget build(BuildContext context) {

    // return DraggableListWidget(_items);

    return DraggableGridWidget(
      _items,
      childAspectRatio: 3.0, //宽高3比1
      crossAxisCount: 3, //3列
      scrollDirection: Axis.vertical, //竖向滑动
      canAccept: (oldIndex, newIndex) {
        return true;
      },
      itemBuilder: (context, data) {
        return Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Center(
                child: Text(data.toString()),
              ),
            ));
      },
    );
  }

}