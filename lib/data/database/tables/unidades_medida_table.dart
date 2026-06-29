import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/tables/parametros_clinicos_table.dart';

class UnidadesMedida extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get parametroCodigo =>
      text().references(ParametrosClinicos, #codigo, onDelete: KeyAction.cascade)();
  TextColumn get unidad => text()();
  RealColumn get factorACanonica => real()();
  RealColumn get offset => real().withDefault(const Constant(0.0))();
}
