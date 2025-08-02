import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools_for_you/core/utils/shared/unit_model.dart';
import 'package:tools_for_you/feature/unit_converter/length_converter/data/model/length_model.dart';
import 'package:tools_for_you/feature/unit_converter/presentation/ui/widget/unit_dropdown/provider/unit_dropdown_provider.dart';

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
  final fromUnit = ref.watch(fromMeterProvider);
  final toUnit = ref.watch(toMeterProvider);

  final double valueInMeter = inputValue * fromUnit.toBase;
  final double converted = valueInMeter / toUnit.toBase;
  return converted;
}

@riverpod
List<UnitModel> unitsOfLength(Ref ref) => lengthUnits;
