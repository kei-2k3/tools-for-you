import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools_for_you/feature/currency_conversion/data/currency_api.dart';
import 'package:tools_for_you/feature/currency_conversion/model/currency_model.dart';

part 'currency_provider.g.dart';

@riverpod
CurrencyApi currencyApi(Ref ref) => CurrencyApi();

@riverpod
Future<ExchangeRates> currencyRates(Ref ref, String base) {
  return ref.watch(currencyApiProvider).getRates(base);
}
  