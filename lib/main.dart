import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final quizBrain = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void handleScores(bool userPickedAnswer) {
    scoreKeeper.add(quizBrain.getCorrectAnswer() == userPickedAnswer
        ? ScoreIcons.correct
        : ScoreIcons.wrong);

    setState(() {
      if (quizBrain.isFinished() == true) {
        _onBasicAlertPressed(context);
      }

      quizBrain.nextQuestion();
    });
  }

  void restartQuiz() {
    setState(() {
      quizBrain.resetQuiz();
      scoreKeeper = [];
    });
    Navigator.pop(context);
  }

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      type: AlertType.info,
      closeFunction: () {
        restartQuiz();
      },
      onWillPopActive: true,
      title: "End of Quiz",
      desc: "You've gotten to the end of this quiz",
      style: const AlertStyle(
        overlayColor: Color(0x55000000),
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            restartQuiz();
          },
          width: 120,
          child: const Text(
            "Restart Quiz",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Question ${quizBrain.currentQuestion + 1} out of ${quizBrain.questionsLength}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero)),
          onPressed: () {
            handleScores(true);
          },
          child: const Text(
            'True',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              backgroundColor: Colors.red,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero)),
          onPressed: () {
            handleScores(false);
          },
          child: const Text(
            'False',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
