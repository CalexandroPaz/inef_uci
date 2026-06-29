import 'package:drift/drift.dart';

@TableIndex.sql('CREATE INDEX idx_pac_nombre ON pacientes(nombre_normalizado)')
@TableIndex.sql('CREATE INDEX idx_pac_hc ON pacientes(numero_hc)')
@TableIndex.sql('CREATE INDEX idx_pac_cedula ON pacientes(cedula)')
@TableIndex.sql('CREATE INDEX idx_pac_servicio_estado ON pacientes(servicio_actual, estado)')
class Pacientes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get numeroHc => text().unique()();
  TextColumn get nombreCompleto => text().withLength(min: 1, max: 200)();
  TextColumn get nombreNormalizado => text().withLength(min: 1, max: 200)();
  TextColumn get cedula => text().nullable()();
  DateTimeColumn get fechaNacimiento => dateTime()();
  TextColumn get sexo => text().withLength(min: 1, max: 1)(); // M / F
  TextColumn get grupoSanguineo => text().nullable()();
  TextColumn get factorRh => text().nullable()(); // + / -
  RealColumn get pesoSeco => real().nullable()();
  RealColumn get pesoActual => real().nullable()();
  RealColumn get talla => real().nullable()();
  TextColumn get servicioActual => text().nullable()();
  TextColumn get estado => text().withDefault(const Constant('activo'))();
  // activo / egresado / fallecido
  DateTimeColumn get fechaIngreso => dateTime().nullable()();
  DateTimeColumn get fechaEgreso => dateTime().nullable()();
  TextColumn get motivoIngreso => text().nullable()();
  DateTimeColumn get creadoEn => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get actualizadoEn => dateTime().withDefault(currentDateAndTime)();

}
