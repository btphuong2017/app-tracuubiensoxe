import 'package:app_tracuubiensoxe/features/plates/ui/widgets/plates_card_widget.dart';
import 'package:app_tracuubiensoxe/features/plates/ui/widgets/plates_list_widget.dart';
import 'package:app_tracuubiensoxe/features/plates/ui/widgets/plates_search_widget.dart';
import 'package:app_tracuubiensoxe/shared/app_scaffold.dart';
import 'package:flutter/material.dart';

class PlatesSearchPage extends StatelessWidget {
  const PlatesSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String appTitle = "Tra cứu biển số xe";
    return AppScaffold(
      title: appTitle,
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PlatesSearchWidget(),
          PlatesCardWidget(
            title: const Text("Tìm kiếm gần đây"),
            child: PlatesListWidget(),
          ),
          PlatesCardWidget(
            title: const Text("Xe tai nạn mới cập nhật"),
            child: PlatesListWidget(),
          ),
        ],
      ),
    );
  }
}
