import 'package:flutter/material.dart';

class PlatesInforWidget extends StatelessWidget {
  final _labelStyle = TextStyle(fontSize: 12, color: Colors.grey.shade600);
  final _contentStyle = TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
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
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                fontWeight: FontWeight.bold,
              ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tỉnh/Thành", style: _labelStyle),
                    Text("Ninh Bình", style: _contentStyle),
                  ],
                ),
                Divider(
                  height: 1,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Chủ sở hữu", style: _labelStyle),
                    Text("Thông tin mật", style: _contentStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
