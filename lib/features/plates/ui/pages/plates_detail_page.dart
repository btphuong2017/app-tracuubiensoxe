import 'package:app_tracuubiensoxe/features/plates/ui/widgets/plates_infor_widget.dart';
import 'package:app_tracuubiensoxe/shared/app_scaffold.dart';
import 'package:flutter/material.dart';

class PlatesDetailPage extends StatelessWidget {
  const PlatesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Kết quả tra cứu 59N1-12345",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PlatesInforWidget(),
        ],
      ),
    );
  }
}
