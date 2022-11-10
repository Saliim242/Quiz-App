import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // ScoreKeeper  List
  List<Icon> scoreKeeper = [];

  QuizBrain quiz = QuizBrain();

  // Check The Answer
  void CheckAnswer(bool userPicker) {
    bool correctAnswe = quiz.questionAnswer();
    setState(() {
      if (quiz.isFinished() == true) {
        Alert(
          context: context,
          title: "Finished",
          desc: "You have finished the Quiz",
        ).show();
        quiz.reset();
        scoreKeeper = [];
      } else {
        if (userPicker == correctAnswe) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }

      quiz.getNextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // This is Text Widget
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  quiz.questionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MaterialButton(
                color: Colors.green,
                onPressed: () {
                  CheckAnswer(true);
                },
                child: Text(
                  "True",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MaterialButton(
                color: Colors.redAccent,
                onPressed: () {
                  CheckAnswer(false);
                },
                child: Text(
                  "False",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // Score Tracker
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: scoreKeeper,
            ),
          ),
        ],
      ),
    );
  }
}
