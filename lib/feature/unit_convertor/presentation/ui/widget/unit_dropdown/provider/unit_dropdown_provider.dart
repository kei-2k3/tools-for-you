import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools_for_you/feature/unit_convertor/data/model/unit_model.dart';

part 'unit_dropdown_provider.g.dart';

@riverpod
class FromUnit extends _$FromUnit {
  @override
  LengthUnitModel build() => lengthUnits.first;

  void set(LengthUnitModel unit) => state = unit;
}

@riverpod
class ToUnit extends _$ToUnit {
  @override
  LengthUnitModel build() => lengthUnits[1];

  void set(LengthUnitModel unit) => state = unit;
}

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
