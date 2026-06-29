import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/tables/pacientes_table.dart';

class Episodios extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pacienteId =>
      integer().references(Pacientes, #id, onDelete: KeyAction.cascade)();
  TextColumn get tipoEpisodio => text()(); // uci | hd_aguda | hd_ambulatoria | sala_general
  DateTimeColumn get fechaIngreso => dateTime()();
  DateTimeColumn get fechaEgreso => dateTime().nullable()();
  TextColumn get servicioOrigen => text().nullable()();
  TextColumn get motivoIngreso => text().nullable()();
  TextColumn get estado => text().withDefault(const Constant('activo'))();
  TextColumn get condicionEgreso => text().nullable()(); // vivo | fallecido | trasladado
  DateTimeColumn get creadoEn => dateTime().withDefault(currentDateAndTime)();
}
