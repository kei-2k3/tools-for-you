import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_index_provider.g.dart';

@riverpod
class DrawerIndex extends _$DrawerIndex {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}
