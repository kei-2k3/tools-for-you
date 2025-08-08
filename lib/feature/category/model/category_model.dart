

import 'package:tool_kit_hub/core/enums/tool_categories.dart';
import 'package:tool_kit_hub/core/enums/tool_types.dart';

class ToolModel {
  final String name;
  final String iconName;
  final ToolTypes route;
  final int itemNo;

  ToolModel({
    required this.name,
    required this.iconName,
    required this.route,
    required this.itemNo,
  });
}

class CategoryModel {
  final ToolCategories title;
  final List<ToolModel> tools;

  CategoryModel({
    required this.title,
    required this.tools,
  });
}

final List<CategoryModel> categories = [
  CategoryModel(
    title: ToolCategories.calculation,
    tools: [
      ToolModel(
        name: 'Percentage Calculator',
        iconName: 'percent',
        route: ToolTypes.percentageCalculator,
        itemNo: 0,
      ),
      ToolModel(
        name: 'BMI Calculator',
        iconName: 'weightScale',
        route: ToolTypes.bmiCalculator,
        itemNo: 1,
      ),
      // ToolModel(
      //   name: 'Loan Calculator',
      //   iconName: 'money-bill-trend-up',
      //   route: '/loan',
      // ),
    ],
  ),
  CategoryModel(
    title: ToolCategories.conversion,
    tools: [
      ToolModel(
        name: 'Unit Converter',
        iconName: 'rightLeft',
        route: ToolTypes.unitConverter,
        itemNo: 3,
      ),
      // ToolModel(
      //   name: 'Currency Converter',
      //   iconName: 'money-bill-1-wave',
      //   route: '/currency',
      // ),
      // ToolModel(
      //   name: 'Temperature Converter',
      //   iconName: 'temperature-half',
      //   route: '/temperature',
      // ),
    ],
  ),
];
