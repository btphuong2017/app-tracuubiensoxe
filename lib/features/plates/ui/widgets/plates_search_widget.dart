import 'dart:async';
import 'package:app_tracuubiensoxe/features/plates/data/enums/plates_enum.dart';
import 'package:flutter/material.dart';

class PlatesSearchWidget extends StatefulWidget {
  const PlatesSearchWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PlatesSearchWidgetState();
}

class _PlatesSearchWidgetState extends State<PlatesSearchWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? plateNumber;
  VehicleType? vehicleType = VehicleType.motobike;
  Timer? _debounce;

  void setVehicleType(VehicleType? value) => setState(() {
    vehicleType = value;
  });

  void submit() {
    print(plateNumber);
    print(vehicleType);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        spacing: 16,
        children: [
          TextFormField(
            onChanged: (String? value) {
              setState(() {
                plateNumber = value;
              });
            },
            textCapitalization: TextCapitalization.characters,
            decoration: const InputDecoration(
              hintText: "51N9-12345",
              labelText: "Nhập biển số xe cần tra cứu",
            ),
            initialValue: plateNumber,
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
          RadioGroup(
            groupValue: vehicleType,
            onChanged: setVehicleType,
            child: Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    value: VehicleType.motobike,
                    title: const Text("Xe Máy"),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: VehicleType.car,
                    title: const Text("Xe Ôtô"),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                submit();
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
