import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools_for_you/feature/unit_convertor/data/model/unit_model.dart';
import 'package:tools_for_you/feature/unit_convertor/presentation/ui/widget/unit_dropdown/provider/unit_dropdown_provider.dart';

part 'temperature_converter_provider.g.dart';

@riverpod
class TemperatureInput extends _$TemperatureInput {
  @override
  double build() => 0.0;

  void set(double val) => state = val;
}

@riverpod
double temperatureConverter(Ref ref) {
  final input = ref.watch(temperatureInputProvider);
  final from = ref.watch(fromTemperatureUnitProvider);
  final to = ref.watch(toTemperatureUnitProvider);

  double result = input;

  if (from.unit == to.unit) return result;

  // Convert input to Celsius
  switch (from.unit) {
    case TemperatureUnit.fahrenheit:
      result = (input - 32) * 5 / 9;
      break;
    case TemperatureUnit.kelvin:
      result = input - 273.15;
      break;
    case TemperatureUnit.celsius:
      break;
  }

  // Convert from Celsius to target
  switch (to.unit) {
    case TemperatureUnit.fahrenheit:
      result = result * 9 / 5 + 32;
      break;
    case TemperatureUnit.kelvin:
      result = result + 273.15;
      break;
    case TemperatureUnit.celsius:
      break;
  }

  return double.parse(result.toStringAsFixed(2));
}
