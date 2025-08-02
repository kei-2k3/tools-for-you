import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools_for_you/core/utils/shared/unit_model.dart';
import 'package:tools_for_you/feature/unit_converter/area_converter/data/model/area_model.dart';
import 'package:tools_for_you/feature/unit_converter/length_converter/presentation/provider/length_converter_provider.dart';
import 'package:tools_for_you/feature/unit_converter/presentation/ui/widget/unit_dropdown/provider/unit_dropdown_provider.dart';

part 'area_converter_provider.g.dart';

@riverpod
class AreaInput extends _$AreaInput {
  @override
  double build() => 1.0;

  void set(double value) => state = value;
}

@riverpod
double areaConverter(Ref ref) {
  final inputValue = ref.watch(inputValueProvider);
  final fromArea = ref.watch(fromAreaProvider);
  final toArea = ref.watch(toAreaProvider);

  return inputValue * fromArea.toBase / toArea.toBase;
}

@riverpod
List<UnitModel> unitsOfArea(Ref ref) => areaUnits;
