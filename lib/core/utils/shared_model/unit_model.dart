import 'package:tools_for_you/feature/unit_converter/length_converter/data/model/length_model.dart';
import 'package:tools_for_you/feature/unit_converter/temperature_converter/data/model/temperature_model.dart';

class UnitModel {
  final String name;
  final double toBase;

  UnitModel({required this.name, required this.toBase});
}

/// Area
final List<UnitModel> areaUnits = [
  UnitModel(name: 'Square Meter', toBase: 1.0),
  UnitModel(name: 'Square Kilometer', toBase: 1e6),
  UnitModel(name: 'Square Centimeter', toBase: 0.0001),
  UnitModel(name: 'Square Millimeter', toBase: 0.000001),
  UnitModel(name: 'Square Mile', toBase: 2_589_988.11),
  UnitModel(name: 'Square Yard', toBase: 0.836127),
  UnitModel(name: 'Square Foot', toBase: 0.092903),
  UnitModel(name: 'Square Inch', toBase: 0.00064516),
  UnitModel(name: 'Acre', toBase: 4046.856),
  UnitModel(name: 'Hectare', toBase: 10000.0),
];

/// Volume
final List<UnitModel> volumeUnits = [
  UnitModel(name: 'Cubic Meter', toBase: 1.0),
  UnitModel(name: 'Cubic Kilometer', toBase: 1e9),
  UnitModel(name: 'Cubic Centimeter', toBase: 1e-6),
  UnitModel(name: 'Cubic Millimeter', toBase: 1e-9),
  UnitModel(name: 'Liter', toBase: 0.001),
  UnitModel(name: 'Milliliter', toBase: 0.000001),
  UnitModel(name: 'Cubic Yard', toBase: 0.764555),
  UnitModel(name: 'Cubic Foot', toBase: 0.0283168),
  UnitModel(name: 'Cubic Inch', toBase: 0.0000163871),
  UnitModel(name: 'Gallon (US)', toBase: 0.00378541),
  UnitModel(name: 'Pint (US)', toBase: 0.000473176),
];

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
  CategoryModel(
      name: 'Volume', title: 'Volume Converter', units: volumeUnits),
  // CategoryModel(name: 'Weight', units: weightUnits),
];
