import 'package:flutter/material.dart';
import 'package:tool_kit_hub/core/enums/tool_types.dart';
import 'package:tool_kit_hub/feature/bmi_calculator/presentation/ui/bmi_calculator_view.dart';
import 'package:tool_kit_hub/feature/percentage_calculator/presentation/ui/percentage_calculator_view.dart';
import 'package:tool_kit_hub/feature/unit_converter/presentation/ui/unit_converter_view.dart';

extension ToolTypesExtension on ToolTypes {
  String get title {
    switch (this) {
      case ToolTypes.percentageCalculator:
        return 'Percentage Calculator';
      case ToolTypes.bmiCalculator:
        return 'BMI Calculator';
      case ToolTypes.unitConverter:
        return 'Unit Converter';
    }
  }

  Widget get view {
    switch (this) {
      case ToolTypes.percentageCalculator:
        return const PercentageCalculatorView();
      case ToolTypes.bmiCalculator:
        return const BmiCalculatorView();
      case ToolTypes.unitConverter:
        return const UnitConverterView();
    }
  }
}
