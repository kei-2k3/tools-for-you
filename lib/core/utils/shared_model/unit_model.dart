import 'package:tools_for_you/feature/unit_converter/area_converter/data/model/area_model.dart';
import 'package:tools_for_you/feature/unit_converter/length_converter/data/model/length_model.dart';
import 'package:tools_for_you/feature/unit_converter/temperature_converter/data/model/temperature_model.dart';
import 'package:tools_for_you/feature/unit_converter/volume_converter/data/model/volume_model.dart';

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

  CategoryModel({required this.name, required this.title, required this.units});
}

final List<CategoryModel> unitCategories = [
  CategoryModel(name: 'Length', title: 'Length Converter', units: lengthUnits),
  CategoryModel(
      name: 'Temperature',
      title: 'Temperature Converter',
      units: temperatureUnits),
  CategoryModel(name: 'Area', title: 'Area Converter', units: areaUnits),
  CategoryModel(name: 'Volume', title: 'Volume Converter', units: volumeUnits),
  // CategoryModel(name: 'Weight', units: weightUnits),
];
