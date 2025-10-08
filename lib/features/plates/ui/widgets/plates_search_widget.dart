import 'package:app_tracuubiensoxe/features/plates/data/enums/plates_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class PlatesSearchWidget extends StatefulWidget {
  const PlatesSearchWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PlatesSearchWidgetState();
}

class _PlatesSearchWidgetState extends State<PlatesSearchWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _plateNumber;
  VehicleType _vehicleType = VehicleType.motobike;

  void _setVehicleType(VehicleType? value) {
    _formKey.currentState!.validate();
    setState(() {
      _vehicleType = value!;
    });
  }

  void _submit(BuildContext context) {
    print((plateNumber: _plateNumber, vehicleType: _vehicleType));
    context.go(Uri(path: "/plate/$_plateNumber").toString());
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
                _plateNumber = value;
              });
            },
            onFieldSubmitted: (String? value) => _submit(context),
            textCapitalization: TextCapitalization.characters,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9-]')),
              UpperCaseTextFormatter(),
            ],
            decoration: const InputDecoration(
              hintText: "51N9-12345",
              labelText: "Nhập biển số xe cần tra cứu",
            ),
            initialValue: _plateNumber,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Mời nhập biển số xe';
              }

              final pattern = RegExp(_vehicleType.platePattern);
              final match = pattern.hasMatch(value);
              if (!match) {
                return 'Định dạng biển số xe không đúng';
              }

              return null;
            },
          ),
          RadioGroup(
            groupValue: _vehicleType,
            onChanged: _setVehicleType,
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
                _submit(context);
              }
            },
            icon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: Text(
              "Tra cứu",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
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

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}
