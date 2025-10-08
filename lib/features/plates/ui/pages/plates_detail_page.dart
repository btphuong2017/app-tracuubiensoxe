import 'package:app_tracuubiensoxe/features/plates/data/models/plate_model.dart';
import 'package:app_tracuubiensoxe/features/plates/data/plates_remote_datasource.dart';
import 'package:app_tracuubiensoxe/features/plates/ui/widgets/plates_infor_widget.dart';
import 'package:app_tracuubiensoxe/shared/app_scaffold.dart';
import 'package:flutter/material.dart';

class PlatesDetailPage extends StatefulWidget {
  const PlatesDetailPage({super.key, required this.plateNumber});

  final String plateNumber;

  @override
  State<StatefulWidget> createState() => _PlatesDetailPageState();
}

class _PlatesDetailPageState extends State<PlatesDetailPage> {
  late Future<Plate> futurePlate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    futurePlate = findPlate(widget.plateNumber);
  }

  @override
  Widget build(BuildContext context) {
    final plateNo = widget.plateNumber;

    return AppScaffold(
      title: "Kết quả tra cứu $plateNo",
      child: Center(
        child: FutureBuilder(
          future: futurePlate,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [PlatesInforWidget(plate: snapshot.data!)],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
