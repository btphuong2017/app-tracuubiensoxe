import 'package:app_tracuubiensoxe/features/plates/data/consts/plates_const.dart';
import 'package:app_tracuubiensoxe/features/plates/data/local/plates_cache.dart';
import 'package:app_tracuubiensoxe/features/plates/data/models/plate_model.dart';
import 'package:app_tracuubiensoxe/features/plates/data/plates_repository.dart';
import 'package:app_tracuubiensoxe/features/plates/ui/widgets/plates_card_widget.dart';
import 'package:app_tracuubiensoxe/features/plates/ui/widgets/plates_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

// class PlatesRecentWidget extends StatefulWidget {
//   const PlatesRecentWidget({super.key, required this.platesRepository});

//   final PlatesRepository platesRepository;

//   @override
//   createState() => _PlatesRecentWidgetState();
// }

// class _PlatesRecentWidgetState extends State<PlatesRecentWidget> {
//   late final PlatesCache platesCache;

//   List<Plate> recentPlates = [];

//   @override
//   void initState() {
//     super.initState();
//     _initData();
//   }

//   Future<void> _initData() async {
//     platesCache = PlatesCache(Hive.box('plates_cache_v1'));
//     final entries = platesCache.listAll();
//     if (!mounted) return;
//     setState(() {
//       recentPlates = entries.map((e) => e.plate).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PlatesCardWidget(
//       title: const Text("Tìm kiếm gần đây"),
//       child: recentPlates.isNotEmpty
//           ? PlatesListWidget(plates: recentPlates)
//           : Text("Chưa có kết quả nào"),
//     );
//   }
// }

class PlatesRecentWidget extends StatelessWidget {
  const PlatesRecentWidget({super.key, required this.platesRepository});

  final PlatesRepository platesRepository;

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<String>(plateCacheBox);

    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, box, _) {
        final cache = PlatesCache(box);
        final entries = cache.listAll();
        final recentPlates = entries.map((entry) => entry.plate).toList();

        return PlatesCardWidget(
          title: const Text('Tìm kiếm gần đây'),
          child: recentPlates.isNotEmpty
              ? PlatesListWidget(plates: recentPlates)
              : const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Chưa có kết quả nào'),
                ),
        );
      },
    );
  }
}
