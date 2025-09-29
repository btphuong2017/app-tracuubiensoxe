import 'dart:async';

import 'package:flutter/material.dart';

class PlatesSearchWidget extends StatefulWidget {
  const PlatesSearchWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PlatesSearchWidgetState();
}

class _PlatesSearchWidgetState extends State<PlatesSearchWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? plateNumber;
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      onChanged: () {},
      child: Column(
        spacing: 16,
        children: [
          TextFormField(
            onSaved: (String? value) {
              plateNumber = value;
            },
            textCapitalization: TextCapitalization.characters,
            decoration: const InputDecoration(
              hintText: "51N9-12345",
              labelText: "Nhập biển số xe cần tra cứu",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Mời nhập biển số xe';
              }

              final pattern = RegExp(
                r'^\d{2}(?:[A-Za-z]{2}|[A-Za-z]\d)-\d{4,5}$',
              );
              final match = pattern.hasMatch(value);
              if (!match) {
                return 'Định dạng biển số xe không đúng';
              }

              return null;
            },
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                print(plateNumber);
              }
            },
            icon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: Text(
              "Tra cứu",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
