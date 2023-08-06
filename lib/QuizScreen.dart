import 'dart:math';
import 'package:flag_game/ResultScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen();

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> countries = [
    "Estonia",
    "France",
    "Germany",
    "Ireland",
    "Italy",
    "Monaco",
    "Nigeria",
    "Poland",
    "Russia",
    "Spain",
    "UK",
    "US",
  ];

  int random = Random().nextInt(3);
int correctAnswer = 0;
int wrongAnswer = 0;
  @override
  void initState() {
    super.initState();
    countries.shuffle();
  }

  void updateRandom() {
    setState(() {
      random = Random().nextInt(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                "Guess The Flag?",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              Text(
                countries[random],
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30),
              for (int i = 0; i < 3; i++)
                FlagButton(
                  name: countries[i],
                  onPressed: () {
                    if (i == random) {
                      Fluttertoast.showToast(
                          msg: "Correct Answer", backgroundColor: Colors.green);
                      correctAnswer++;
                    } else {
                      Fluttertoast.showToast(
                          msg: "Wrong Answer", backgroundColor: Colors.red);
                      wrongAnswer++;
                    }

                    countries.shuffle();
                    updateRandom();
                  },
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultScreen(correctAnswer: correctAnswer,wrongAnswer: wrongAnswer,)),
                  );
                },
                child: Text(
                    'Show Result'), // Replace 'Text' with any widget you want as the button child.
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FlagButton extends StatelessWidget {
  const FlagButton({Key? key, required this.name, required this.onPressed})
      : super(key: key);

  final String name;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Image.asset(
        "Assets/countries/$name.png",
        height: 150,
      ),
    );
  }
}
