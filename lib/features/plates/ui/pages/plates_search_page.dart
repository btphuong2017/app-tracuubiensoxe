import 'package:app_tracuubiensoxe/features/plates/data/plates_repository.dart';
import 'package:app_tracuubiensoxe/features/plates/ui/widgets/plates_recent_widget.dart';
import 'package:app_tracuubiensoxe/features/plates/ui/widgets/plates_search_widget.dart';
import 'package:app_tracuubiensoxe/shared/app_scaffold.dart';
import 'package:flutter/material.dart';

class PlatesSearchPage extends StatefulWidget {
  const PlatesSearchPage({super.key, required this.platesRepository});

  final PlatesRepository platesRepository;

  @override
  State<StatefulWidget> createState() {
    return _PlateSearchPageState();
  }
}

class _PlateSearchPageState extends State<PlatesSearchPage> {
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
          PlatesRecentWidget(platesRepository: widget.platesRepository),
          // PlatesCardWidget(
          //   title: const Text("Xe tai nạn mới cập nhật"),
          //   child: PlatesListWidget(),
          // ),
        ],
      ),
    );
  }
}
