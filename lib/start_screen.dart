import 'package:flutter/material.dart';

class Startscreen extends StatelessWidget {
  const Startscreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            'assets/image/quiz-logo.png',
            width: 300,
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        const Opacity(
          opacity: 0.9,
          child: Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 20),
        TextButton.icon(
            onPressed: () {startQuiz ();},
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("START",
                style: TextStyle(
                  fontSize: 19,
                )))
      ],
    ));
  }
}
