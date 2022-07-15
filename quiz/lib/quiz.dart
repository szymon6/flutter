import 'package:flutter/material.dart';
import 'package:p1_crashcourse/answer.dart';
import 'package:p1_crashcourse/question.dart';

class Quiz extends StatelessWidget {
  final currentQuestion;
  final handleAnswerQuestion;
  const Quiz(this.currentQuestion, this.handleAnswerQuestion, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(currentQuestion['question'].toString()),
        ...(currentQuestion['answers'] as List)
            .map(
              (a) => Answer(
                () => handleAnswerQuestion(a['score']),
                a['answer'].toString(),
              ),
            )
            .toList(),
      ],
    );
  }
}
