import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part "db.g.dart";

class Foods extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get value_protein => text()();
  TextColumn get value_lipid => text()();
  TextColumn get value_carbon => text()();
  TextColumn get value_cal => text()();
}

@DataClassName('Eated')
class Eateds extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get value_protein => text()();
  TextColumn get value_lipid => text()();
  TextColumn get value_carbon => text()();
  TextColumn get value_cal => text()();
}

class Achivements extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get value_protein => text()();
  TextColumn get value_lipid => text()();
  TextColumn get value_carbon => text()();
  TextColumn get value_cal => text()();
}

@DriftDatabase(tables: [Foods, Eateds, Achivements])
class PfcDatabase extends _$PfcDatabase {
  PfcDatabase() : super(_openConnection());
  
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbDirectory = await getApplicationDocumentsDirectory();
    final dbFile = File(join(dbDirectory.path, 'pfc.sqlite'));
    return NativeDatabase(dbFile);
  });
}
