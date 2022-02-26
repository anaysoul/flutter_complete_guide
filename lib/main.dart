import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// private class
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 1},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3}
      ]
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Bear', 'score': 10},
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Giraffe', 'score': 3},
        {'text': 'Lion', 'score': 1}
      ]
    },
    {
      'questionText': 'Who is your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Manu', 'score': 5},
        {'text': 'Dr Angela Yu', 'score': 3},
        {'text': 'Jonas', 'score': 1}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override // decorator provided by dart
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(),
      ),
    );
  }
}
