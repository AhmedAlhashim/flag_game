import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({required this.correctAnswer,required this.wrongAnswer});
  final int correctAnswer;
  final int wrongAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Correct Answers: $correctAnswer",
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Wrong Answers: $wrongAnswer",
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
