import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/temperature_converter/data/model/temperature_model.dart';

part 'temperature_dropdown_provider.g.dart';

@riverpod
class FromTemperatureUnit extends _$FromTemperatureUnit {
  @override
  TemperatureUnitModel build() => temperatureUnits[0];

  void set(TemperatureUnitModel unit) => state = unit;
}

@riverpod
class ToTemperatureUnit extends _$ToTemperatureUnit {
  @override
  TemperatureUnitModel build() => temperatureUnits[1];

  void set(TemperatureUnitModel unit) => state = unit;
}
