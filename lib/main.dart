import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = [
    {
      'question': 'Whats my name?',
      'answers': [
        {'correct': true, 'option': 'Mateus'},
        {'correct': false, 'option': 'Pedro'},
        {'correct': false, 'option': 'Joao'}
      ]
    },
    {
      'question': 'Whats my age?',
      'answers': [
        {'correct': false, 'option': '12'},
        {'correct': false, 'option': '18'},
        {'correct': true, 'option': '31'}
      ]
    }
  ];

  //State
  int _QuestionIndex = 0;
  int _Score = 0;

  _onPressed(correct) {
    setState(() {
      _QuestionIndex++;
      if (correct) {
        _Score++;
      }
    });
  }

  _retryQuiz() {
    setState(() {
      _QuestionIndex = 0;
      _Score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var length = questions.length + 1;
    var position = _QuestionIndex + 1;
    var condicional = position == length;

    print(position);
    print(length);

    //Layout constraints
    Scaffold home = Scaffold(
      appBar: AppBar(title: Text('My Quiz AppBar')),
      body: condicional
          ? Result(_Score, _retryQuiz)
          : Quiz(_onPressed, questions, _QuestionIndex),
    );

    return MaterialApp(home: home);
  }
}

class Header extends AppBar {
  @override
  final title = Text('My Quiz AppBar');

  Header();
}
