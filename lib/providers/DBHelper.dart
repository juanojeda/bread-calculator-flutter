import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper with ChangeNotifier {
  static final tableName = 'recipes';
  sql.Database db;

  DBHelper() {
    // this will run when provider is instantiate the first time
    init();
  }

  void init() async {
    final dbPath = await sql.getDatabasesPath();
    db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        final stmt = '''CREATE TABLE IF NOT EXISTS $tableName (
            id STRING PRIMARY KEY,
            name TEXT,
            ingredients BLOB
        )'''
            .trim()
            .replaceAll(RegExp(r'[\s]{2,}'), ' ');
        return db.execute(stmt);
      },
      version: 1,
    );
    // the init funciton is async so it won't block the main thread
    // notify provider that depends on it when done
    notifyListeners();
  }

  Future<void> insert(Map<String, dynamic> data) async {
    await db.insert(tableName, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getData() async {
    return await db.query(tableName);
  }
}
