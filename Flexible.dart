import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Row(
          children: [
            Flexible(
                child: Container(height: 100, color: Colors.cyan),
                flex: 7), // 박스폭을 %로 주고싶으면 Flexble()
            Flexible(
                child: Container(height: 100, color: Colors.greenAccent),
                flex: 3)
          ],
        ),
      ),
    );
  }
}
