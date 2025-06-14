import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'area_converter_provider.g.dart';

@riverpod
class AreaInput extends _$AreaInput {
  @override
  double build() => 1.0;

  void set(double value) => state = value;
}