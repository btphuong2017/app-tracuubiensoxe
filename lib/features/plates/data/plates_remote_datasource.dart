import 'dart:convert';

import 'package:http/http.dart' as http;
import "package:app_tracuubiensoxe/features/plates/data/models/plate_model.dart";

Future<Plate> findPlate(String plateNo) async {
  await Future.delayed(Duration(seconds: 1));

  final response = await http.get(
    Uri.parse("http://10.0.2.2:3000/plates/$plateNo"),
  );

  if (response.statusCode == 200) {
    return Plate.fromJson(jsonDecode(response.body)['data']);
  } else {
    throw Exception(jsonDecode(response.body)?['message'] ?? 'Failed to load Plate');
  }
}
