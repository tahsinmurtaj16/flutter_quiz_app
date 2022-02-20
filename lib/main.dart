import 'dart:html';

import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 3},
        {'text': 'White', 'score': 8},
        {'text': 'Red', 'score': 10},
        {'text': 'Yellow', 'score': 7},
      ],
    },
    {
      'questionText': 'what\'s your favourite animal?',
      'answers': [
        {'text': 'Tiger', 'score': 3},
        {'text': 'Cat', 'score': 8},
        {'text': 'Dog', 'score': 10},
        {'text': 'Bird', 'score': 7},
      ]
    },
    {
      'questionText': 'what\'s your favourite Instructor?',
      'answers': [
        {'text': 'Max', 'score': 3},
        {'text': 'Hans', 'score': 8},
        {'text': 'Eldo', 'score': 10},
        {'text': 'Hitler', 'score': 7},
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more question!');
    }
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore),
      ),
    );
  }
}
