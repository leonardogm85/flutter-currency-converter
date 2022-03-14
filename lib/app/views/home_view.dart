import 'package:currency_converter/app/components/currency_box.dart';
import 'package:currency_converter/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(
      toText: toText,
      fromText: fromText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 30,
          right: 30,
          top: 100,
        ),
        child: ListView(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/logo.jpg',
              ),
              radius: 90,
            ),
            const SizedBox(
              height: 30,
            ),
            CurrencyBox(
              items: homeController.currencies,
              controller: homeController.toText,
              onChanged: (currency) {
                setState(() {
                  homeController.toCurrency = currency;
                });
              },
              selectedItem: homeController.toCurrency,
            ),
            const SizedBox(
              height: 10,
            ),
            CurrencyBox(
              items: homeController.currencies,
              controller: homeController.fromText,
              onChanged: (currency) {
                setState(() {
                  homeController.fromCurrency = currency;
                });
              },
              selectedItem: homeController.fromCurrency,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              ),
              onPressed: () {
                homeController.convert();
              },
              child: const Text('Converter'),
            ),
          ],
        ),
      ),
    );
  }
}
