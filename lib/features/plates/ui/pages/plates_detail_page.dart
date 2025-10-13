import 'package:app_tracuubiensoxe/features/plates/data/models/plate_model.dart';
import 'package:app_tracuubiensoxe/features/plates/data/plates_remote_datasource.dart';
import 'package:app_tracuubiensoxe/features/plates/data/plates_repository.dart';
import 'package:app_tracuubiensoxe/features/plates/ui/widgets/plates_infor_widget.dart';
import 'package:app_tracuubiensoxe/shared/app_scaffold.dart';
import 'package:flutter/material.dart';

class PlatesDetailPage extends StatefulWidget {
  const PlatesDetailPage({
    super.key,
    required this.plateNumber,
    required this.platesRepository,
  });

  final String plateNumber;
  final PlatesRepository platesRepository;

  @override
  State<StatefulWidget> createState() => _PlatesDetailPageState();
}

class _PlatesDetailPageState extends State<PlatesDetailPage> {
  late Future<Plate> futurePlate;

  @override
  void initState() {
    super.initState();

    futurePlate = widget.platesRepository.findPlate(widget.plateNumber);
  }

  Future<dynamic> _forceSync() async {
    setState(() {
      futurePlate = widget.platesRepository.findPlate(
        widget.plateNumber,
        forceSync: true,
      );
    });
    await futurePlate;
  }

  @override
  Widget build(BuildContext context) {
    final plateNo = widget.plateNumber;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kết quả tra cứu $plateNo",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _forceSync,
        child: FutureBuilder(
          future: futurePlate,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 200),
                  Center(child: CircularProgressIndicator()),
                  SizedBox(height: 200),
                ],
              );
            }

            if (snapshot.hasError) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [Text('${snapshot.error}')],
              );
            }

            final plate = snapshot.data!;
            return ListView(
              physics:
                  const AlwaysScrollableScrollPhysics(), // vẫn kéo được kể cả ít nội dung
              padding: const EdgeInsets.all(16),
              children: [
                PlatesInforWidget(plate: plate),
                const SizedBox(height: 16),
                // bạn có thể thêm các section khác ở đây...
              ],
            );
          },
        ),
      ),
    );
  }
}
