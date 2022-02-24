import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback reloadQuiz;
  Result(this.resultScore, this.reloadQuiz);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 8) {
      resultText = "You are Good";
    } else if (resultScore <= 12) {
      resultText = "You are acceptable";
    } else {
      resultText = "Improve yourself";
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
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        FlatButton(
          onPressed: reloadQuiz,
          child: Text("Restart Quiz!"),
          textColor: Colors.blue,
        ),
      ],
    );
  }
}
