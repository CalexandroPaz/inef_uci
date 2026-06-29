import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/tables/episodios_table.dart';

class Imagenes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get episodioId =>
      integer().references(Episodios, #id, onDelete: KeyAction.cascade)();
  TextColumn get tipo => text()(); // rx_torax | tac | usg | otro
  BlobColumn get bytes => blob()();
  TextColumn get descripcion => text().nullable()();
  DateTimeColumn get fechaHora => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get invalidado => boolean().withDefault(const Constant(false))();
}
