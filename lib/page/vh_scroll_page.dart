import 'package:flutter/material.dart';

class FixedFirstColumnTable extends StatelessWidget {
  final List<List<String>> data;

  const FixedFirstColumnTable({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Container(
              width: 100,
              child: Text(
                data[index][0],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _buildCells(data[index]),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildCells(List<String> rowData) {
    List<Widget> cells = [];

    for (int i = 1; i < rowData.length; i++) {
      cells.add(
        Container(
          width: 100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(rowData[i]),
          ),
        ),
      );
    }

    return cells;
  }
}
