import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:quiz_app/data/questions.dart";

class AnswerButton extends StatelessWidget {
 const AnswerButton({super.key, required this.answertext, required this.onTap});
  final String answertext;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding:const  EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          backgroundColor: Color.fromARGB(255, 32, 0, 111),
          foregroundColor: Colors.white,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        ),
        child: Text(answertext,textAlign: TextAlign.center,));
  }
}