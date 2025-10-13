import 'package:app_tracuubiensoxe/features/plates/data/local/plates_cache.dart';
import 'package:app_tracuubiensoxe/features/plates/data/models/plate_model.dart';
import 'package:app_tracuubiensoxe/features/plates/data/plates_remote_datasource.dart';

class PlatesRepository {
  final PlatesCache _cache;
  final PlatesRemoteDatasource _datasource;

  const PlatesRepository(this._cache, this._datasource);

  Future<Plate> findPlate(String plateNo, {bool forceSync = false}) async {
    if (!forceSync) {
      final cached = await _cache.findPlate(plateNo);
      if (cached != null) {
        return cached.plate;
      }
    }

    final plate = await _datasource.findPlate(plateNo);
    await _cache.putPlate(plate);
    return plate;
  }
}
