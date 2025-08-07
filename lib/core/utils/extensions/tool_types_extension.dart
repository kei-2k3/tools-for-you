import 'package:flutter/material.dart';
import 'package:tools_for_you/core/enums/tool_types.dart';
import 'package:tools_for_you/feature/calculation_tools/bmi_calculator/presentation/ui/bmi_calculator_view.dart';
import 'package:tools_for_you/feature/calculation_tools/percentage_calculator/presentation/ui/percentage_calculator_view.dart';
import 'package:tools_for_you/feature/conversion_tools/timezone_converter/presentation/timezone_converter_view.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/presentation/ui/unit_converter_view.dart';

extension ToolTypesExtension on ToolTypes {
  String get title {
    switch (this) {
      case ToolTypes.percentageCalculator:
        return 'Percentage Calculator';
      case ToolTypes.bmiCalculator:
        return 'BMI Calculator';
      case ToolTypes.unitConverter:
        return 'Unit Converter';
      case ToolTypes.timezoneConverter:
        return 'Timezone Converter';
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
      case ToolTypes.timezoneConverter:
        return const TimezoneConverterView();
    }
  }
}
