import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../database/db_create_tables.dart';

class DatabaseServices {
  DatabaseServices._init();

  static final DatabaseServices instance = DatabaseServices._init();

  static Database? _database;

  final int _databaseVersion = 1;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase(database: 'teste_vaga.db');

    return _database!;
  }

  Future<Database> _initDatabase({required String database}) async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, database);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createDatabase,
      onUpgrade: _updateDatabase,
    );
  }

  Future _createDatabase(Database db, int version) async {
    await db.execute(DBCreateTables.tarefas);
    await db.execute(DBCreateTables.produto);
    await db.execute(DBCreateTables.configuracao);
  }

  Future _updateDatabase(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {}
  }

  static Future<void> closeDatabase() async {
    final Database db = await instance.database;
    await db.close();
  }
}
