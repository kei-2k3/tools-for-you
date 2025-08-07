import 'package:tools_for_you/feature/conversion_tools/unit_converter/area_converter/data/model/area_model.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/length_converter/data/model/length_model.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/temperature_converter/data/model/temperature_model.dart';
import 'package:tools_for_you/feature/conversion_tools/unit_converter/volume_converter/data/model/volume_model.dart';

class UnitModel {
  final String name;
  final double toBase;

  UnitModel({required this.name, required this.toBase});
}

///Category
class CategoryModel {
  final String name;
  final String title;
  final List units;
  final String guide;

  CategoryModel(
      {required this.name,
      required this.title,
      required this.units,
      required this.guide});
}

final List<CategoryModel> unitCategories = [
  CategoryModel(
    name: 'Length',
    title: 'LENGTH CONVERTER',
    units: lengthUnits,
    guide: '''
The Length Converter allows you to effortlessly convert between various units of distance, including meters, kilometers, miles, feet, inches, and more. It’s ideal for tasks ranging from everyday measurements to academic or professional use in science, construction, and travel. Simply input your value, choose the source and target units, and the tool will provide an accurate result instantly.''',
  ),
  CategoryModel(
    name: 'Temperature',
    title: 'Temperature Converter',
    units: temperatureUnits,
    guide: '''
The Temperature Converter helps you switch between Celsius, Fahrenheit, and Kelvin with ease. Since temperature conversions involve formulas rather than simple ratios, this tool eliminates the need for manual calculation. Whether you're comparing weather data or conducting a science experiment, the converter ensures accurate and instant results.''',
  ),
  CategoryModel(
    name: 'Area',
    title: 'Area Converter',
    units: areaUnits,
    guide: '''
The Area Converter is a useful tool for converting surface measurements between units such as square meters, square feet, acres, and hectares. Perfect for land surveys, floor plans, or academic work, it streamlines the conversion process with a simple interface and reliable precision. Just enter your value and select the appropriate units to get the converted area.''',
  ),
  CategoryModel(
    name: 'Volume',
    title: 'Volume Converter',
    units: volumeUnits,
    guide: '''
The Volume Converter enables quick conversion between units like liters, milliliters, cubic meters, gallons, and more. It’s especially useful for cooking, science, or logistics where volume plays a critical role. With this tool, you can confidently switch between metric and imperial units without the need to memorize conversion factors.''',
  ),
  // CategoryModel(name: 'Weight', units: weightUnits),
];
