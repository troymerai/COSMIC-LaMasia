import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DateDetailPage extends StatefulWidget {
  final DateTime selectedDay;
  DateDetailPage({required this.selectedDay});
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  State<DateDetailPage> createState() => _DateDetailPageState();
}

class _DateDetailPageState extends State<DateDetailPage> {
  late SharedPreferences prefs;
  String usertext = "";
  final TextEditingController usertextController = TextEditingController();
  // 선택한 날짜를 담는 변수 선언

  @override
  void initState() {
    super.initState();
    prefs = DateDetailPage.prefs;
    getUserText();
  }

  // 매개변수로 지정한 날짜를 넣어주기
  saveUserText() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      usertext = usertextController.text;
    });
    // 매개변수로 받은대로 데이터 이름 지정해주기
    await prefs.setString(
        "${widget.selectedDay.year}-${widget.selectedDay.month}-${widget.selectedDay.day}",
        usertext);
  }

  // 매개변수로 지정한 날짜와 이름이 같으면 보여주기
  getUserText() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // 매개변수로 받은대로 데이터 이름 지정해주기
      usertext = prefs.getString(
              "${widget.selectedDay.year}-${widget.selectedDay.month}-${widget.selectedDay.day}") ??
          "";
      usertextController.text = usertext;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              ' ${widget.selectedDay.year}-${widget.selectedDay.month}-${widget.selectedDay.day}'),
        ),
        body: Container(
          child: Column(
            children: [
              TextField(
                maxLines: null,
                controller: usertextController,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: InputBorder.none,
                    hintText: 'text'),
              ),
              TextButton(onPressed: () => saveUserText(), child: Text('save')),
            ],
          ),
        ));
  }
}
