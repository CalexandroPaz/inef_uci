import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/tables/pacientes_table.dart';
import 'package:inef_uci/data/database/tables/episodios_table.dart';

class SignosVitales extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pacienteId =>
      integer().references(Pacientes, #id, onDelete: KeyAction.cascade)();
  IntColumn get episodioId =>
      integer().references(Episodios, #id, onDelete: KeyAction.setNull).nullable()();
  DateTimeColumn get timestamp => dateTime()();
  RealColumn get frecuenciaCardiaca => real().nullable()();
  RealColumn get presionSistolica => real().nullable()();
  RealColumn get presionDiastolica => real().nullable()();
  RealColumn get presionMedia => real().nullable()();
  RealColumn get frecuenciaRespiratoria => real().nullable()();
  RealColumn get temperatura => real().nullable()();
  RealColumn get saturacionO2 => real().nullable()();
  RealColumn get diuresis => real().nullable()(); // mL/h
  TextColumn get notas => text().nullable()();
  BoolColumn get invalidado => boolean().withDefault(const Constant(false))();
}
