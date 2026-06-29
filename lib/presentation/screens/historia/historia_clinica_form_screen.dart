import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inef_uci/data/database/app_database.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/services/audit_logger.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class HistoriaClinicaFormScreen extends ConsumerStatefulWidget {
  final int pacienteId;
  const HistoriaClinicaFormScreen({super.key, required this.pacienteId});

  @override
  ConsumerState<HistoriaClinicaFormScreen> createState() =>
      _HistoriaClinicaFormScreenState();
}

class _HistoriaClinicaFormScreenState
    extends ConsumerState<HistoriaClinicaFormScreen> {
  final _heaCtrl = TextEditingController();
  final _appCtrl = TextEditingController();
  final _apfCtrl = TextEditingController();
  final _opCtrl = TextEditingController();
  final _dpCtrl = TextEditingController();
  final _efCtrl = TextEditingController();
  final _alergiaCtrl = TextEditingController();

  final List<String> _alergias = [];
  bool _saving = false;
  bool _loaded = false;

  @override
  void dispose() {
    for (final c in [
      _heaCtrl, _appCtrl, _apfCtrl, _opCtrl, _dpCtrl, _efCtrl, _alergiaCtrl
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _initFromDb(HistoriasClinica? h) {
    if (_loaded || h == null) return;
    _loaded = true;
    _heaCtrl.text = h.hea ?? '';
    _appCtrl.text = h.app ?? '';
    _apfCtrl.text = h.apf ?? '';
    _opCtrl.text = h.operacionesPrevias ?? '';
    _dpCtrl.text = h.datosPositivosInterrogatorio ?? '';
    _efCtrl.text = h.examenFisico ?? '';
    if (h.alergias != null && h.alergias!.isNotEmpty) {
      _alergias.addAll(
        h.alergias!.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty),
      );
    }
    setState(() {});
  }

  void _addAlergia() {
    final v = _alergiaCtrl.text.trim();
    if (v.isNotEmpty && !_alergias.contains(v)) {
      setState(() => _alergias.add(v));
      _alergiaCtrl.clear();
    }
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      final db = ref.read(appDatabaseProvider);
      if (db == null) return;

      await db.upsertHistoriaClinica(
        HistoriasClinicasCompanion(
          pacienteId: Value(widget.pacienteId),
          hea: Value(_heaCtrl.text.trim().isEmpty ? null : _heaCtrl.text.trim()),
          app: Value(_appCtrl.text.trim().isEmpty ? null : _appCtrl.text.trim()),
          apf: Value(_apfCtrl.text.trim().isEmpty ? null : _apfCtrl.text.trim()),
          alergias: Value(
              _alergias.isEmpty ? null : _alergias.join(', ')),
          operacionesPrevias:
              Value(_opCtrl.text.trim().isEmpty ? null : _opCtrl.text.trim()),
          datosPositivosInterrogatorio:
              Value(_dpCtrl.text.trim().isEmpty ? null : _dpCtrl.text.trim()),
          examenFisico:
              Value(_efCtrl.text.trim().isEmpty ? null : _efCtrl.text.trim()),
          actualizadoEn: Value(DateTime.now()),
        ),
      );

      await ref.read(auditLoggerProvider)?.log(
            accion: AuditAction.update,
            entidad: 'historias_clinicas',
            pacienteId: widget.pacienteId,
          );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text(AppLocalizations.of(context).historiaSaved)),
        );
        context.pop();
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final historiaAsync =
        ref.watch(historiaClinicaProvider(widget.pacienteId));

    historiaAsync.whenData(_initFromDb);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.historiaTitle),
        actions: [
          _saving
              ? const Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    width: 20, height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : TextButton(
                  onPressed: _save,
                  child: Text(l10n.save,
                      style: const TextStyle(color: Colors.white)),
                ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // HEA
          _BigField(ctrl: _heaCtrl, label: l10n.fieldHea, lines: 6),
          const SizedBox(height: 12),

          // APP
          _BigField(ctrl: _appCtrl, label: l10n.fieldApp, lines: 5),
          const SizedBox(height: 12),

          // APF
          _BigField(ctrl: _apfCtrl, label: l10n.fieldApf, lines: 3),
          const SizedBox(height: 12),

          // Alergias
          Text(
            l10n.fieldAlergias,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: InefColors.primaryDark,
            ),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: _alergias
                .map(
                  (a) => Chip(
                    label: Text(a, style: const TextStyle(fontSize: 12)),
                    deleteIcon: const Icon(Icons.close, size: 14),
                    onDeleted: () => setState(() => _alergias.remove(a)),
                    backgroundColor:
                        InefColors.warning.withValues(alpha: 0.15),
                    side: BorderSide(
                        color: InefColors.warning.withValues(alpha: 0.4)),
                  ),
                )
                .toList(),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _alergiaCtrl,
                  decoration: InputDecoration(
                    hintText: l10n.addAlergia,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                  onFieldSubmitted: (_) => _addAlergia(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                icon: const Icon(Icons.add),
                onPressed: _addAlergia,
                style: IconButton.styleFrom(
                    backgroundColor: InefColors.primaryDark),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Operaciones previas
          _BigField(
              ctrl: _opCtrl,
              label: l10n.fieldOperacionesPrevias,
              lines: 3),
          const SizedBox(height: 12),

          // Datos positivos interrogatorio
          _BigField(
              ctrl: _dpCtrl,
              label: l10n.fieldDatosPositivos,
              lines: 4),
          const SizedBox(height: 12),

          // Examen físico
          _BigField(
              ctrl: _efCtrl,
              label: l10n.fieldExamenFisico,
              lines: 8),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

class _BigField extends StatelessWidget {
  final TextEditingController ctrl;
  final String label;
  final int lines;
  const _BigField(
      {required this.ctrl, required this.label, required this.lines});

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: ctrl,
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: true,
          border: const OutlineInputBorder(),
        ),
        maxLines: lines,
        textCapitalization: TextCapitalization.sentences,
      );
}
