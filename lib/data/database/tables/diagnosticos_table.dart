import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/tables/episodios_table.dart';

@TableIndex.sql('CREATE INDEX idx_diag_cie ON diagnosticos(codigo_cie, episodio_id)')
class Diagnosticos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get episodioId =>
      integer().references(Episodios, #id, onDelete: KeyAction.cascade)();
  TextColumn get codigoCie => text().nullable()(); // ICD-10
  TextColumn get descripcion => text()();
  TextColumn get tipo => text().withDefault(const Constant('principal'))();
  // principal | secundario | complicacion
  DateTimeColumn get fecha => dateTime().withDefault(currentDateAndTime)();
}
