import 'package:app_cripto/app/core/database/migration/migration.dart';
import 'package:app_cripto/app/core/database/migration/migration_v1.dart';

class SqlMigrationFactory {
  List<Migration> getCreateMigrations() => [
    MigrationV1(),
  ];
  List<Migration> getUpdateMigrations(int version) {
    var migrations = <Migration>[];
    if (version == 1) {
      // migrations.add(); // Adicionar uma V2
    }
    return migrations;
  }
}
