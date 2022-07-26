import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

class Quiz extends StatelessWidget {
  final Function handleAnswer;
  final List<Map<String, Object>> questions;
  final int index;

  Quiz(this.handleAnswer, this.questions, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[index]['question']),
      ...(questions[index]['answers'] as List<Map>).map((a) {
        String answerText = a['option'] as String;
        bool correctAnswer = a['correct'] as bool;
        return Answer(() => handleAnswer(correctAnswer), answerText);
      }).toList()
    ]);
  }
}
