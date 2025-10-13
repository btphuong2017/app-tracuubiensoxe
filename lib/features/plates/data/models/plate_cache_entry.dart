import 'package:app_tracuubiensoxe/features/plates/data/models/plate_model.dart';

class PlateCacheEntry {
  final Plate plate;
  final DateTime cachedAt;

  const PlateCacheEntry({
    required this.plate,
    required this.cachedAt
  });

  Map<String, dynamic> toJson() {
    return {
      'plate': plate.toJson(),
      'cachedAt': cachedAt.toIso8601String(),
    };
  }

  factory PlateCacheEntry.fromJson(Map<String, dynamic> json) {
    return PlateCacheEntry(
      plate: Plate.fromJson(json['plate'] as Map<String, dynamic>),
      cachedAt: DateTime.parse(json['cachedAt'] as String),
    );
  }
}