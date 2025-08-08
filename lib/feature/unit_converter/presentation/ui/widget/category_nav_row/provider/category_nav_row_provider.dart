import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tool_kit_hub/core/utils/shared/unit_model.dart';

part 'category_nav_row_provider.g.dart';

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  CategoryModel build() => unitCategories.first;

  void set(CategoryModel category) => state = category;
}
