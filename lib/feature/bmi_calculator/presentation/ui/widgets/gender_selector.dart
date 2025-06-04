import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/feature/bmi_calculator/data/model/user_input_model.dart';
import 'package:tools_for_you/feature/bmi_calculator/presentation/provider/bmi_provider.dart';

class GenderSelector extends ConsumerWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gender = ref.watch(bmiCalculatorProvider).gender;
    final notifier = ref.read(bmiCalculatorProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 12,
      children: Gender.values.map((g) {
        final isSelected = g == gender;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isSelected ? AppColor.kPrimary : AppColor.kLessDarkBG,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ChoiceChip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    g == Gender.male ? Icons.male : Icons.female,
                    key: ValueKey(isSelected),
                    color: isSelected ? AppColor.kWhite : AppColor.kPrimary,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  g.name.toUpperCase(),
                  style: TextStyle(
                    color: isSelected ? AppColor.kWhite : AppColor.kPrimary,
                  ),
                ),
              ],
            ),
            backgroundColor: AppColor.kLessDarkBG,
            selectedColor: AppColor.kPrimary,
            selected: isSelected,
            onSelected: (_) => notifier.setGender(g),
            showCheckmark: false,
          ),
        );
      }).toList(),
    );
  }
}
