import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/tables/pacientes_table.dart';
import 'package:inef_uci/data/database/tables/episodios_table.dart';
import 'package:inef_uci/data/database/tables/parametros_clinicos_table.dart';

/// Tabla híbrida EAV para resultados de laboratorio.
/// Incluye columnas tipadas frecuentes para acelerar autopoblado de calculadoras.
@TableIndex.sql('CREATE INDEX idx_lab_pac_param_fecha ON laboratorios(paciente_id, parametro_codigo, fecha_hora)')
@TableIndex.sql('CREATE INDEX idx_lab_param_fecha ON laboratorios(parametro_codigo, fecha_hora)')
class Laboratorios extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pacienteId =>
      integer().references(Pacientes, #id, onDelete: KeyAction.cascade)();
  IntColumn get episodioId =>
      integer().references(Episodios, #id, onDelete: KeyAction.setNull).nullable()();
  TextColumn get parametroCodigo =>
      text().references(ParametrosClinicos, #codigo)();
  RealColumn get valorOriginal => real()();
  TextColumn get unidadOriginal => text()();
  RealColumn get valorCanonicoMgDl => real()(); // valor_canonico en unidad canónica
  DateTimeColumn get fechaHora => dateTime()();
  TextColumn get fuente => text().withDefault(const Constant('manual'))();
  // manual | importado | calculado
  BoolColumn get invalidado => boolean().withDefault(const Constant(false))();
  TextColumn get notas => text().nullable()();

}
