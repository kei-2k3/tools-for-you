import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/core/utils/extensions/context_extension.dart';
import 'package:tools_for_you/core/utils/shared_model/unit_model.dart';
import 'package:tools_for_you/feature/unit_converter/area_converter/presentation/ui/area_converter_view.dart';
import 'package:tools_for_you/feature/unit_converter/length_converter/presentation/ui/length_converter_view.dart';
import 'package:tools_for_you/feature/unit_converter/temperature_converter/presentation/ui/temperature_converter_view.dart';
import 'package:tools_for_you/feature/unit_converter/volume_converter/presentation/ui/volume_converter_view.dart';
import 'package:tools_for_you/feature/unit_converter/presentation/ui/widget/category_nav_row/category_nav_row.dart';
import 'package:tools_for_you/feature/unit_converter/presentation/ui/widget/category_nav_row/provider/category_nav_row_provider.dart';

class UnitConverterView extends ConsumerStatefulWidget {
  const UnitConverterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UnitConverterViewState();
}

class _UnitConverterViewState extends ConsumerState<UnitConverterView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildConverterWidget(String name) {
    switch (name) {
      case 'Length':
        return const LengthConverterView();
      case 'Temperature':
        return const TemperatureConverterView();
      case 'Area':
        return const AreaConverterView();
      case 'Volume':
        return const VolumeConverterView();
      default:
        return const Center(child: Text('Converter not available'));
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  child: _buildConverterWidget(selected.name),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
