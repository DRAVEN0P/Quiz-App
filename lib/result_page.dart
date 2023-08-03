
import 'package:flutter/material.dart';
import 'package:second_prj/data/all_ques.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(this.switchScreen, {required this.recordAnswer, super.key});
  final List<String> recordAnswer;
  final Function() switchScreen;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < recordAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_ans": questions[i].ans[0],
        "answer": recordAnswer[i],
      });
    }

    return summary;
  }
 
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final int totalQuestion = questions.length;
    var correctAns = summaryData.where((element) {
      return element["correct_ans"] == element["answer"];
    }).length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsetsDirectional.all(20),
          child: Text(
            "Total Number of Correct Answers are $correctAns Out Of $totalQuestion ",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsetsDirectional.all(20),
          child: SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: SummaryAns(summaryData),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        TextButton(
          onPressed: switchScreen,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 167, 78, 183),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          child: const Text("RESTART"),
        ),
      ],
    );
  }
}

// ----------------------------------------------------------------

class SummaryAns extends StatelessWidget {
  const SummaryAns(this.summary, {super.key});
  final List<Map<String, Object>> summary;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: summary.map((data) {
          bool isTrue(){
            if(data["correct_ans"] == data["ans"]){
              return true;
            }
            return false;
          }
          bool ans = isTrue();
      return Row(
        children: [
          Text(((data["question_index"] as int) + 1).toString()),
          Expanded(
            child: Column(
              children: [
                Text(
                  data["question"].toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  data["answer"].toString(),
                  style: const TextStyle(
                    color:  true ? Colors.green : Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  data["correct_ans"].toString(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 114, 255, 119),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(ans.toString()),
              ],
            ),
          ),
        ],
      );
    }).toList());
  }
}
