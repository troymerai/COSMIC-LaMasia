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
            Expanded(
                child: Container(
                    height: 100,
                    color: Color.fromARGB(255, 22, 12,
                        129))), // Row나 Column 안에서 박스 하나만 꽉 채우고 싶으면 Expanded
            Container(
              child:
                  Container(height: 100, width: 10, color: Colors.greenAccent),
            )
          ],
        ),
      ),
    );
  }
}
