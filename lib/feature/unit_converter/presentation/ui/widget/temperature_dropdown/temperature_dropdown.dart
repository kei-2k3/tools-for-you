import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/feature/unit_converter/temperature_converter/data/model/temperature_model.dart';

class TemperatureDropdown extends ConsumerWidget {
  const TemperatureDropdown(
      {super.key, required this.units, this.value, this.onChanged});
  final List<TemperatureUnitModel> units;
  final TemperatureUnitModel? value;
  final ValueChanged<TemperatureUnitModel>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<TemperatureUnitModel>(
      isExpanded: true,
      value: value,
      icon: const Icon(Icons.arrow_drop_down),
      menuMaxHeight: 200,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: AppColor.kPrimary),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.kPrimary),
        ),
      ),
      selectedItemBuilder: (context) {
        return units.map((unit) {
          return Center(
            child: Text(
              unit.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }).toList();
      },
      items: units.map((unit) {
        return DropdownMenuItem(
          value: unit,
          child: Center(
            child: Text(
              unit.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColor.kBlack),
            ),
          ),
        );
      }).toList(),
      onChanged: (unit) {
        if (unit != null) onChanged!(unit);
      },
    );
  }
}
