// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_converter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$temperatureConverterHash() =>
    r'3b399addfa5212cebc83824a92b2a0f6dfcb5b63';

/// See also [temperatureConverter].
@ProviderFor(temperatureConverter)
final temperatureConverterProvider = AutoDisposeProvider<double>.internal(
  temperatureConverter,
  name: r'temperatureConverterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$temperatureConverterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TemperatureConverterRef = AutoDisposeProviderRef<double>;
String _$tempUnitsHash() => r'3a3c169dcaf93abb8b0f087ca5724920267839cf';

/// See also [tempUnits].
@ProviderFor(tempUnits)
final tempUnitsProvider =
    AutoDisposeProvider<List<TemperatureUnitModel>>.internal(
  tempUnits,
  name: r'tempUnitsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tempUnitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TempUnitsRef = AutoDisposeProviderRef<List<TemperatureUnitModel>>;
String _$temperatureInputHash() => r'dbbc3bc3f0b8c4e57bbd5653ea68a6b02486adee';

/// See also [TemperatureInput].
@ProviderFor(TemperatureInput)
final temperatureInputProvider =
    AutoDisposeNotifierProvider<TemperatureInput, double>.internal(
  TemperatureInput.new,
  name: r'temperatureInputProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$temperatureInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TemperatureInput = AutoDisposeNotifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
