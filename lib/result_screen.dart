import 'package:flutter/material.dart';
import 'package:quiz_app/QuestionSummary.dart';
import 'package:quiz_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswer,required this.restartQuiz});
  final List<String> choosenAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_Answer': questions[i].answer[0],
        'user_Answer': choosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summarydata = getSummaryData();
    final numTotalQuestions = questions.length;
    final numcorrectanswer = summarydata.where((data) {
      return data['user_Answer'] == data['correct_Answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numcorrectanswer out of $numTotalQuestions question correctly!!",
              style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            QuestionSummary(summarydata),
            const SizedBox(height: 30),
            TextButton.icon(onPressed: restartQuiz,
            icon:const Icon(Icons.refresh_rounded,color: Color.fromARGB(255, 230, 5, 5), ),
             label : const Text("RESTART QUIZ",style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
