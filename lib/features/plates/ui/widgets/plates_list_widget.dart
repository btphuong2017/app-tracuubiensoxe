import 'package:app_tracuubiensoxe/features/plates/data/models/plate_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlatesListWidget extends StatelessWidget {
  const PlatesListWidget({super.key, required this.plates});

  final List<Plate> plates;

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
              context.go(Uri(path: "/plate/${plate.plateNo}").toString());
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  plate.plateNo,
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
