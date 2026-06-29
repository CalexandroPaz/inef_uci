import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inef_uci/data/database/app_database.dart';
import 'package:inef_uci/services/app_lock_service.dart';
import 'package:inef_uci/services/audit_logger.dart';
import 'package:inef_uci/services/key_vault_service.dart';
import 'package:inef_uci/services/settings_service.dart';

final keyVaultServiceProvider = Provider<KeyVaultService>(
  (ref) => KeyVaultService(),
);

final appLockServiceProvider = ChangeNotifierProvider<AppLockService>((ref) {
  return AppLockService(ref.read(keyVaultServiceProvider));
});

final appDatabaseProvider = StateProvider<AppDatabase?>((ref) => null);

final auditLoggerProvider = Provider<AuditLogger?>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db != null ? AuditLogger(db) : null;
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final pacientesStreamProvider = StreamProvider.autoDispose
    .family<List<Paciente>, String>((ref, query) {
  final db = ref.watch(appDatabaseProvider);
  if (db == null) return const Stream.empty();
  return db.watchPacientes(query);
});

final pacienteByIdProvider = StreamProvider.autoDispose
    .family<Paciente?, int>((ref, id) {
  final db = ref.watch(appDatabaseProvider);
  if (db == null) return const Stream.empty();
  return db.watchPacienteById(id);
});

final laboratoriosStreamProvider = StreamProvider.autoDispose
    .family<List<Laboratorio>, int>((ref, pacienteId) {
  final db = ref.watch(appDatabaseProvider);
  if (db == null) return const Stream.empty();
  return db.watchLaboratorios(pacienteId);
});

final signosVitalesStreamProvider = StreamProvider.autoDispose
    .family<List<SignosVitale>, int>((ref, pacienteId) {
  final db = ref.watch(appDatabaseProvider);
  if (db == null) return const Stream.empty();
  return db.watchSignosVitales(pacienteId);
});

final parametrosClinicosProvider =
    FutureProvider.autoDispose<List<ParametrosClinico>>((ref) async {
  final db = ref.watch(appDatabaseProvider);
  if (db == null) return [];
  return db.getParametrosClinicos();
});

final sesionesHdStreamProvider = StreamProvider.autoDispose
    .family<List<SesionesHdData>, int>((ref, pacienteId) {
  final db = ref.watch(appDatabaseProvider);
  if (db == null) return const Stream.empty();
  return db.watchSesionesHd(pacienteId);
});

final ventilacionStreamProvider = StreamProvider.autoDispose
    .family<List<VentilacionSavinaData>, int>((ref, pacienteId) {
  final db = ref.watch(appDatabaseProvider);
  if (db == null) return const Stream.empty();
  return db.watchVentilacion(pacienteId);
});

final historiaClinicaProvider = StreamProvider.autoDispose
    .family<HistoriasClinica?, int>((ref, pacienteId) {
  final db = ref.watch(appDatabaseProvider);
  if (db == null) return const Stream.empty();
  return db.watchHistoriaClinica(pacienteId);
});

final auditLogStreamProvider =
    StreamProvider.autoDispose<List<AuditLogData>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  if (db == null) return const Stream.empty();
  return db.watchAuditLog();
});

final settingsServiceProvider =
    Provider<SettingsService>((ref) => SettingsService());

final lockTimeoutProvider =
    StateNotifierProvider<LockTimeoutNotifier, int>((ref) {
  return LockTimeoutNotifier(ref.read(settingsServiceProvider));
});

class LockTimeoutNotifier extends StateNotifier<int> {
  final SettingsService _svc;
  LockTimeoutNotifier(this._svc) : super(5) {
    _load();
  }
  Future<void> _load() async => state = await _svc.getLockTimeout();
  Future<void> set(int minutes) async {
    await _svc.setLockTimeout(minutes);
    state = minutes;
  }
}
