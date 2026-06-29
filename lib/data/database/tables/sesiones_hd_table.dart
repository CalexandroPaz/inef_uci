import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/tables/episodios_table.dart';
import 'package:inef_uci/data/database/tables/pacientes_table.dart';

/// Sesiones de hemodiálisis.
class SesionesHd extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pacienteId =>
      integer().references(Pacientes, #id, onDelete: KeyAction.cascade).nullable()();
  IntColumn get episodioId =>
      integer().references(Episodios, #id, onDelete: KeyAction.setNull).nullable()();
  DateTimeColumn get fechaHoraInicio => dateTime()();
  DateTimeColumn get fechaHoraFin => dateTime().nullable()();

  // Acceso vascular
  TextColumn get tipoAcceso => text()();
  // fav_radio | fav_braquio | fav_braquiobasilic | injerto | yug | femoral | subclavio
  TextColumn get lateralidadAcceso => text().nullable()(); // izq | der
  TextColumn get tipoAccesoCateter => text().nullable()(); // transitorio | tunelizado

  // Parámetros de sesión
  IntColumn get duracionProgramadaMin => integer()();
  IntColumn get duracionRealMin => integer().nullable()();
  RealColumn get qb => real()(); // mL/min
  RealColumn get qd => real()(); // mL/min

  // Dializador
  TextColumn get dializadorTipo => text().nullable()();
  RealColumn get dializadorSuperficieM2 => real().nullable()();
  RealColumn get dializadorKuf => real().nullable()(); // mL/h/mmHg

  // Baño de diálisis (mEq/L o mmol/L)
  RealColumn get banoNa => real().nullable()();
  RealColumn get banoK => real().nullable()();
  RealColumn get banoCa => real().nullable()();
  RealColumn get banoHco3 => real().nullable()();
  RealColumn get banoGlucosa => real().nullable()();

  // Ultrafiltración
  RealColumn get ufTotalProgramadaMl => real()();
  RealColumn get ufTotalRealMl => real().nullable()();
  RealColumn get tasaUfMlKgH => real().nullable()(); // calculada

  // Anticoagulación
  TextColumn get tipoAnticoagulacion => text().nullable()(); // heparina | citrato | ninguna
  RealColumn get heparinaBoloPorUI => real().nullable()();
  RealColumn get heparinaMantenimientoUiH => real().nullable()();

  // Pesos
  RealColumn get pesoPreHdKg => real().nullable()();
  RealColumn get pesoPostHdKg => real().nullable()();
  RealColumn get pesoSecoObjetivoKg => real().nullable()();

  // Eficacia (calculada)
  RealColumn get ktvCalculado => real().nullable()();
  RealColumn get urrCalculado => real().nullable()(); // %

  TextColumn get eventosDurante => text().nullable()(); // texto libre
  BoolColumn get invalidado => boolean().withDefault(const Constant(false))();
}
