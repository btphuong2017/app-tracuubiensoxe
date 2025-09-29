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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [PlatesSearchWidget()],
      ),
    );
  }
}
