// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currencyApiHash() => r'20399ac60f74c9ccf88d525f4743e580a66067e0';

/// See also [currencyApi].
@ProviderFor(currencyApi)
final currencyApiProvider = AutoDisposeProvider<CurrencyApi>.internal(
  currencyApi,
  name: r'currencyApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currencyApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrencyApiRef = AutoDisposeProviderRef<CurrencyApi>;
String _$currencyRatesHash() => r'2c3951699fa93b7e8725939fec31a5fd39a61a00';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [currencyRates].
@ProviderFor(currencyRates)
const currencyRatesProvider = CurrencyRatesFamily();

/// See also [currencyRates].
class CurrencyRatesFamily extends Family<AsyncValue<ExchangeRates>> {
  /// See also [currencyRates].
  const CurrencyRatesFamily();

  /// See also [currencyRates].
  CurrencyRatesProvider call(
    String base,
  ) {
    return CurrencyRatesProvider(
      base,
    );
  }

  @override
  CurrencyRatesProvider getProviderOverride(
    covariant CurrencyRatesProvider provider,
  ) {
    return call(
      provider.base,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'currencyRatesProvider';
}

/// See also [currencyRates].
class CurrencyRatesProvider extends AutoDisposeFutureProvider<ExchangeRates> {
  /// See also [currencyRates].
  CurrencyRatesProvider(
    String base,
  ) : this._internal(
          (ref) => currencyRates(
            ref as CurrencyRatesRef,
            base,
          ),
          from: currencyRatesProvider,
          name: r'currencyRatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currencyRatesHash,
          dependencies: CurrencyRatesFamily._dependencies,
          allTransitiveDependencies:
              CurrencyRatesFamily._allTransitiveDependencies,
          base: base,
        );

  CurrencyRatesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.base,
  }) : super.internal();

  final String base;

  @override
  Override overrideWith(
    FutureOr<ExchangeRates> Function(CurrencyRatesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrencyRatesProvider._internal(
        (ref) => create(ref as CurrencyRatesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        base: base,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ExchangeRates> createElement() {
    return _CurrencyRatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrencyRatesProvider && other.base == base;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, base.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CurrencyRatesRef on AutoDisposeFutureProviderRef<ExchangeRates> {
  /// The parameter `base` of this provider.
  String get base;
}

class _CurrencyRatesProviderElement
    extends AutoDisposeFutureProviderElement<ExchangeRates>
    with CurrencyRatesRef {
  _CurrencyRatesProviderElement(super.provider);

  @override
  String get base => (origin as CurrencyRatesProvider).base;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
