import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText;

    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 16) {
      resultText = 'You are... Strange as fuck !';
    } else {
      resultText = 'You are just trash !!!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: resetQuiz,
          child: Text('Restart Quiz'),
        ),
      ],
    );
  }
}
