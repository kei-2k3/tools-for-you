import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/feature/unit_convertor/data/model/unit_model.dart';

class UnitDropdown extends ConsumerWidget {
  const UnitDropdown(
      {super.key, required this.units, this.value, this.onChanged});
  final List<LengthUnitModel> units;
  final LengthUnitModel? value;
  final ValueChanged<LengthUnitModel>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<LengthUnitModel>(
      isExpanded: true,
      value: value,
      icon: const Icon(Icons.arrow_drop_down),
      menuMaxHeight: 200,
      decoration: InputDecoration(
        //labelText: 'Choose Category',
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
              style: TextStyle(color: AppColor.kWhite),
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
              style: TextStyle(color: AppColor.kBlack),
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
