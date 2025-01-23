import 'questions_model.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ScoreIcons {
  static const Icon correct = Icon(Icons.check, color: Colors.green);
  static const Icon wrong = Icon(Icons.close, color: Colors.red);
}

class QuizBrain {
  int _currentQuestion = 0;

  final List<Question> _questionBank = [
    Question(
        'Widget build is a method that returns a widget tree and is called by the Flutter framework',
        true),
    Question(
        'StatelessWidget is mutable and can change its state during runtime',
        false),
    Question(
        'Hot Reload allows developers to see changes without restarting the entire application',
        true),
    Question('MaterialApp is required for every Flutter application', false),
    Question(
        'The Scaffold widget provides a default app bar, title, and body property',
        true),
    Question('Flutter uses Dart as its programming language', true),
    Question('setState() can be called inside build() method', false),
    Question('Container widget can have only one child widget', true),
    // Question('Row and Column widgets can have multiple children', true),
    // Question('The main() function must return a Widget', false),
    // Question('Flutter widgets are immutable', true),
    // Question('SharedPreferences is used for secure storage of sensitive data',
    //     false),
    // Question('The pubspec.yaml file is used for defining project dependencies',
    //     true),
    // Question('Navigator.push() adds a route to the top of the navigation stack',
    //     true),
    // Question('Flutter can only create applications for Android and iOS', false),
    // Question('Every Flutter widget must have a build method', true),
    // Question(
    //     'The Stack widget positions its children relative to the edges of its box',
    //     true),
    // Question('Flutter uses XML for designing user interfaces', false),
    // Question('Key property is mandatory for all widgets', false),
    // Question(
    //     'MediaQuery.of(context) provides information about the current device screen',
    //     true),
    // Question(
    //     'The initState() method is called multiple times during a StatefulWidget lifecycle',
    //     false),
    // Question(
    //     'The dispose() method is called when a StatefulWidget is removed from the widget tree',
    //     true),
    // Question('BuildContext is used to locate widgets in the widget tree', true),
    // Question('async and await keywords can be used in the build method', false),
    // Question('The runApp() function is required to start a Flutter application',
    //     true),
    // Question('FutureBuilder can only work with Future objects', true),
    // Question(
    //     'StreamBuilder can work with both Stream and Future objects', false),
    // Question(
    //     'The const constructor improves app performance by creating compile-time constants',
    //     true),
    // Question(
    //     'Flutter widgets follow a composition over inheritance pattern', true),
    // Question('SingleChildScrollView can have multiple children', false),
    // Question(
    //     'The debugPrint() function works the same as print() in release mode',
    //     false),
    // Question('ListView.builder() creates all its items at once', false),
    // Question(
    //     'The ThemeData class is used to define the visual properties of an app',
    //     true),
    // Question('GestureDetector can only detect tap gestures', false),
    // Question(
    //     'The mounted property tells if a State object is currently in the tree',
    //     true),
    // Question('StatefulWidgets can be const', false),
    // Question(
    //     'The BuildContext contains the theme data of the application', true),
    // Question('GlobalKey can be used to access State object of a StatefulWidget',
    //     true),
    // Question(
    //     'ValueNotifier is a way to provide reactive state management', true),
    // Question('The didUpdateWidget method is called before build()', true)
  ];

  String getQuestionText() => _questionBank[_currentQuestion].question;

  bool getCorrectAnswer() => _questionBank[_currentQuestion].answer;

  void nextQuestion() {
    _currentQuestion < questionsLength - 1 ? _currentQuestion++ : '';
  }

  bool isFinished() => _currentQuestion + 1 == questionsLength ? true : false;
  void resetQuiz() => _currentQuestion = 0;

  int get questionsLength => _questionBank.length;
  int get currentQuestion => _currentQuestion;
}
