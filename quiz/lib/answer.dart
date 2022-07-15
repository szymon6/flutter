import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback handePressed;
  final String text;
  const Answer(this.handePressed, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: handePressed,
        child: Text(text),
      ),
    );
  }
}
