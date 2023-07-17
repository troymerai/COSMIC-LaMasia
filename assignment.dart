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
        appBar: AppBar(title:Text('금호동 3가')),
        body:
        Column(children: [
            Container(width: double.infinity, height: 10,color: Colors.white),
          Container(width: double.infinity, height: 200, color: Colors.black,child:
          Row(
            children: [Container(width: 250,height: 200,color: Colors.pink, child:
            Image.asset('assets/카메라 사진.jpg')),
            Container(height: 200, width: 250, color: Colors.blue,child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
                color:Colors.white,
                  child:
              Text('캐논 DSLR 100D(단렌즈,충전기 16기가SD포함)',style:TextStyle(fontSize: 24))),
              Container(
                  color: Colors.green,
                  child:
              Text('성동구 행당동 - 끌올 10분전', style: TextStyle(color: Colors.grey))),
              Container(child: Text('210,000원')),
              Align(
                alignment: Alignment.bottomRight,            // container 좌하단 정렬 >> Align() 사용
                child: Container(child: Icon(Icons.heart_broken)))

            ],))]
          ))

        ]

          //Row(children: [],)
      )
        )



    );

  }
}




