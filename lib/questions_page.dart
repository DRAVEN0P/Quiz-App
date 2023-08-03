import 'package:flutter/material.dart';
import 'package:second_prj/data/answer_button.dart';
import 'package:second_prj/data/all_ques.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.home ,required this.recordAnswer, super.key});

  final void Function(String answer) recordAnswer;
  final void Function() home;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestion = 0;

  void answerSubmit(String answer) {
    widget.recordAnswer(answer);
    setState(() {
      currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestion];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestions.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            ...currentQuestions.getSuffeledAnswer().map((answer) {
              return AnsButton(
                ansText: answer,
                onTap: (){ answerSubmit(answer); },
              );
            }),
            const SizedBox(height: 30,),
            TextButton(
          onPressed: widget.home,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 167, 78, 183),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          child: const Text("Exit"),
        ),
          ],
        ),
      ),
    );
  }
}
