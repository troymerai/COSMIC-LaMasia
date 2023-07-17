import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
      home:MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('코드팩토리',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w700,color: Colors.blue),)
      ),
    );
  }
}
