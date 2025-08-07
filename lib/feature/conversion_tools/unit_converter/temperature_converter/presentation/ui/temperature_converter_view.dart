import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:tools_for_you/core/constant/app_string.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/core/widgets/textfield/k_textfield.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/temperature_converter/presentation/provider/temperature_converter_provider.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/presentation/ui/widget/temperature_dropdown/provider/temperature_dropdown_provider.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/presentation/ui/widget/temperature_dropdown/temperature_dropdown.dart';

class TemperatureConverterView extends ConsumerStatefulWidget {
  const TemperatureConverterView({super.key});

  @override
  ConsumerState<TemperatureConverterView> createState() =>
      _TemperatureConverterViewState();
}

class _TemperatureConverterViewState
    extends ConsumerState<TemperatureConverterView> {
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
    final units = ref.watch(tempUnitsProvider);

    final fromTemp = ref.watch(fromTemperatureUnitProvider);
    final toTemp = ref.watch(toTemperatureUnitProvider);

    final converted = ref.watch(temperatureConverterProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Text(
          temperature,
          style: Theme.of(context)
              .textTheme
              .titleMedium
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
                ref.read(temperatureInputProvider.notifier).set(value);
              },
              controller: _fromUnitController,
            )),
            Expanded(
              child: TemperatureDropdown(
                units: units,
                value: fromTemp,
                onChanged: (unit) {
                  ref.read(fromTemperatureUnitProvider.notifier).set(unit);
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          spacing: 20,
          children: [
            Expanded(
              child: Icon(
                Icons.keyboard_double_arrow_down_sharp,
                size: 24,
              ),
            ),
            Spacer(),
          ],
        ),
        Row(
          spacing: 20,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: AppColor.kPrimary))),
                child: Center(
                  child: Text(
                    converted.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TemperatureDropdown(
                units: units,
                value: toTemp,
                onChanged: (unit) {
                  setState(() {
                    ref.read(toTemperatureUnitProvider.notifier).set(unit);
                  });
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
