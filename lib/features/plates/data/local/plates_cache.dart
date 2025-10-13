import 'dart:convert';

import 'package:app_tracuubiensoxe/features/plates/data/models/plate_cache_entry.dart';
import 'package:hive/hive.dart';
import '../models/plate_model.dart';

class PlatesCache {
  PlatesCache(this._box);

  final Box<String> _box;

  static const ttl = Duration(days: 7);
  static const maxItems = 6;

  String _key(String plateNo) => 'plate:${plateNo.trim().toUpperCase()}';

  Future<PlateCacheEntry?> findPlate(String plateNo) async {
    final raw = _box.get(_key(plateNo));

    if (raw == null) return null;

    final entry = PlateCacheEntry.fromJson(jsonDecode(raw));

    // TTL check
    if (DateTime.now().difference(entry.cachedAt) > ttl) {
      await _box.delete(_key(plateNo));
      return null;
    }

    return entry;
  }

  Future<void> putPlate(Plate plate) async {
    final key = _key(plate.plateNo);
    final now = DateTime.now();

    PlateCacheEntry entry;

    plate.cachedAt = now;
    
    entry = PlateCacheEntry(plate: plate, cachedAt: now);

    await _box.put(key, jsonEncode(entry.toJson()));
    await _shrinkIfNeeded();
  }

  List<PlateCacheEntry> listAll() {
    return _box.values
        .map((raw) => PlateCacheEntry.fromJson(jsonDecode(raw)))
        .where((e) => DateTime.now().difference(e.cachedAt) <= ttl)
        .toList()
      ..sort((a, b) => b.cachedAt.compareTo(a.cachedAt));
  }

  Future<void> _shrinkIfNeeded() async {
    if (_box.length <= maxItems) return;
    // xoá LRU: cũ nhất theo cachedAt
    final entries = await listAll();
    if (entries.length <= maxItems) return;
    final toRemove = entries.skip(maxItems).toList();
    for (final e in toRemove) {
      await _box.delete(_key(e.plate.plateNo));
    }
  }
}
