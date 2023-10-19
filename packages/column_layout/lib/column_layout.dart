library column_layout;

import 'package:flutter/material.dart';

typedef GetColumnWidgetAt = Widget Function(int column, int row);
typedef GetColumnAlignmentAt = Alignment Function(int column, int row);

class ColumnLayout extends StatefulWidget {
  ColumnLayout(
      {super.key,
      required this.columns,
      required this.rows,
      required this.columnFlex,
      required this.rowFlex,
      required this.getColumnWidgetAt,
      required this.getColumnAlignmentAt,
      this.padding = const EdgeInsets.all(0.0),
      this.decoration = const BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black))),
      this.background = Colors.white});

  final int columns;
  final List<int> rows;
  final List<int> columnFlex;
  final Map<int, List<int>> rowFlex;
  final GetColumnWidgetAt getColumnWidgetAt;
  final GetColumnAlignmentAt getColumnAlignmentAt;
  final Color? background;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;

  @override
  State<ColumnLayout> createState() => _ColumnLayoutState();
}

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
