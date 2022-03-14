import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final List<CurrencyModel> currencies = CurrencyModel.getCurrencies();

  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({
    required this.toText,
    required this.fromText,
  }) {
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text) ?? 1;

    double result = 0;

    switch (fromCurrency.name) {
      case 'Real':
        result = value * toCurrency.real;
        break;
      case 'Dolar':
        result = value * toCurrency.dolar;
        break;
      case 'Euro':
        result = value * toCurrency.euro;
        break;
      case 'Bitcoin':
        result = value * toCurrency.bitcoin;
        break;
    }

    toText.text = value.toStringAsFixed(2);
    fromText.text = result.toStringAsFixed(2);
  }
}
