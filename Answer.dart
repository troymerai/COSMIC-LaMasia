import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertest/questionnaire.dart';

class Answer extends StatefulWidget {
  String currentQuestion = "";
  Answer(this.currentQuestion);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  late SharedPreferences prefs;
  String answer_text = "";
  final TextEditingController Answer_Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    GetText();
  }

  SaveText() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      answer_text = Answer_Controller.text;
      prefs.setString("current_answer", answer_text);
    });
  }

  GetText() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      answer_text = prefs.getString("current_answer") ?? "";
      Answer_Controller.text = answer_text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(widget.currentQuestion,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            ),
          ),
          Container(
            child: TextField(
              controller: Answer_Controller,
              textAlign: TextAlign.left,
              maxLines: null,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  border: InputBorder.none,
                  hintText: 'input your answer'),
            ),
          ),
          TextButton(onPressed: () => SaveText(), child: Text('save'))
        ],
      ),
    );
  }
}
