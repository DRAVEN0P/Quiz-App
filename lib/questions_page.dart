import 'package:flutter/material.dart';
import 'package:second_prj/data/answer_button.dart';
import 'package:second_prj/data/all_ques.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.recordAnswer, super.key});

  final void Function(String answer) recordAnswer;
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
          ],
        ),
      ),
    );
  }
}
