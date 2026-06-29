import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:inef_uci/core/constants/app_constants.dart';
import 'package:inef_uci/data/database/tables/usuarios_locales_table.dart';
import 'package:inef_uci/data/database/tables/pacientes_table.dart';
import 'package:inef_uci/data/database/tables/historias_clinicas_table.dart'; // HistoriasClinicas
import 'package:inef_uci/data/database/tables/episodios_table.dart';
import 'package:inef_uci/data/database/tables/diagnosticos_table.dart';
import 'package:inef_uci/data/database/tables/signos_vitales_table.dart';
import 'package:inef_uci/data/database/tables/parametros_clinicos_table.dart';
import 'package:inef_uci/data/database/tables/catalogo_meta_table.dart';
import 'package:inef_uci/data/database/tables/unidades_medida_table.dart';
import 'package:inef_uci/data/database/tables/laboratorios_table.dart';
import 'package:inef_uci/data/database/tables/imagenes_table.dart';
import 'package:inef_uci/data/database/tables/ekg_table.dart';
import 'package:inef_uci/data/database/tables/ventilacion_savina_table.dart';
import 'package:inef_uci/data/database/tables/sesiones_hd_table.dart';
import 'package:inef_uci/data/database/tables/calculos_realizados_table.dart';
import 'package:inef_uci/data/database/tables/audit_log_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  UsuariosLocales,
  Pacientes,
  HistoriasClinicas,
  Episodios,
  Diagnosticos,
  SignosVitales,
  ParametrosClinicos,
  CatalogoMeta,
  UnidadesMedida,
  Laboratorios,
  Imagenes,
  Ekg,
  VentilacionSavina,
  SesionesHd,
  CalculosRealizados,
  AuditLog,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => AppConstants.dbSchemaVersion;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedCatalog(force: true);
        },
        onUpgrade: (m, from, to) async {
          // v1→v2: episodio_id en signos_vitales pasa a nullable (no-op en SQLite).
          if (from < 3) {
            // v2→v3: paciente_id añadido a sesiones_hd y ventilacion_savina.
            await m.addColumn(sesionesHd, sesionesHd.pacienteId);
            await m.addColumn(ventilacionSavina, ventilacionSavina.pacienteId);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
          if (!details.wasCreated) {
            await _seedCatalogIfNeeded();
          }
        },
      );

  Future<void> _seedCatalogIfNeeded() async {
    final metas = await select(catalogoMeta).get();
    final assetJson = await rootBundle.loadString(AppConstants.catalogAssetPath);
    final assetData = json.decode(assetJson) as Map<String, dynamic>;
    final assetVersion = assetData['version'] as int;
    if (metas.isEmpty || metas.first.version < assetVersion) {
      await _seedCatalog(force: true, data: assetData);
    }
  }

  Future<void> _seedCatalog({
    bool force = false,
    Map<String, dynamic>? data,
  }) async {
    final assetData = data ??
        json.decode(await rootBundle.loadString(AppConstants.catalogAssetPath))
            as Map<String, dynamic>;
    final version = assetData['version'] as int;
    final parametros = assetData['parametros'] as List<dynamic>;

    await transaction(() async {
      if (force) {
        await delete(unidadesMedida).go();
        await delete(parametrosClinicos).go();
        await delete(catalogoMeta).go();
      }

      for (final p in parametros) {
        final map = p as Map<String, dynamic>;
        final codigo = map['codigo'] as String;
        final nombreI18n = map['nombre_i18n'] as Map<String, dynamic>;
        final rango = map['rango_fisiologico'] as Map<String, dynamic>?;
        await into(parametrosClinicos).insertOnConflictUpdate(
          ParametrosClinicosCompanion.insert(
            codigo: codigo,
            nombreEs: nombreI18n['es'] as String,
            nombreEn: nombreI18n['en'] as String,
            nombreFr: nombreI18n['fr'] as String,
            categoria: map['categoria'] as String,
            unidadCanonica: map['unidad_canonica'] as String,
            rangoMin: Value(rango != null ? (rango['min'] as num).toDouble() : null),
            rangoMax: Value(rango != null ? (rango['max'] as num).toDouble() : null),
            decimales: Value(map['decimales'] as int? ?? 2),
          ),
        );

        final unidades = map['unidades_aceptadas'] as List<dynamic>;
        for (final u in unidades) {
          final um = u as Map<String, dynamic>;
          await into(unidadesMedida).insertOnConflictUpdate(
            UnidadesMedidaCompanion.insert(
              parametroCodigo: codigo,
              unidad: um['unidad'] as String,
              factorACanonica: (um['factor_a_canonica'] as num).toDouble(),
              offset: Value((um['offset'] as num? ?? 0.0).toDouble()),
            ),
          );
        }
      }

      await into(catalogoMeta).insert(
        CatalogoMetaCompanion.insert(version: version),
        mode: InsertMode.replace,
      );
    });
  }

  // ── Pacientes ────────────────────────────────────────────────────────────────

  Stream<List<Paciente>> watchPacientes([String query = '']) {
    final q = query.trim().toLowerCase();
    return (select(pacientes)
          ..where((t) => q.isEmpty
              ? const Constant<bool>(true)
              : t.nombreNormalizado.contains(q) |
                  t.numeroHc.contains(q) |
                  t.cedula.contains(q))
          ..orderBy([(t) => OrderingTerm.asc(t.nombreNormalizado)]))
        .watch();
  }

  Future<Paciente?> getPacienteById(int id) =>
      (select(pacientes)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertarPaciente(PacientesCompanion data) =>
      into(pacientes).insert(data);

  Future<void> actualizarPaciente(int id, PacientesCompanion data) =>
      (update(pacientes)..where((t) => t.id.equals(id))).write(data);

  // ── Historial clínico (streams para pantalla de detalle) ─────────────────────

  Stream<Paciente?> watchPacienteById(int id) =>
      (select(pacientes)..where((t) => t.id.equals(id))).watchSingleOrNull();

  Stream<List<Laboratorio>> watchLaboratorios(int pacienteId) =>
      (select(laboratorios)
            ..where((t) =>
                t.pacienteId.equals(pacienteId) & t.invalidado.equals(false))
            ..orderBy([(t) => OrderingTerm.desc(t.fechaHora)]))
          .watch();

  Stream<List<SignosVitale>> watchSignosVitales(int pacienteId) =>
      (select(signosVitales)
            ..where((t) =>
                t.pacienteId.equals(pacienteId) & t.invalidado.equals(false))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .watch();

  Future<List<ParametrosClinico>> getParametrosClinicos() =>
      (select(parametrosClinicos)
            ..orderBy([
              (t) => OrderingTerm.asc(t.categoria),
              (t) => OrderingTerm.asc(t.nombreEs),
            ]))
          .get();

  Future<int> insertarSignosVitales(SignosVitalesCompanion data) =>
      into(signosVitales).insert(data);

  Future<int> insertarLaboratorio(LaboratoriosCompanion data) =>
      into(laboratorios).insert(data);

  // ── Sesiones HD y Ventilación ─────────────────────────────────────────────

  Stream<List<SesionesHdData>> watchSesionesHd(int pacienteId) =>
      (select(sesionesHd)
            ..where((t) =>
                t.pacienteId.equals(pacienteId) & t.invalidado.equals(false))
            ..orderBy([(t) => OrderingTerm.desc(t.fechaHoraInicio)]))
          .watch();

  Stream<List<VentilacionSavinaData>> watchVentilacion(int pacienteId) =>
      (select(ventilacionSavina)
            ..where((t) =>
                t.pacienteId.equals(pacienteId) & t.invalidado.equals(false))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .watch();

  Future<int> insertarSesionHd(SesionesHdCompanion data) =>
      into(sesionesHd).insert(data);

  Future<int> insertarVentilacion(VentilacionSavinaCompanion data) =>
      into(ventilacionSavina).insert(data);

  // ── Laboratorios ─────────────────────────────────────────────────────────────

  /// Retorna el último valor canónico de un parámetro para un paciente.
  Future<Laboratorio?> getLastLabValue(
    int pacienteId,
    String parametroCodigo,
  ) async {
    final query = (select(laboratorios)
      ..where((t) =>
          t.pacienteId.equals(pacienteId) &
          t.parametroCodigo.equals(parametroCodigo) &
          t.invalidado.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.fechaHora)])
      ..limit(1));
    return query.getSingleOrNull();
  }

  /// Retorna la última sesión HD de un episodio.
  Future<SesionesHdData?> getLastHdSession(int pacienteId) async {
    final query = (select(sesionesHd)
      ..where((t) => t.invalidado.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.fechaHoraInicio)])
      ..limit(1));
    return query.getSingleOrNull();
  }

  // ── Historia Clínica ──────────────────────────────────────────────────────

  Stream<HistoriasClinica?> watchHistoriaClinica(int pacienteId) =>
      (select(historiasClinicas)
            ..where((t) => t.pacienteId.equals(pacienteId)))
          .watchSingleOrNull();

  Future<void> upsertHistoriaClinica(HistoriasClinicasCompanion data) =>
      into(historiasClinicas).insertOnConflictUpdate(data);

  // ── Registro de auditoría ─────────────────────────────────────────────────

  Stream<List<AuditLogData>> watchAuditLog({int? pacienteId, int limit = 200}) {
    final q = select(auditLog)
      ..orderBy([(t) => OrderingTerm.desc(t.timestamp)])
      ..limit(limit);
    if (pacienteId != null) {
      q.where((t) => t.pacienteId.equals(pacienteId));
    }
    return q.watch();
  }
}

/// Abre la base de datos con la DMK (Data Master Key) en hexadecimal.
/// La DMK es generada aleatoriamente en el primer arranque y almacenada
/// en Android KeyStore vía flutter_secure_storage. El PIN/biometría solo
/// desenvuelve la DMK del KeyStore; nunca deriva la clave de la BD.
///
/// Para habilitar cifrado SQLCipher en producción, configurar en
/// android/app/build.gradle el reemplazo de sqlite3 por sqlcipher
/// y ajustar el linker. El PRAGMA key funciona en ambos casos.
Future<AppDatabase> openAppDatabase(String dmkHex) async {
  final dbDir = await getApplicationDocumentsDirectory();
  final dbPath = p.join(dbDir.path, AppConstants.dbFileName);

  final executor = NativeDatabase.createInBackground(
    File(dbPath),
    setup: (rawDb) {
      if (dmkHex.isNotEmpty) {
        rawDb.execute("PRAGMA key = \"x'$dmkHex'\"");
      }
      rawDb.execute('PRAGMA foreign_keys = ON');
    },
  );
  return AppDatabase(executor);
}

