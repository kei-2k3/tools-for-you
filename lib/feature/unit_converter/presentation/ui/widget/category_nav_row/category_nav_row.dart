import 'package:flutter/material.dart';
import 'package:tool_kit_hub/core/theme/app_color.dart';

class CategoryNavRow extends StatelessWidget {
  const CategoryNavRow(
      {super.key,
      required this.categories,
      required this.selected,
      required this.onSelected});
  final List<String> categories;
  final String selected;
  final void Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: categories.map((category) {
          final isSelected = category == selected;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ChoiceChip(
              label: Text(category),
              selected: isSelected,
              selectedColor: AppColor.kPrimary,
              backgroundColor: AppColor.kWhite,
              labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isSelected ? AppColor.kWhite : AppColor.kBlack,
                  ),
              onSelected: (_) => onSelected(category),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
