import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tool_kit_hub/core/enums/tool_types.dart';

part 'drawer_index_provider.g.dart';

@riverpod
class DrawerIndex extends _$DrawerIndex {
  @override
  ToolTypes build() => ToolTypes.percentageCalculator;

  void setIndex(ToolTypes index) => state = index;
}
