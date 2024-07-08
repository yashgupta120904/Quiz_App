import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/model/answerbutton.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onselectedAnswer});
  final void Function(String answer) onselectedAnswer;
  @override
  State<QuestionScreen> createState() {
    return QuestionScreenState();
  }
}

class QuestionScreenState extends State<QuestionScreen> {
  var questioncountindex = 0;
  void answerofquestions(selectedAnswer) {
    widget.onselectedAnswer(selectedAnswer);
    setState(() {
      questioncountindex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[questioncountindex];

    return Center(
        child: SizedBox(
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 255, 253, 253)),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswer().map((answer) {
              return AnswerButton(
                  answertext: answer,
                  onTap: () {
                    answerofquestions(answer);// just the that belong to the question
                  });
            }),
            // AnswerButton(answertext: currentQuestion.answer[0], onTap: () {}),
            // AnswerButton(answertext: currentQuestion.answer[1], onTap: () {}),
            // AnswerButton(answertext: currentQuestion.answer[2], onTap: () {}),
            // AnswerButton(answertext: currentQuestion.answer[3], onTap: () {}),
          ],
        ),
      ),
    ));
  }
}
