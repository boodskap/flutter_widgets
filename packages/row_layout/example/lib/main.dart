import 'package:flutter/material.dart';
import 'package:row_layout/row_layout.dart';

void main() {
  runApp(const MyApp());
}

/// Simple application to demonstrate **row_layout**
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Row Layout Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Row Layout'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Alignment> alignments = [
      Alignment.center,
      Alignment.centerLeft,
      Alignment.centerRight,
      Alignment.bottomCenter,
      Alignment.bottomLeft,
      Alignment.bottomRight,
      Alignment.topCenter,
      Alignment.topRight,
      Alignment.topLeft,
    ];

    return Material(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: RowLayout(
          rows: 9,
          cols: const [1, 2, 3, 4, 5, 6, 7, 8, 9],
          rowFlex: const [2, 1, 1, 1, 1, 1, 1, 1, 1],
          colFlex: const {
            0: [1],
            1: [1, 1],
            2: [1, 2, 1],
            3: [1, 1, 1, 1],
            4: [1, 1, 2, 1, 1],
            5: [1, 1, 1, 1, 1, 1],
            6: [1, 1, 1, 2, 1, 1, 1],
            7: [1, 1, 1, 1, 1, 1, 1, 1],
            8: [1, 2, 1, 1, 1, 1, 1, 2, 1],
          },
          getRowWidgetAt: (int row, int col) {
            return Text(
                style: const TextStyle(color: Colors.black, fontSize: 15),
                'R${row}C${col}');
          },
          getRowAlignmentAt: (row, col) {
            return alignments[row];
          },
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          padding: const EdgeInsets.all(2.0),
        ),
      ),
    );
  }
}
