import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tools_for_you/core/constant/app_string.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/core/utils/extensions/context_extension.dart';
import 'package:tools_for_you/core/utils/shared/unit_model.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/area_converter/presentation/ui/area_converter_view.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/length_converter/presentation/ui/length_converter_view.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/temperature_converter/presentation/ui/temperature_converter_view.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/volume_converter/presentation/ui/volume_converter_view.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/presentation/ui/widget/category_nav_row/category_nav_row.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/presentation/ui/widget/category_nav_row/provider/category_nav_row_provider.dart';

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

    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 20,
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
            child: isMobile
                ? Column(
                    spacing: 20,
                    children: [
                      _buildConverter(context, selected),
                      _buildGuideBox(context, selected)
                    ],
                  )
                : Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildConverter(context, selected),
                      ),
                      Expanded(
                        child: _buildGuideBox(context, selected),
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Container _buildGuideBox(BuildContext context, CategoryModel selected) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.kLessDarkBG,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            guide,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColor.kPrimary),
          ),
          Text(
            selected.guide,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Container _buildConverter(BuildContext context, CategoryModel selected) {
    return Container(
      width: context.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.kLessDarkBG,
      ),
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: _buildConverterWidget(selected.name),
      ),
    );
  }
}
