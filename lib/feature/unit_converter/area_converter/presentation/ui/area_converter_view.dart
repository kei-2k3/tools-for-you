import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/core/utils/extensions/unit_format_extension.dart';
import 'package:tools_for_you/core/widgets/textfield/k_textfield.dart';
import 'package:tools_for_you/feature/unit_converter/area_converter/presentation/provider/area_converter_provider.dart';
import 'package:tools_for_you/feature/unit_converter/length_converter/presentation/provider/length_converter_provider.dart';
import 'package:tools_for_you/feature/unit_converter/presentation/ui/widget/unit_dropdown/provider/unit_dropdown_provider.dart';
import 'package:tools_for_you/feature/unit_converter/presentation/ui/widget/unit_dropdown/unit_dropdown.dart';

class AreaConverterView extends ConsumerStatefulWidget {
  const AreaConverterView({super.key});

  @override
  ConsumerState<AreaConverterView> createState() => _AreaConverterViewState();
}

class _AreaConverterViewState extends ConsumerState<AreaConverterView> {
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
    final units = ref.watch(unitsOfAreaProvider);

    final fromUnit = ref.watch(fromAreaProvider);
    final toUnit = ref.watch(toAreaProvider);

    final converted = ref.watch(areaConverterProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Text(
          'Area Converter',
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
              width: 200,
              child: UnitDropdown(
                units: units,
                value: fromUnit,
                onChanged: (unit) {
                  ref.read(fromAreaProvider.notifier).set(unit);
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
                  border: Border(bottom: BorderSide(color: AppColor.kPrimary))),
              child: Center(
                  child: Text(
                converted.format(from: fromUnit, to: toUnit),
                style: Theme.of(context).textTheme.displayMedium,
              )),
            )),
            SizedBox(
              width: 200,
              child: UnitDropdown(
                units: units,
                value: toUnit,
                onChanged: (unit) {
                  setState(() {
                    ref.read(toAreaProvider.notifier).set(unit);
                  });
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
