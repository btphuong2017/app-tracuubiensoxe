import 'package:app_tracuubiensoxe/features/plates/data/models/plate_model.dart';
import 'package:flutter/material.dart';

class _InforItem extends StatelessWidget {
  _InforItem({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final labelStyle = theme.textTheme.labelSmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    final valueStyle = theme.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w700,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: labelStyle),
        Text(value, style: valueStyle),
      ],
    );
  }
}

class PlatesInforWidget extends StatelessWidget {
  const PlatesInforWidget({super.key, required this.plate});

  final Plate plate;

  static const Map<String, String> properties = {
    "province": "Tỉnh/Thành",
    "owner": "Chủ sở hữu",
    "company": "Hãng xe",
    "model": "Dòng xe",
  };

  @override
  Widget build(BuildContext context) {
    final keys = properties.keys.toList();

    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 0, left: 16, right: 16),
            child: Text(
              "Kết quả tra cứu biển số 59N1-12345",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          Padding(
            padding: EdgeInsets.only(top: 0, bottom: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                for (var i = 0; i < keys.length; i++) ...[
                  _InforItem(
                    label: properties[keys[i]]!,
                    value: plate[keys[i]],
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
