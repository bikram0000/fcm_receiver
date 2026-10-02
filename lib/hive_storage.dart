import 'dart:io';

import 'package:hive/hive.dart';

class HiveStorage {
  late Box<dynamic> box;

  Future<void> init({String? storagePath, String? boxName}) async {
    var path = storagePath ?? Directory.current.path;
    await Hive.openBox(boxName ?? 'testBox', path: path);
    box = Hive.box(boxName ?? 'testBox');
  }

  Box<dynamic> get getBox => box;
}
