import 'package:app_cripto/app/core/database/migration/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE IF NOT EXISTS coins (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      coin_id TEXT UNIQUE NOT NULL,
      name TEXT NOT NULL,
      symbol TEXT NOT NULL,
      is_favorite INTEGER NOT NULL DEFAULT 0);

      CREATE TABLE IF NOT EXISTS coin_market (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      coin_id TEXT NOT NULL,
      FOREIGN KEY (coin_id) REFERENCES coins(coin_id),
      image TEXT NOT NULL,
      current_price REAL NOT NULL,
      market_cap REAL NOT NULL,
      rank INTEGER NOT NULL,
      total_volume INTEGER NOT NULL,
      price_change_24h REAL NOT NULL,
      price_change_percentage_24h REAL NOT NULL,
      );
        ''');
  }

  @override
  void update(Batch batch) {
    
  }
}
