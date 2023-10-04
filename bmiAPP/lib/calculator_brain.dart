import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;
  late double _bmi; // Add 'late' modifier

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2); // Remove double type
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpret() {
    if (_bmi >= 25) {
      return 'Your have some overweight. Increase your exercise level as well as a good a diet.';
    } else if (_bmi > 18.5) {
      return 'Congrats! Your weight is normal.';
    } else {
      return 'You need to gain some weight. Try reconsidering your diet.';
    }
  }
}
