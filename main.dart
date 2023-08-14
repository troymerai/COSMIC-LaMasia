import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'DateDetailPage.dart';
import 'home.dart';

void main() async {
  await initializeDateFormatting();
  await DateDetailPage.init();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyApp(),
    ),
  );
}

List<String> secreat = [];
String myStr = '';
String configuredStr = "1234";

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            child: Text(
              '비밀번호',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            alignment: Alignment.center,
          ),
          Expanded(
            child: MyCustomGridView(),
          ),
          GestureDetector(
            onTap: () {
              myStr = secreat.join();
              print(myStr);
              if (myStr == configuredStr) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('비밀번호를 다시 입력해주세요.'),
                        actions: [
                          Center(
                            child: ElevatedButton(
                                child: Text('확인'),
                                onPressed: () {
                                  Navigator.of(context).pop(); //Dialog 창 닫기
                                  secreat.clear(); // secret 초기화
                                  myStr = ''; // myStr 초기화
                                }),
                          )
                        ],
                      );
                    });
              }
            },
            child: Container(
              color: Colors.white,
              width: 100,
              height: 70,
              padding: EdgeInsets.only(bottom: 30),
              child: Center(
                child: Text(
                  '확인',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomGridView extends StatelessWidget {
  MyCustomGridView({Key? key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 9,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemBuilder: (BuildContext bc, int index) {
        return GestureDetector(
          onTap: () {
            secreat.add((index + 1).toString());
          },
          child: Container(
            color: Colors.white,
            child: Center(
              child: Text(
                (index + 1).toString(),
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        );
      },
    );
  }
}
