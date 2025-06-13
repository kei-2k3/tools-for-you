import 'package:flutter/foundation.dart';

/// Length
class LengthUnitModel {
  final String name;
  final double toMeter;

  LengthUnitModel({required this.name, required this.toMeter});
}

final List<LengthUnitModel> lengthUnits = [
  LengthUnitModel(name: 'Meter', toMeter: 1.0),
  LengthUnitModel(name: 'Kilometer', toMeter: 1000.0),
  LengthUnitModel(name: 'Centimeter', toMeter: 0.01),
  LengthUnitModel(name: 'Millimeter', toMeter: 0.001),
  LengthUnitModel(name: 'Inch', toMeter: 0.0254),
  LengthUnitModel(name: 'Foot', toMeter: 0.3048),
  LengthUnitModel(name: 'Yard', toMeter: 0.9144),
  LengthUnitModel(name: 'Mile', toMeter: 1609.34),
];

/// Temperature
enum TemperatureUnit { celsius, fahrenheit, kelvin }

class TemperatureUnitModel {
  final String name;
  final TemperatureUnit unit;

  const TemperatureUnitModel({required this.name, required this.unit});
}

final List<TemperatureUnitModel> temperatureUnits = [
  TemperatureUnitModel(name: 'Celsius', unit: TemperatureUnit.celsius),
  TemperatureUnitModel(name: 'Fahrenheit', unit: TemperatureUnit.fahrenheit),
  TemperatureUnitModel(name: 'Kelvin', unit: TemperatureUnit.kelvin),
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
  CategoryModel(name: 'Area', title: 'Area Converter', units: temperatureUnits),
  CategoryModel(
      name: 'Volume', title: 'Volume Converter', units: temperatureUnits),
  // CategoryModel(name: 'Weight', units: weightUnits),
];
