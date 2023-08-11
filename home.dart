import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fluttertest/questionnaire.dart';
import 'package:fluttertest/DateDetailPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // selectedDay: 현재 선택된 날짜를 저장하는 변수
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  // focusedDay: 현재 포커스된 날짜를 저장하는 변수
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // 상단 앱 바
      body: Column(
        children: [
          Flexible(
            child: TableCalendar(
              locale: 'ko_KR', // 테이블 캘린더의 언어를 한국어로 설정
              firstDay: DateTime.utc(2021, 10, 16), // 테이블 캘린더의 시작 날짜
              lastDay: DateTime.utc(2030, 3, 14), // 테이블 캘린더의 마지막 날짜
              focusedDay: focusedDay, // 포커스된 날짜 설정
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                // 날짜를 선택했을 때 호출되는 콜백 함수
                // 선택된 날짜의 상태를 갱신
                setState(() {
                  this.selectedDay = selectedDay; // selectedDay 변수 갱신
                  this.focusedDay = focusedDay; // focusedDay 변수 갱신
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DateDetailPage(selectedDay: selectedDay),
                  ),
                );
              },
              selectedDayPredicate: (DateTime day) {
                // 특정 날짜의 모양을 바꿔주는 함수
                // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
                return isSameDay(selectedDay, day); // 선택된 날짜와 현재 날짜가 같은지 확인
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 60,
              child: ElevatedButton.icon(
                  icon: Icon(Icons.content_paste_outlined),
                  label: Text('질문 보관소'),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => questionnaire(),
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
