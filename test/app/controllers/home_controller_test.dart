import 'package:currency_converter/app/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  final HomeController homeController = HomeController(
    toText: toText,
    fromText: fromText,
  );

  test('Deve converter de Real para Dolar com vírgula', () {
    toText.text = '2,0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test('Deve converter de Real para Dolar com ponto', () {
    toText.text = '2.0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test('Deve converter de Dolar para Real', () {
    toText.text = '1';
    homeController.toCurrency = homeController.currencies[1];
    homeController.fromCurrency = homeController.currencies[0];
    homeController.convert();
    expect(fromText.text, '5.65');
  });
}
