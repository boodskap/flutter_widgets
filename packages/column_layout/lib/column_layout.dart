library column_layout;

import 'package:flutter/material.dart';

/// callback method to render a child widget on-demand
typedef GetColumnWidgetAt = Widget Function(int column, int row);

// callback method to set the alignment of a layout cell dynamically
typedef GetColumnAlignmentAt = Alignment Function(int column, int row);

/// A simple layout where you can specify the number of columns and then rows in each columns
///
/// Very complex layouts can be achieved by combinations of RowLayout and [ColumnLayout](https://pub.dev/packages/column_layout)
//ignore: must_be_immutable
class ColumnLayout extends StatefulWidget {
  ///
  /// **columns** the number of columns this layout should have
  ///
  /// **rows** the number of rows each column should have, the size of the array should match the **columns**
  ///
  /// **columnFlex** the width percentage of each column should have,  the size of the array should match the **columns**
  ///
  /// **rowFlex** the height percentage of each row should have,  the size of the map should match the **columns** and the size of the array should match the **rows** in that column
  ///
  /// **getColumnWidgetAt** A callback method to dynamically render the widget at (column, row) cell
  ///
  /// **getColumnAlignmentAt** aligment of a cell
  ///
  /// **padding** Example: const EdgeInsets.all(10.0), default is const EdgeInsets.all(0.0)
  ///
  /// **background** Example: Colors.read, default is Colors.white
  ///
  ColumnLayout({
    super.key,
    required this.columns,
    required this.rows,
    required this.columnFlex,
    required this.rowFlex,
    required this.getColumnWidgetAt,
    required this.getColumnAlignmentAt,
    this.background = Colors.white,
    this.padding = const EdgeInsets.all(0.0),
    this.decoration = const BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black))),
  });

  final int columns;
  final List<int> rows;
  final List<int> columnFlex;
  final Map<int, List<int>> rowFlex;
  final GetColumnWidgetAt getColumnWidgetAt;
  final GetColumnAlignmentAt getColumnAlignmentAt;
  Color? background;
  EdgeInsetsGeometry? padding;
  Decoration? decoration;

  @override
  State<ColumnLayout> createState() => _ColumnLayoutState();
}

/// internal widget state
class _ColumnLayoutState extends State<ColumnLayout> {
  Widget _createPlacement(int row, int col, int flex, Widget child) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: widget.padding!,
        child: Container(
          decoration: widget.decoration,
          height: MediaQuery.of(context).size.height,
          alignment: widget.getColumnAlignmentAt(row, col),
          child: widget.getColumnWidgetAt(row, col),
        ),
      ),
    );
  }

  /// method to build a column along with its dynamic widget
  Widget _buildColumn(int idx, int flex) {
    List<Widget> children = [];

    for (int i = 0; i < widget.rows[idx]; i++) {
      var child =
          _createPlacement(idx, i, widget.rowFlex[idx]!.elementAt(i), Text(''));
      children.add(child);
    }

    return Column(
      children: children,
    );
  }

  /// method to muild all the columns of this layout
  Widget _buildColumns() {
    List<Widget> children = [];

    for (int i = 0; i < widget.columns; i++) {
      var inside = _buildColumn(i, 1);
      var child = Expanded(
        flex: widget.columnFlex[i],
        child: inside,
      );
      children.add(child);
    }

    return Row(
      children: children,
    );
  }

  /// default method to build the widget
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: widget.background,
          width: MediaQuery.of(context).size.width,
          child: _buildColumns(),
        ),
      ],
    );
  }
}
