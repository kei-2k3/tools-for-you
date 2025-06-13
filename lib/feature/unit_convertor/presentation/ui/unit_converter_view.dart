import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/core/utils/extensions/context_extension.dart';
import 'package:tools_for_you/core/utils/extensions/unit_format_extension.dart';
import 'package:tools_for_you/core/widgets/textfield/k_textfield.dart';
import 'package:tools_for_you/feature/unit_convertor/data/model/unit_model.dart';
import 'package:tools_for_you/feature/unit_convertor/presentation/providers/;ength_converter_provider/length_converter_provider.dart';
import 'package:tools_for_you/feature/unit_convertor/presentation/ui/widget/category_nav_row/category_nav_row.dart';
import 'package:tools_for_you/feature/unit_convertor/presentation/ui/widget/category_nav_row/provider/category_nav_row_provider.dart';
import 'package:tools_for_you/feature/unit_convertor/presentation/ui/widget/unit_dropdown/provider/unit_dropdown_provider.dart';
import 'package:tools_for_you/feature/unit_convertor/presentation/ui/widget/unit_dropdown/unit_dropdown.dart';

class UnitConverterView extends ConsumerStatefulWidget {
  const UnitConverterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UnitConverterViewState();
}

class _UnitConverterViewState extends ConsumerState<UnitConverterView> {
  final TextEditingController _fromUnitController =
      TextEditingController(text: '1.0');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _fromUnitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final units = ref.watch(unitsProvider);
    final converted = ref.watch(lengthConverterProvider);

    final fromUnit = ref.watch(fromUnitProvider);
    final toUnit = ref.watch(toUnitProvider);

    final selected = ref.watch(selectedCategoryProvider);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CategoryNavRow(
            categories: unitCategories.map((e) => e.name).toList(),
            selected: selected.name,
            onSelected: (value) {
              final matched = unitCategories.firstWhere((e) => e.name == value);
              ref.read(selectedCategoryProvider.notifier).set(matched);
            },
          ),
          Expanded(
            child: Center(
              child: Container(
                color: AppColor.kLessDarkBG,
                width: context.screenWidth * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        selected.title,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: AppColor.kPrimary),
                      ),
                      const Gap(10),
                      Row(
                        spacing: 20,
                        children: [
                          Expanded(
                              child: KTextfield(
                            onChanged: (val) {
                              final value = double.tryParse(val) ?? 0.0;
                              ref.read(inputValueProvider.notifier).set(value);
                            },
                            controller: _fromUnitController,
                          )),
                          SizedBox(
                            width: 120,
                            child: UnitDropdown(
                              units: units,
                              value: fromUnit,
                              onChanged: (unit) {
                                ref.read(fromUnitProvider.notifier).set(unit);
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Expanded(
                            child: Icon(
                              Icons.keyboard_double_arrow_down_sharp,
                              size: 24,
                            ),
                          ),
                          Gap(120),
                        ],
                      ),
                      Row(
                        spacing: 20,
                        children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: AppColor.kPrimary))),
                            child: Center(
                                child: Text(
                              converted.format(from: fromUnit, to: toUnit),
                              style: Theme.of(context).textTheme.displayMedium,
                            )),
                          )),
                          SizedBox(
                            width: 120,
                            child: UnitDropdown(
                              units: units,
                              value: toUnit,
                              onChanged: (unit) {
                                setState(() {
                                  ref.read(toUnitProvider.notifier).set(unit);
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
