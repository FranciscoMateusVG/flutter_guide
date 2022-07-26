import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function retry;
  Result(this.score, this.retry);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          "Success! You got ${score} answers correctly",
        ),
        RaisedButton(
          child: Text("Retry"),
          onPressed: retry,
          color: Colors.amber,
          textColor: Colors.white,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    ));
  }
}
