import 'package:app_tracuubiensoxe/app/app.dart';
import 'package:app_tracuubiensoxe/app/bootstrap.dart';
import 'package:app_tracuubiensoxe/features/plates/data/consts/plates_const.dart';
import 'package:app_tracuubiensoxe/features/plates/data/local/plates_cache.dart';
import 'package:app_tracuubiensoxe/features/plates/data/plates_remote_datasource.dart';
import 'package:app_tracuubiensoxe/features/plates/data/plates_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

void main() async {
  await bootstrap();

  final platesCacheBox = Hive.box<String>(plateCacheBox);
  final cache = PlatesCache(platesCacheBox);

  final ds = PlatesRemoteDatasource(client: http.Client());
  final repo = PlatesRepository(cache, ds);

  runApp(MyApp(platesRepository: repo));
}
