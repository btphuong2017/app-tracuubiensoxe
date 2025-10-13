import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox<String>('plates_cache_v1');
}