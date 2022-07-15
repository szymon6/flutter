import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final score;
  final VoidCallback resetQuiz;

  const Result(this.score, this.resetQuiz, {Key? key}) : super(key: key);

  String get resultPhrase {
    String resultText;

    if (score <= 5)
      resultText = 'Could be better';
    else if (score <= 10)
      resultText = 'Pretty nice';
    else
      resultText = 'You are awesome';

    resultText += ", your score is: $score";

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: resetQuiz,
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
