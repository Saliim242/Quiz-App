import 'package:quiz_app/question.dart';

class QuizBrain {
  int _nextQuestion = 0;
  List<Questions> _que = [
    Questions('Some cats are actually allergic to humans', true),
    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions(
        'Approximately one quarter of human bones are in the feet.', true),
    Questions('A slug\'s blood is green.', true),
    Questions('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Questions(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Questions(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Questions(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Questions(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Questions('Google was originally called \"Backrub\".', true),
    Questions(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Questions(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  // Gets The Question Text
  String questionText() {
    return _que[_nextQuestion].questinText;
  }

// Gets The Answer Text
  bool questionAnswer() {
    return _que[_nextQuestion].questionAnswer;
  }

  void getNextQuestion() {
    if (_nextQuestion < _que.length - 1) {
      _nextQuestion++;
    }
  }

  // Check if We Reached the End
  bool isFinished() {
    if (_nextQuestion >= _que.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _nextQuestion = 0;
  }
}
