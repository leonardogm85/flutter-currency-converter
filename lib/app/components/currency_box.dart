import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  const CurrencyBox({
    Key? key,
    required this.items,
    required this.controller,
    required this.onChanged,
    required this.selectedItem,
  }) : super(key: key);

  final CurrencyModel selectedItem;
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final void Function(CurrencyModel) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: DropdownButton<CurrencyModel>(
            iconEnabledColor: Colors.amber,
            itemHeight: 65,
            isExpanded: true,
            underline: Container(
              height: 1,
              color: Colors.amber,
            ),
            value: selectedItem,
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item.name),
                  ),
                )
                .toList(),
            onChanged: (value) => onChanged(value!),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
