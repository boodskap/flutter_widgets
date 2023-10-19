library row_layout;

import 'package:flutter/material.dart';

typedef GetRowWidgetAt = Widget Function(int row, int col);
typedef GetRowAlignmentAt = Alignment Function(int row, int col);

/// A simple layout where you can specify the number of rows and then columns in each rows
///
/// Very complex layouts can be acheived by combinations of RowLayout and [ColumnLayout](https://boodskap.io)
//ignore: must_be_immutable
class RowLayout extends StatefulWidget {
  ///
  /// **rows** the number of rows this layout should have
  ///
  /// **cols** the number of columns each row should have, the size of the array should match the **rows**
  ///
  /// **rowFlex** the height percentage of each row should have,  the size of the array should match the **rows**
  ///
  /// **colFlex** the width percentage of each column should have,  the size of the map should match the **rows** and the size of the array should match the **cols** in that row
  ///
  /// **getRowWidgetAt** A callback method to dynamically render the widget at (row, col) cell
  ///
  /// **getRowAlignmentAt**
  ///
  /// **padding** Example: const EdgeInsets.all(10.0), default is const EdgeInsets.all(0.0)
  ///
  /// **background** Example: Colors.read, default is Colors.white
  ///
  RowLayout({
    super.key,
    required this.rows,
    required this.cols,
    required this.rowFlex,
    required this.colFlex,
    required this.getRowWidgetAt,
    required this.getRowAlignmentAt,
    this.padding = const EdgeInsets.all(0.0),
    this.background = Colors.white,
    this.decoration = const BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black))),
  });

  final int rows;
  final List<int> cols;
  final List<int> rowFlex;
  final Map<int, List<int>> colFlex;
  final GetRowWidgetAt getRowWidgetAt;
  final GetRowAlignmentAt getRowAlignmentAt;
  Color? background;
  EdgeInsetsGeometry? padding;
  Decoration? decoration;

  @override
  State<RowLayout> createState() => _RowLayoutState();
}

/// Internal state of the widget
class _RowLayoutState extends State<RowLayout> {
  Widget _createPlacement(int row, int col, int flex, Widget child) {
    return Expanded(
      flex: flex,
      child: Stack(
        children: [
          Padding(
            padding: widget.padding!,
            child: Container(
              decoration: widget.decoration,
              height: MediaQuery.of(context).size.height,
              alignment: widget.getRowAlignmentAt(row, col),
              child: widget.getRowWidgetAt(row, col),
            ),
          ),
          GestureDetector(onLongPress: () {
            debugPrint('row:$row, col:$col');
          }),
        ],
      ),
    );
  }

  /// method to buila a row along with cels and render the child component
  Widget _buildRow(int idx, int flex) {
    List<Widget> children = [];

    for (int i = 0; i < widget.cols[idx]; i++) {
      var child =
          _createPlacement(idx, i, widget.colFlex[idx]!.elementAt(i), Text(''));
      children.add(child);
    }

    return Row(
      children: children,
    );
  }

  /// method to build all rows of the layout
  Widget _buildRows() {
    List<Widget> children = [];

    for (int i = 0; i < widget.rows; i++) {
      var inside = _buildRow(i, 1);
      var child = Expanded(
        flex: widget.rowFlex[i],
        child: inside,
      );
      children.add(child);
    }

    return Column(
      children: children,
    );
  }

  /// default method to build this widget
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: widget.background,
          width: MediaQuery.of(context).size.width,
          child: _buildRows(),
        ),
      ],
    );
  }
}
