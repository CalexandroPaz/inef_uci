import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/tables/pacientes_table.dart';
import 'package:inef_uci/data/database/tables/episodios_table.dart';

@TableIndex.sql('CREATE INDEX idx_calc_tipo_fecha ON calculos_realizados(tipo_calculo, fecha_hora)')
class CalculosRealizados extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pacienteId =>
      integer().references(Pacientes, #id, onDelete: KeyAction.cascade)();
  IntColumn get episodioId =>
      integer().references(Episodios, #id, onDelete: KeyAction.setNull).nullable()();
  TextColumn get tipoCalculo => text()(); // ktv_daugirdas_ii | egfr_ckd_epi | etc.
  TextColumn get inputsJson => text()();  // JSON de las variables de entrada y su origen
  TextColumn get resultadoJson => text()(); // JSON del resultado
  DateTimeColumn get fechaHora => dateTime().withDefault(currentDateAndTime)();
}
