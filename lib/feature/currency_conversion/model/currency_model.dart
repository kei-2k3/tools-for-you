class ExchangeRates {
  final String base;
  final Map<String, double> rates;

  ExchangeRates({required this.base, required this.rates});

  factory ExchangeRates.fromJson(Map<String, dynamic> json) {
    return ExchangeRates(
        base: json['base'], rates: Map<String, double>.from(json['rates']));
  }
}
