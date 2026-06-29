import 'package:drift/drift.dart';

class UsuariosLocales extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().withLength(min: 1, max: 100)();
  TextColumn get especialidad => text().nullable()();
  DateTimeColumn get creadoEn => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get ultimoAcceso => dateTime().nullable()();
  IntColumn get autoLockSegundos => integer().withDefault(const Constant(300))();
  BoolColumn get biometriaHabilitada => boolean().withDefault(const Constant(false))();
}
