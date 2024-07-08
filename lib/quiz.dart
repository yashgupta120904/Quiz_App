import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questionscreen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return QuizState();
  }
}

class QuizState extends State<Quiz> {
  //Widget? activeScreen;
  //@override
  // void initState() {
  //   activeScreen = Startscreen(switchScreen);
  //   super.initState();
  // }

  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      // activeScreen = QuestionScreen();

      activeScreen = 'Question-Screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void backtoquestionScreen() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'Question-Screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = Startscreen(switchScreen);

    if (activeScreen == 'Question-Screen') {
      screenWidget = QuestionScreen(onselectedAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
          choosenAnswer: selectedAnswer, 
          restartQuiz: backtoquestionScreen);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 85, 0, 205),
              Color.fromARGB(255, 67, 0, 174),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          //child: activeScreen
          // child: activeScreen == 'start-screen'
          //     ? Startscreen(switchScreen)
          //     : const QuestionScreen(),
          child: screenWidget,
        )));
  }
}
