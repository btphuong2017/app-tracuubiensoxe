import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app_tracuubiensoxe/app/http_client.dart';
import 'package:http/http.dart' as http;
import "package:app_tracuubiensoxe/features/plates/data/models/plate_model.dart";

class PlatesRemoteDatasource {
  PlatesRemoteDatasource({required this.client});

  final String baseUrl = 'http://10.0.2.2:3000';
  final http.Client client;

  Uri _buildUri(String plateNo) {
    final normalized = plateNo.trim().toUpperCase();
    final base = Uri.parse(baseUrl);
    // giả sử endpoint là /plates/:plateNo
    return base.replace(
      pathSegments: [
        ...base.pathSegments.where((s) => s.isNotEmpty),
        'plates',
        normalized, // đã normalize ở repository trước khi gọi
      ],
    );
  }

  Future<Plate> findPlate(String plateNo) async {
    await Future.delayed(Duration(seconds: 1));

    final uri = _buildUri(plateNo);

    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 8));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        final data = body['data'];
        if (data is! Map<String, dynamic>) {
          throw Exception('Response payload invalid');
        }

        return Plate.fromJson(data);
      }

      // Lỗi có thể không phải JSON
      String message;
      try {
        message =
            (jsonDecode(response.body) as Map<String, dynamic>)['message']
                ?.toString() ??
            'Failed to load Plate';
      } catch (_) {
        message = 'Failed to load Plate (code ${response.statusCode})';
      }
      throw Exception(message);
    } on TimeoutException {
      throw Exception('Request timed out');
    }
  }
}
