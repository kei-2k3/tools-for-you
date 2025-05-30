import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toggle_provider.g.dart';

@riverpod
class Toggle extends _$Toggle {
  @override
  bool build() => false;

  void toggle() => state = !state;
}
