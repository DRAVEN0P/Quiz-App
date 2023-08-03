import 'package:flutter/material.dart';
import 'package:second_prj/data/all_ques.dart';
import 'package:second_prj/home.dart';
import 'package:second_prj/questions_page.dart';
import 'package:second_prj/result_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> submittedAnser = [];
  @override
  void initState() {
    activeScreen = HomePage(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      activeScreen = QuestionsScreen(recordAnswer: recordAnswer,);
    });
  }

  void recordAnswer(String ans){
    submittedAnser.add(ans);
    if(submittedAnser.length == questions.length){
      setState(() {
        activeScreen = ResultPage(switchScreen,recordAnswer: submittedAnser,);
      });
      submittedAnser = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 105, 99, 152),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}