import 'package:flutter/material.dart';
import 'package:p1_crashcourse/quiz.dart';
import 'package:p1_crashcourse/result.dart';

//5:31
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  var _showingResult = false;

  void _handleAnswerQuestion(int score) {
    setState(() {
      _totalScore += score;

      if (_questionIndex < questions.length - 1)
        _questionIndex++;
      else
        _showingResult = true;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _showingResult = false;
    });
  }

  static const questions = [
    {
      'question': 'Whats your favourite color',
      'answers': [
        {'answer': 'blue', 'score': 2},
        {'answer': 'red', 'score': 3},
        {'answer': 'green', 'score': 4},
      ]
    },
    {
      'question': 'What is 2 + 2',
      'answers': [
        {'answer': 3, 'score': 0},
        {'answer': 4, 'score': 3},
        {'answer': 5, 'score': 0},
      ]
    },
    {
      'question': 'What is your favourite animal',
      'answers': [
        {'answer': 'dog', 'score': 4},
        {'answer': 'cat', 'score': 0},
        {'answer': 'hamster', 'score': 2},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[_questionIndex];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Secod App1'),
        ),
        body: _showingResult
            ? Result(_totalScore, _resetQuiz)
            : Quiz(currentQuestion, _handleAnswerQuestion),
      ),
    );
  }
}
