import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/tables/episodios_table.dart';

class Ekg extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get episodioId =>
      integer().references(Episodios, #id, onDelete: KeyAction.cascade)();
  TextColumn get ritmo => text().nullable()();
  TextColumn get frecuencia => text().nullable()();
  TextColumn get eje => text().nullable()();
  TextColumn get hallazgos => text()(); // texto estructurado JSON
  BlobColumn get adjunto => blob().nullable()();
  DateTimeColumn get fechaHora => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get invalidado => boolean().withDefault(const Constant(false))();
}
