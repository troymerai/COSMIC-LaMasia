import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('앱잉'),
        ),
        body: Row(

          children: [
            Text('안녕'),
            Icon(Icons.star),
          ]
        ),
         bottomNavigationBar :
    BottomAppBar(
        child: Container(
            color: Colors.lightBlue,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Icon(Icons.phone),
            Icon(Icons.message),
            Icon(Icons.contact_page),
          ],
        )
      )

          ),
        ),
      );


  }
}