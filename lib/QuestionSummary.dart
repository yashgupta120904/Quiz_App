import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.dataSummary,{super.key});
  final List<Map<String, Object>> dataSummary;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: dataSummary.map((data) {
          return Row(
            children: [
              Text(((data['question_index'] as int) +1 ).toString(),
              ),
             
              Expanded(
                child: Column(children: [
                   Container(
                    margin: EdgeInsets.all(10),padding:EdgeInsets.all(8.0) ,
                    child: Text(data['question'] as String,style:  TextStyle(color: Colors.white,fontSize: 18, ),textAlign: TextAlign.left)) ,

                    const SizedBox(height: 5),
                Opacity(
                  opacity: 0.8,
                  child: (
                  
                     Text(data['user_Answer'] as String, style:TextStyle(color: Color.fromARGB(255, 205, 240, 6),fontSize: 18) ,textAlign: TextAlign.left)),
                )  ,
                Text(data[ 'correct_Answer'] as String,style:TextStyle(color: Color.fromARGB(255, 16, 235, 1),fontSize: 18) ,textAlign: TextAlign.left)  ,
                ],),
              ),
            ]
          );
        }).toList()
        
        ),
      ),
    );
  }
}
