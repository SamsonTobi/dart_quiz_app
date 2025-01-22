import 'package:flutter/material.dart';
import 'questions.dart';

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

class ScoreIcons {
  static const Icon correct = Icon(Icons.check, color: Colors.green);
  static const Icon wrong = Icon(Icons.close, color: Colors.red);
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

List<Icon> scoreKeeper = [];
int currentQuestion = 0;
List<Question> questions = [
  Question('You can lead a cow down the stairs but not up the stairs', false),
  Question('Approximately one quarter of human bones are in the feet', true),
  Question('A slug\'s blood is green', true),
];

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Text(
              questions[currentQuestion].question,
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
            bool answer = questions[currentQuestion].answer;

            scoreKeeper
                .add(answer == true ? ScoreIcons.correct : ScoreIcons.wrong);
            setState(() {
              currentQuestion++;
            });
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
            bool answer = questions[currentQuestion].answer;

            scoreKeeper
                .add(answer == false ? ScoreIcons.correct : ScoreIcons.wrong);
            setState(() {
              currentQuestion++;
            });
          },
          child: const Text(
            'False',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
