import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools_for_you/core/utils/shared/unit_model.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/area_converter/data/model/area_model.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/length_converter/data/model/length_model.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/volume_converter/data/model/volume_model.dart';

part 'unit_dropdown_provider.g.dart';

@riverpod
class FromMeter extends _$FromMeter {
  @override
  UnitModel build() => lengthUnits.first;

  void set(UnitModel unit) => state = unit;
}

@riverpod
class ToMeter extends _$ToMeter {
  @override
  UnitModel build() => lengthUnits[1];

  void set(UnitModel unit) => state = unit;
}

@riverpod
class FromArea extends _$FromArea {
  @override
  UnitModel build() => areaUnits.first;

  void set(UnitModel unit) => state = unit;
}

@riverpod
class ToArea extends _$ToArea {
  @override
  UnitModel build() => areaUnits[1];

  void set(UnitModel unit) => state = unit;
}

@riverpod
class FromVolume extends _$FromVolume {
  @override
  UnitModel build() => volumeUnits.first;

  void set(UnitModel unit) => state = unit;
}

@riverpod
class ToVolume extends _$ToVolume {
  @override
  UnitModel build() => volumeUnits[1];

  void set(UnitModel unit) => state = unit;
}
