import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/tables/episodios_table.dart';
import 'package:inef_uci/data/database/tables/pacientes_table.dart';

/// Parámetros SAVINA DRÄGER 300/600 por sesión.
class VentilacionSavina extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pacienteId =>
      integer().references(Pacientes, #id, onDelete: KeyAction.cascade).nullable()();
  IntColumn get episodioId =>
      integer().references(Episodios, #id, onDelete: KeyAction.setNull).nullable()();
  DateTimeColumn get timestamp => dateTime()();

  // Modo ventilatorio
  TextColumn get modo => text()();
  // VC-CMV | VC-AC | PC-AC | PC-CMV | SIMV | PSV | CPAP | AutoFlow | PC-APRV

  // Parámetros programados
  RealColumn get fio2 => real().nullable()();           // fracción (0.21–1.0)
  RealColumn get peep => real().nullable()();            // cmH2O
  RealColumn get volumenTidal => real().nullable()();    // mL (si modo VC)
  RealColumn get pControl => real().nullable()();        // cmH2O (si modo PC)
  RealColumn get frecRespProgramada => real().nullable()();
  RealColumn get relIE => real().nullable()();           // ej. 0.5 para 1:2
  RealColumn get pSoporte => real().nullable()();        // cmH2O (PSV/SIMV-PSV)
  RealColumn get trigger => real().nullable()();         // L/min o cmH2O

  // Parámetros medidos
  RealColumn get pPico => real().nullable()();           // cmH2O
  RealColumn get pMeseta => real().nullable()();         // cmH2O
  RealColumn get pMedia => real().nullable()();          // cmH2O
  RealColumn get vtEspirado => real().nullable()();      // mL
  RealColumn get frecRespTotal => real().nullable()();
  RealColumn get volMinuto => real().nullable()();       // L/min
  RealColumn get fuga => real().nullable()();            // %

  // Derivados (autocalculados en app)
  RealColumn get drivingPressure => real().nullable()(); // pMeseta - PEEP
  RealColumn get complianceEstatica => real().nullable()(); // Vt / DP (mL/cmH2O)
  RealColumn get indiceoOxigenacion => real().nullable()(); // FiO2*Pmedia*100/PaO2
  RealColumn get pfRatio => real().nullable()();         // PaO2 / FiO2
  TextColumn get ardsBerlin => text().nullable()();      // leve|moderado|grave|no

  TextColumn get notas => text().nullable()();
  BoolColumn get invalidado => boolean().withDefault(const Constant(false))();
}
