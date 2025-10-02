import 'package:app_tracuubiensoxe/features/plates/ui/pages/plates_detail_page.dart';
import 'package:app_tracuubiensoxe/features/plates/ui/widgets/plates_infor_widget.dart';
import 'package:flutter/material.dart';

class PlatesListWidget extends StatelessWidget {
  PlatesListWidget({super.key});

  final List<String> plates = [
    "51N1-12341",
    "51N1-12341",
    "51N1-12341",
    "51N1-12341",
    "51N1-12341",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      padding: EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: 3,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: plates.length,
      itemBuilder: (context, index) {
        final plate = plates[index];

        return Material(
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              print(plate);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlatesDetailPage(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  plate,
                  style: const TextStyle(
                    color: Colors.black, // đọc được trên nền đen
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
