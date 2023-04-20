import 'package:flutter/material.dart';

class FixedColumnTable extends StatelessWidget {
  final List<List<String>> data;

  const FixedColumnTable({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return usingSingleScroll(context);
    return usingCustomScroll(context);
  }

  /// 外层包裹 SingleChildScrollView
  Widget usingSingleScroll(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        children: [
          // may be update in a scroll action
          Material(
            elevation: AppBarTheme.of(context).scrolledUnderElevation ?? 6,
            shadowColor: AppBarTheme.of(context).shadowColor,
            shape: AppBarTheme.of(context).shape,
            child: FixedColumn(
              data: data,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: DataTable(
                columns: _buildColumns(),
                rows: _buildRows(),
                dividerThickness: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 外层包裹 CustomScrollView
  Widget usingCustomScroll(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget> [
        SliverToBoxAdapter(
          child: Row(
            children: [
              // may be update in a scroll action
              Material(
                elevation: AppBarTheme.of(context).scrolledUnderElevation ?? 6,
                shadowColor: AppBarTheme.of(context).shadowColor,
                shape: AppBarTheme.of(context).shape,
                child: FixedColumn(
                  data: data,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: DataTable(
                    columns: _buildColumns(),
                    rows: _buildRows(),
                    dividerThickness: 0,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
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
        dividerThickness: 0,
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

// class FixedColumnDataTable extends StatelessWidget {
//   final List<DataRow> rows;
//   final List<DataColumn> columns;
//
//   const FixedColumnDataTable({
//     Key? key,
//     required this.rows,
//     required this.columns,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Column(
//         children: [
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: SizedBox(
//               width: _calculateTableWidth(),
//               child: DataTable(
//                 columns: _buildFixedColumns(),
//                 rows: rows,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: _calculateTableRowHeight(),
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: rows.length,
//               itemBuilder: (context, index) {
//                 return SizedBox(
//                   height: _calculateTableRowHeight(),
//                   child: DataTable(
//                     columns: _buildScrollableColumns(),
//                     rows: [rows[index]],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<DataColumn> _buildFixedColumns() {
//     return [columns.first];
//   }
//
//   List<DataColumn> _buildScrollableColumns() {
//     return List<DataColumn>.from(columns)..removeAt(0);
//   }
//
//   double _calculateTableWidth() {
//     return columns.fold<double>(0, (acc, column) => acc + column.width!);
//   }
//
//   double _calculateTableRowHeight() {
//     return kMinInteractiveDimension;
//   }
// }
