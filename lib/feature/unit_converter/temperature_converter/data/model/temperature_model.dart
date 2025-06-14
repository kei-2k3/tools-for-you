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
