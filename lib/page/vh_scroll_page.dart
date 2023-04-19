import 'package:flutter/material.dart';

class FixedColumnTable extends StatelessWidget {
  final List<List<String>> data;

  const FixedColumnTable({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        children: [
          FixedColumn(
            data: data,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: _buildColumns(),
                rows: _buildRows(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    List<DataColumn> columns = [];

    for (int i = 1; i <= 4; i++) {
      columns.add(
        DataColumn(
          label: Text(
            'Column $i',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return columns;
  }

  List<DataRow> _buildRows() {
    List<DataRow> rows = [];

    for (int i = 0; i < data.length; i++) {
      List<String> rowData = data[i];
      List<DataCell> cells = [];

      for (int j = 1; j <= 4; j++) {
        cells.add(
          DataCell(
            Text(rowData[j]),
          ),
        );
      }

      rows.add(
        DataRow(cells: cells),
      );
    }

    return rows;
  }
}

class FixedColumn extends StatelessWidget {
  final List<List<String>> data;

  const FixedColumn({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('First Column')
          )
        ],
        rows: _buildCells(),
      ),
    );
  }

  List<DataRow> _buildCells() {
    List<DataRow> cells = [];

    for (int i = 0; i < data.length; i++) {
      cells.add(
        DataRow(cells: [
          DataCell(Text(
            data[i][0],
            style: TextStyle(fontWeight: FontWeight.bold),
          ))
        ]),
      );
    }

    return cells;
  }
}

// class FixedHeaderTable extends StatefulWidget {
//   final List<List<String>> data;
//   final List<String> headers;
//
//   FixedHeaderTable({required this.data, required this.headers});
//
//   @override
//   _FixedHeaderTableState createState() => _FixedHeaderTableState();
// }
//
// class _FixedHeaderTableState extends State<FixedHeaderTable> {
//   final double _rowHeight = 48;
//   final double _cellWidth = 96;
//   final double _headerHeight = 56;
//   final double _fixedColumnWidth = 96;
//   final double _scrollableColumnsWidth = 384;
//   final ScrollController _verticalScrollController = ScrollController();
//   final ScrollController _horizontalScrollController = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       controller: _verticalScrollController,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         controller: _horizontalScrollController,
//         child: SizedBox(
//           width: _fixedColumnWidth +
//               (_cellWidth * widget.headers.length - _fixedColumnWidth),
//           child: DataTable(
//             columnSpacing: 0,
//             dividerThickness: 0,
//             dataRowHeight: _rowHeight,
//             headingRowHeight: _headerHeight,
//             columns: [
//               DataColumn(
//                 label: SizedBox(
//                   width: _fixedColumnWidth,
//                   child: Center(child: Text(widget.headers[0])),
//                 ),
//                 numeric: false,
//                 onSort: null,
//               ),
//               ...List.generate(
//                 widget.headers.length - 1,
//                     (index) => DataColumn(
//                   label: SizedBox(
//                       width: _cellWidth,
//                       child: Center(child: Text(widget.headers[index + 1]))),
//                   numeric: false,
//                   onSort: null,
//                 ),
//               ),
//             ],
//             rows: List.generate(
//               widget.data.length,
//                   (rowIndex) => DataRow(
//                 cells: [
//                   DataCell(
//                     SizedBox(
//                       width: _fixedColumnWidth,
//                       child: Center(child: Text(widget.data[rowIndex][0])),
//                     ),
//                   ),
//                   ...List.generate(
//                     widget.headers.length - 1,
//                         (cellIndex) => DataCell(
//                       SizedBox(
//                         width: _cellWidth,
//                         child:
//                         Center(child: Text(widget.data[rowIndex][cellIndex + 1])),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
