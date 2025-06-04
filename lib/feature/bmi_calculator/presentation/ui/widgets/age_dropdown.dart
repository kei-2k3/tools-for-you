import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/constant/app_string.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/feature/bmi_calculator/presentation/provider/bmi_provider.dart';

class AgeDropdown extends ConsumerWidget {
  const AgeDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final age = ref.watch(bmiCalculatorProvider).age;
    final notifier = ref.read(bmiCalculatorProvider.notifier);

    return DropdownButtonFormField<int>(
      value: age,
      menuMaxHeight: 200,
      decoration: InputDecoration(
        labelText: chooseYourAge,
        floatingLabelStyle: TextStyle(color: AppColor.kPrimary),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.kPrimary),
        ),
      ),
      selectedItemBuilder: (context) {
        return List.generate(
          101,
          (index) => Center(
            child: Text(
              index.toString(),
              style: TextStyle(
                color: AppColor.kWhite,
              ),
            ),
          ),
        );
      },
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      onChanged: (val) {
        if (val != null) notifier.setAge(val);
      },
      items: List.generate(
        101,
        (index) => DropdownMenuItem(
          value: index,
          child: Center(
            child: Text(
              index.toString(),
              style: TextStyle(
                color: AppColor.kBlack,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
