enum Gender { male, female }

class UserInputModel {
  final Gender gender;
  final double height;
  final double weight;
  final int age;

  const UserInputModel({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });

  UserInputModel copyWith({
    Gender? gender,
    double? height,
    double? weight,
    int? age,
  }) {
    return UserInputModel(
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
    );
  }
}
