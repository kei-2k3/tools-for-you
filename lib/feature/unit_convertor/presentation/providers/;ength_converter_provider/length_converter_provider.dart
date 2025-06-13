import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools_for_you/feature/unit_convertor/data/model/unit_model.dart';
import 'package:tools_for_you/feature/unit_convertor/presentation/ui/widget/unit_dropdown/provider/unit_dropdown_provider.dart';

part 'length_converter_provider.g.dart';

@riverpod
class InputValue extends _$InputValue {
  @override
  double build() => 1.0;

  void set(double value) => state = value;
}

@riverpod
double lengthConverter(Ref ref) {
  final inputValue = ref.watch(inputValueProvider);
  final fromUnit = ref.watch(fromUnitProvider);
  final toUnit = ref.watch(toUnitProvider);

  final double valueInMeter = inputValue * fromUnit.toMeter;
  final double converted = valueInMeter / toUnit.toMeter;
  return converted;
}

@riverpod
List<LengthUnitModel> units(Ref ref) => lengthUnits;
