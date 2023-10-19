import 'package:flutter/material.dart';
import 'package:column_layout/column_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coloumn Layout Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Column Layout'),
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
      Alignment.topCenter,
      Alignment.topRight,
      Alignment.topLeft,
      Alignment.bottomCenter,
      Alignment.bottomLeft,
      Alignment.bottomRight,
      Alignment.center,
      Alignment.centerLeft,
      Alignment.centerRight,
    ];
    return Material(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: ColumnLayout(
          columns: 8,
          rows: const [1, 2, 3, 3, 4, 4, 5, 6],
          columnFlex: const [3, 2, 1, 1, 1, 1, 1, 1],
          rowFlex: const {
            0: [1],
            1: [80, 20],
            2: [1, 1, 1],
            3: [1, 1, 1],
            4: [1, 1, 1, 1],
            5: [1, 1, 1, 1],
            6: [1, 1, 1, 1, 1],
            7: [1, 1, 2, 1, 1, 2],
          },
          getColumnWidgetAt: (int col, int row) {
            return Text(
                style: TextStyle(color: Colors.black, fontSize: 15),
                'C${col + 1}R${row + 1}');
          },
          getColumnAlignmentAt: (col, row) {
            return alignments[col];
          },
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          padding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
