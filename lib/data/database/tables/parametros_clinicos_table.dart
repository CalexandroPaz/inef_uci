import 'package:drift/drift.dart';

class ParametrosClinicos extends Table {
  TextColumn get codigo => text()();
  TextColumn get nombreEs => text()();
  TextColumn get nombreEn => text()();
  TextColumn get nombreFr => text()();
  TextColumn get categoria => text()();
  TextColumn get unidadCanonica => text()();
  RealColumn get rangoMin => real().nullable()();
  RealColumn get rangoMax => real().nullable()();
  IntColumn get decimales => integer().withDefault(const Constant(2))();

  @override
  Set<Column> get primaryKey => {codigo};
}
