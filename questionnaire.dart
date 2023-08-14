import 'package:flutter/material.dart';
import 'package:fluttertest/Answer.dart';

class questionnaire extends StatefulWidget {
  questionnaire({Key? key});

  @override
  State<questionnaire> createState() => _questionnaireState();
}

class _questionnaireState extends State<questionnaire> {
  int a = 0;
  int index = 0;
  String currentQuestion = "";

  final add_questionlist = [
    '인생의 목표가 무엇인가요?',
    '오늘 가장 상처된 말은?',
    '해야하는 일과 하고 싶은 일',
    '과거의 나에게 하고 싶은 말',
    '나는 지구에서 어떤 존재일까요?',
    '나에게 사랑이란?',
    '잊고싶은 기억이 있다면?'
  ];

  final questionList = ['당신은 지금 행복한가요?'];

  Add() {
    // 질문 추가 버튼 누를 때마다 questionList에 add_questionlist 질문 하나씩 추가
    questionList.insert((a + 1), add_questionlist[a]);
    setState(() {
      a++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('질문 보관소'),
      ),
      body: ListView.builder(
        itemCount: questionList.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              currentQuestion = questionList[i];
              index = i;
              print(questionList);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Answer(currentQuestion, index),
                  ));
            },
            child: ListTile(
              leading: Text((i + 1).toString()),
              title: Text(questionList[i]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('질문을 추가하시겠습니까?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      print('추가를~하자~');
                      Add();
                      Navigator.of(context).pop();
                    },
                    child: Text('확인'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('취소'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.control_point),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: questionnaire(),
  ));
}
