import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'What is your favorite foodie ?',
      'answers': [
        {'text': 'Rice', 'score': 10},
        {'text': 'Beans', 'score': 5},
        {'text': 'Bread', 'score': 3},
      ],
    },
    {
      'questionText': 'What is your age ?',
      'answers': [
        {'text': '0-17', 'score': 3},
        {'text': '18-30', 'score': 11},
        {'text': '30-Above', 'score': 5},
      ],
    },
    {
      'questionText': 'Where are you from ?',
      'answers': [
        {'text': 'Nigeria', 'score': 1},
        {'text': 'United Kingdom', 'score': 1},
        {'text': 'France', 'score': 1},
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _changeQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                changeQuestion: _changeQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
