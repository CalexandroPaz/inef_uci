import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/tables/usuarios_locales_table.dart';

/// Log de auditoría inmutable — sin DELETE físico.
/// Corrección = nuevo registro + anterior invalidado.
@TableIndex.sql('CREATE INDEX idx_audit_timestamp ON audit_log(timestamp)')
@TableIndex.sql('CREATE INDEX idx_audit_paciente ON audit_log(paciente_id, timestamp)')
class AuditLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get accion => text()();
  // READ | CREATE | UPDATE | INVALIDATE | EXPORT | LOGIN | LOGOUT | CALC | PDF
  TextColumn get entidad => text().nullable()();    // nombre de tabla
  IntColumn get entidadId => integer().nullable()();
  IntColumn get pacienteId => integer().nullable()();
  IntColumn get usuarioId =>
      integer().references(UsuariosLocales, #id, onDelete: KeyAction.restrict).nullable()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
  TextColumn get detalleJson => text().nullable()(); // JSON con contexto adicional
  TextColumn get institucion =>
      text().withDefault(const Constant('Instituto de Nefrología Dr. Abelardo Buch López'))();
}
