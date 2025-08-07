import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/theme/app_color.dart';

class CategoryDropdown extends ConsumerWidget {
  const CategoryDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> category = [
      'Length',
      'Weight',
      'Time',
    ];

    String selectedCategory =
        category.first; // For demo; should use Riverpod state

    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: selectedCategory,
      icon: const Icon(Icons.arrow_drop_down),
      menuMaxHeight: 200,
      decoration: InputDecoration(
        
        floatingLabelStyle: TextStyle(color: AppColor.kPrimary),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.kPrimary),
        ),
      ),
      selectedItemBuilder: (context) {
        return category.map((item) {
          return Center(
            child: Text(
              item,
              style: TextStyle(color: AppColor.kWhite),
            ),
          );
        }).toList();
      },
      items: category.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Center(
            child: Text(
              item,
              style: TextStyle(color: AppColor.kBlack),
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        
        if (value != null) {
          
          print('Selected: $value');
        }
      },
    );
  }
}
