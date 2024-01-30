import 'package:flutter/material.dart';

///
/// 测试多列 DataTable
///
/// @author liminglin
/// @date 2024/1/30
class TestDtColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dividerThickness: 0.5,
        columns: [
          DataColumn(label: Text('Column 1')),
          DataColumn(label: Column(
            children: <Widget>[
              Expanded(child: Center(child: Text('Column 2'))),
              Expanded(
                child: Center(
                  child: Row(
                    children: <Widget> [
                      SizedBox(width: 120, child: Center(child: Text('Sub Column 2'))),
                      SizedBox(width: 120, child: Center(child: Text('Sub Column 2'))),
                      SizedBox(width: 120, child: Center(child: Text('Sub Column 2')))
                    ],
                  ),
                ),
              )
            ],
          )),
          DataColumn(label: Text('Column 3')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Center(child: Text('R 1, C 1'))),
            // Create a custom DataCell for the column with sub columns
            DataCell(
              Row(
                children: [
                  Expanded(child: Center(child: Text('Sub 1-1'))),
                  Expanded(child: Center(child: Text('Sub 2-1'))),
                  Expanded(child: Center(child: Text('Sub 3-1'))),
                ],
              ),
            ),
            DataCell(Center(child: Text('R 1, C 3'))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text('R 2, C 1'))),
            // Create a custom DataCell for the column with sub columns
            DataCell(
              Row(
                children: [
                  Expanded(child: Center(child: Text('Sub 1-2'))),
                  Expanded(child: Center(child: Text('Sub 2-2'))),
                  Expanded(child: Center(child: Text('Sub 3-2'))),
                ],
              ),
            ),
            DataCell(Center(child: Text('R 2, C 3'))),
          ]),
          // Add more rows as needed
        ],
      ),
    );
  }

}