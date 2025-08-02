import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools_for_you/core/utils/shared/unit_model.dart';
import 'package:tools_for_you/feature/unit_converter/length_converter/presentation/provider/length_converter_provider.dart';
import 'package:tools_for_you/feature/unit_converter/presentation/ui/widget/unit_dropdown/provider/unit_dropdown_provider.dart';
import 'package:tools_for_you/feature/unit_converter/volume_converter/data/model/volume_model.dart';

part 'volume_converter_provider.g.dart';

@riverpod
double volumeConverter(Ref ref) {
  final inputValue = ref.watch(inputValueProvider);
  final fromVolume = ref.watch(fromVolumeProvider);
  final toVolume = ref.watch(toVolumeProvider);

  return inputValue * fromVolume.toBase / toVolume.toBase;
}

@riverpod
List<UnitModel> unitsOfVolume(Ref ref) => volumeUnits;
