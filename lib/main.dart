import 'package:flutter/material.dart';
import 'quiz_brain.dart';

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

int currentQuestion = 0;

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Question ${currentQuestion + 1} out of ${quizBrain.questionBank.length}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              quizBrain.questionBank[currentQuestion].question,
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
            bool answer = quizBrain.questionBank[currentQuestion].answer;
            quizBrain.handleScores(answer, true);

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
            bool answer = quizBrain.questionBank[currentQuestion].answer;
            quizBrain.handleScores(answer, false);

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
        const SizedBox(
          height: 12,
        ),
        Row(
          children: quizBrain.scoreKeeper,
        )
      ],
    );
  }
}
