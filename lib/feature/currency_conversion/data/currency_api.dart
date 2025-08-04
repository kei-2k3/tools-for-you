import 'dart:convert';

import 'package:tools_for_you/feature/currency_conversion/model/currency_model.dart';
import 'package:http/http.dart' as http;

class CurrencyApi {
  Future<ExchangeRates> getRates(String base) async {
    final url = Uri.parse(
        'http://api.exchangeratesapi.io/v1/latest?access_key=62b431f5333c604bad8bd2b15edc9bd5&base=$base');
    // Testing
    print('url from api: $url');
    final res = await http.get(url);

    print('Res from api: ${res.body}');

    if (res.statusCode == 200) {
      return ExchangeRates.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to fetch currency rates');
    }
  }
}
