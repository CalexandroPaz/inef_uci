import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inef_uci/data/database/app_database.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/services/audit_logger.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class LabFormScreen extends ConsumerStatefulWidget {
  final int pacienteId;
  const LabFormScreen({super.key, required this.pacienteId});

  @override
  ConsumerState<LabFormScreen> createState() => _LabFormScreenState();
}

class _LabFormScreenState extends ConsumerState<LabFormScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime _fechaHora = DateTime.now();
  ParametrosClinico? _param;
  final _valorCtrl = TextEditingController();
  final _notasCtrl = TextEditingController();
  bool _saving = false;
  bool _outOfRange = false;

  @override
  void dispose() {
    _valorCtrl.dispose();
    _notasCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    final date = await showDatePicker(
      context: context,
      initialDate: _fechaHora,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      helpText: l10n.dateAndTime,
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_fechaHora),
    );
    if (time == null) return;
    setState(() {
      _fechaHora = DateTime(
        date.year, date.month, date.day, time.hour, time.minute,
      );
    });
  }

  void _checkRange() {
    final p = _param;
    final v = double.tryParse(_valorCtrl.text.replaceAll(',', '.'));
    if (p == null || v == null) {
      setState(() => _outOfRange = false);
      return;
    }
    final oor = (p.rangoMin != null && v < p.rangoMin!) ||
        (p.rangoMax != null && v > p.rangoMax!);
    setState(() => _outOfRange = oor);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_param == null) return;
    final l10n = AppLocalizations.of(context);

    if (_outOfRange) {
      final ok = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.confirm),
          content: Text(
            l10n.warningOutOfRange(
              _param!.rangoMin?.toStringAsFixed(1) ?? '?',
              _param!.rangoMax?.toStringAsFixed(1) ?? '?',
              _param!.unidadCanonica,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l10n.confirm),
            ),
          ],
        ),
      );
      if (ok != true || !mounted) return;
    }

    setState(() => _saving = true);
    try {
      final db = ref.read(appDatabaseProvider);
      if (db == null) return;

      final valor = double.parse(_valorCtrl.text.replaceAll(',', '.'));

      await db.insertarLaboratorio(
        LaboratoriosCompanion(
          pacienteId: Value(widget.pacienteId),
          parametroCodigo: Value(_param!.codigo),
          valorOriginal: Value(valor),
          unidadOriginal: Value(_param!.unidadCanonica),
          valorCanonicoMgDl: Value(valor),
          fechaHora: Value(_fechaHora),
          fuente: const Value('manual'),
          notas: Value(
            _notasCtrl.text.trim().isEmpty ? null : _notasCtrl.text.trim(),
          ),
        ),
      );

      await ref.read(auditLoggerProvider)?.log(
            accion: AuditAction.create,
            entidad: 'laboratorios',
            pacienteId: widget.pacienteId,
            detalle: {
              'parametro': _param!.codigo,
              'valor': valor,
              'unidad': _param!.unidadCanonica,
            },
          );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.labSaved)),
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
    final parametrosAsync = ref.watch(parametrosClinicosProvider);

    final fmtDt =
        '${_fechaHora.day.toString().padLeft(2, '0')}/${_fechaHora.month.toString().padLeft(2, '0')}/${_fechaHora.year} '
        '${_fechaHora.hour.toString().padLeft(2, '0')}:${_fechaHora.minute.toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.newLab),
        actions: [
          _saving
              ? const Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : TextButton(
                  onPressed: _param != null ? _save : null,
                  child: Text(
                    l10n.save,
                    style: TextStyle(
                      color: _param != null ? Colors.white : Colors.white54,
                    ),
                  ),
                ),
        ],
      ),
      body: parametrosAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (parametros) => Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Fecha y hora
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.access_time,
                    color: InefColors.primaryDark,
                  ),
                  title: Text(l10n.dateAndTime),
                  subtitle: Text(fmtDt),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _pickDateTime(),
                ),
              ),
              const SizedBox(height: 16),

              // Parámetro
              DropdownButtonFormField<ParametrosClinico>(
                initialValue: _param,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: l10n.fieldParameter,
                  border: const OutlineInputBorder(),
                ),
                items: parametros.map((p) {
                  return DropdownMenuItem(
                    value: p,
                    child: Text(
                      p.nombreEs,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: (p) {
                  setState(() {
                    _param = p;
                    _valorCtrl.clear();
                    _outOfRange = false;
                  });
                },
                validator: (v) =>
                    v == null ? l10n.parameterRequired : null,
              ),
              const SizedBox(height: 12),

              // Valor + unidad
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _valorCtrl,
                      decoration: InputDecoration(
                        labelText: l10n.fieldValue,
                        border: const OutlineInputBorder(),
                        errorStyle: const TextStyle(color: InefColors.warning),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      onChanged: (_) => _checkRange(),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return l10n.fieldRequired;
                        }
                        if (double.tryParse(v.replaceAll(',', '.')) == null) {
                          return '—';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      initialValue: _param?.unidadCanonica,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: l10n.fieldUnit,
                        border: const OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),

              if (_outOfRange) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: InefColors.warning.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: InefColors.warning.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.warning_amber_rounded,
                        color: InefColors.warning,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Fuera de rango: ${_param!.rangoMin?.toStringAsFixed(1)} – ${_param!.rangoMax?.toStringAsFixed(1)} ${_param!.unidadCanonica}',
                          style: const TextStyle(
                            color: InefColors.warning,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 12),

              // Notas
              TextFormField(
                controller: _notasCtrl,
                decoration: InputDecoration(
                  labelText: l10n.fieldNotes,
                  border: const OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
