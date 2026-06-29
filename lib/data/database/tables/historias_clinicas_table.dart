import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/tables/pacientes_table.dart';

class HistoriasClinicas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pacienteId =>
      integer().references(Pacientes, #id, onDelete: KeyAction.cascade)();
  TextColumn get hea => text().nullable()();
  TextColumn get app => text().nullable()(); // antecedentes patológicos personales
  TextColumn get apf => text().nullable()(); // antecedentes patológicos familiares
  TextColumn get alergias => text().nullable()(); // JSON array
  TextColumn get operacionesPrevias => text().nullable()();
  TextColumn get datosPositivosInterrogatorio => text().nullable()();
  TextColumn get examenFisico => text().nullable()(); // JSON por aparatos y sistemas
  DateTimeColumn get creadoEn => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get actualizadoEn => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => ['UNIQUE (paciente_id)'];
}
