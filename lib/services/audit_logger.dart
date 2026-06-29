import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:inef_uci/data/database/app_database.dart';

enum AuditAction {
  read,
  create,
  update,
  invalidate,
  export,
  login,
  logout,
  calc,
  pdf,
}

extension AuditActionName on AuditAction {
  String get code {
    switch (this) {
      case AuditAction.read: return 'READ';
      case AuditAction.create: return 'CREATE';
      case AuditAction.update: return 'UPDATE';
      case AuditAction.invalidate: return 'INVALIDATE';
      case AuditAction.export: return 'EXPORT';
      case AuditAction.login: return 'LOGIN';
      case AuditAction.logout: return 'LOGOUT';
      case AuditAction.calc: return 'CALC';
      case AuditAction.pdf: return 'PDF';
    }
  }
}

class AuditLogger {
  final AppDatabase _db;

  AuditLogger(this._db);

  Future<void> log({
    required AuditAction accion,
    String? entidad,
    int? entidadId,
    int? pacienteId,
    int? usuarioId,
    Map<String, dynamic>? detalle,
  }) async {
    await _db.into(_db.auditLog).insert(
      AuditLogCompanion.insert(
        accion: accion.code,
        entidad: Value(entidad),
        entidadId: Value(entidadId),
        pacienteId: Value(pacienteId),
        usuarioId: Value(usuarioId),
        detalleJson: Value(detalle != null ? json.encode(detalle) : null),
      ),
    );
  }
}
