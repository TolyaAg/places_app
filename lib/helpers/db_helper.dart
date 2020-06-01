import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> _open() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      version: 1,
      onCreate: (db, _) async {
        await db.execute(
          'CREATE TABLE user_places (id TEXT PRIMARY KEY, title TEXT, image TEXT)',
        );
      },
    );
    return db;
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await _open();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await _open();
    return db.query(table);
  }
}
