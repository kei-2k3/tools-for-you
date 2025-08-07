import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools_for_you/feature/calculation_tools/bmi_calculator/data/model/user_input_model.dart';

part 'bmi_provider.g.dart';

@riverpod
class BmiCalculator extends _$BmiCalculator {
  @override
  UserInputModel build() {
    return const UserInputModel(
        gender: Gender.male, height: 0, weight: 0, age: 0);
  }

  void setGender(Gender gender) => state = state.copyWith(gender: gender);
  void setHeight(double height) => state = state.copyWith(height: height);
  void setWeight(double weight) => state = state.copyWith(weight: weight);
  void setAge(int age) => state = state.copyWith(age: age);

  double get bmi {
    final heightM = state.height / 100;
    return state.weight / (heightM * heightM);
  }

  bool get isInputComplete {
    return state.height > 0 && state.weight > 0 && state.age > 0;
  }

  String get advice {
    if (bmi == 0) return 'Please enter valid values.';

    if (bmi < 18.5) {
      return 'You are underweight. Try to eat a balanced diet and consult a healthcare provider.';
    } else if (bmi < 24.9) {
      return 'You have a normal body weight. Great job!';
    } else if (bmi < 29.9) {
      return 'You are overweight. Consider regular exercise and a healthy diet.';
    } else {
      return 'You are obese. It is advised to consult a doctor or dietitian for a health plan.';
    }
  }
}
