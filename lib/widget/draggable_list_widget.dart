import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


/// official demo https://github.com/flutter/flutter/blob/master/examples/api/lib/material/reorderable_list/reorderable_list_view.0.dart
/// official demo https://github.com/flutter/flutter/blob/master/examples/api/lib/material/reorderable_list/reorderable_list_view.1.dart
class DraggableListWidget<T> extends StatefulWidget {

  final List<T> dataList;

  DraggableListWidget(this.dataList, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DraggableListWidgetState();
  }
}

class _DraggableListWidgetState<T> extends State<DraggableListWidget> {

  List<T>? _items;

  @override
  void initState() {
    super.initState();
    _items = widget.dataList.cast<T>();
  }

  @override
  Widget build(BuildContext context) {

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    int len = _items?.length ?? 0;

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: <Widget>[
        for (int index = 0; index < len; index += 1)
          ListTile(
            key: Key('$index'),
            tileColor: index.isOdd ? oddItemColor : evenItemColor,
            title: Text('Item ${_items?[index]}'),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final T item = _items?.removeAt(oldIndex) as T;
          _items?.insert(newIndex, item);
        });
      },
    );
  }
}