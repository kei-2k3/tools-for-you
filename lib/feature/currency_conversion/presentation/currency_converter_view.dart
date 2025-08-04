import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/feature/currency_conversion/provider/currency_provider.dart';

class CurrencyConverterView extends ConsumerStatefulWidget {
  const CurrencyConverterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CurrencyConverterViewState();
}

class _CurrencyConverterViewState extends ConsumerState<CurrencyConverterView> {
  String base = 'USD';
  String target = 'EUR';
  final baseController = TextEditingController(text: '1');
  final rateController = TextEditingController();
  bool isTypingBase = true;
  @override
  void initState() {
    super.initState();
    baseController.text = '1';
  }

  @override
  void dispose() {
    baseController.dispose();
    rateController.dispose();
    super.dispose();
  }

  void _onBaseChanged(String text, double rate) {
    if (!isTypingBase) return;

    final input = double.parse(text);
    print('input: $input');
    print('rate: $rate');
    final converted = input * rate;
    print(converted);
    isTypingBase = false;
    rateController.text = converted.toStringAsFixed(2);
    isTypingBase = true;
  }

  void _onRateChanged(String text, double rate) {
    if (isTypingBase) return;

    final input = double.parse(text);
    final converted = input / rate;
    isTypingBase = true;
    baseController.text = converted.toStringAsFixed(2);
    isTypingBase = false;
  }

  @override
  Widget build(BuildContext context) {
    final ratesAsync = ref.watch(currencyRatesProvider(base));

    // Testing
    print('base : $base');
    print('target : $target');
    print('baseControll: ${baseController.text}');
    print('rateControll: ${rateController.text}');

    return Padding(
      padding: const EdgeInsets.all(20),
      child: ratesAsync.when(
        data: (rates) {
          print('rates return: $rates');

          final rate = rates.rates[target] ?? 1.0;

          return Column(
            children: [
              DropdownButton<String>(
                value: base,
                items: ['USD', 'EUR', 'JPY', 'GBP'].map((code) {
                  return DropdownMenuItem(value: code, child: Text(code));
                }).toList(),
                onChanged: (val) => setState(() => base = val!),
              ),
              TextField(
                controller: baseController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount in $base'),
                onChanged: (text) {
                  if (text.trim().isEmpty) {
                    rateController.text = '';
                    return;
                  }
                  _onBaseChanged(text, rate);
                },
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: target,
                items: ['USD', 'EUR', 'JPY', 'GBP'].map((code) {
                  return DropdownMenuItem(value: code, child: Text(code));
                }).toList(),
                onChanged: (val) => setState(() => target = val!),
              ),
              TextField(
                controller: rateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount in $target'),
                onChanged: (text) {
                  if (text.trim().isEmpty) {
                    baseController.text = '';
                    return;
                  }
                  _onRateChanged(text, rate);
                },
              ),
              const SizedBox(height: 20),
              Text('1 $base = ${rate.toStringAsFixed(4)} $target'),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Text('Error: $e'),
      ),
    );
  }
}
