import 'package:app_cripto/app/core/database/sql_migration_factory.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class SqlConnectionFactory {
  static const _VERSION = 1;
  static const _DATABASE_NAME = 'cripto_app_db';

  Database? db;
  final _lock = Lock();

  static SqlConnectionFactory? _instance = SqlConnectionFactory._();
  SqlConnectionFactory._();

  factory SqlConnectionFactory() {
    _instance ??= SqlConnectionFactory._();
    return _instance!;
  }

  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, _DATABASE_NAME);

    return await _lock.synchronized(() async {
      if (db != null && db!.isOpen) {
        return db!;
      }

      db = await openDatabase(
        path,
        version: _VERSION,
        onConfigure: _onConfigure,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onDowngrade: _onDowngrade,
      );

      return db!;
    });
  }

  void closeConnection() {
    db?.close();
    db = null;
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();
    final migrations = SqlMigrationFactory().getCreateMigrations();
    for (var migration in migrations) {
      migration.create(batch);
    }
    await batch.commit();
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    final batch = db.batch();
    final migrations = SqlMigrationFactory().getUpdateMigrations(oldVersion);
    for (var migration in migrations) {
      migration.update(batch);
    }
    await batch.commit();
  }

  Future<void> _onDowngrade(Database db, int oldVersion, int newVersion) async {
   
  }
}
