import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inef_uci/data/database/app_database.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/services/audit_logger.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class VitalsFormScreen extends ConsumerStatefulWidget {
  final int pacienteId;
  const VitalsFormScreen({super.key, required this.pacienteId});

  @override
  ConsumerState<VitalsFormScreen> createState() => _VitalsFormScreenState();
}

class _VitalsFormScreenState extends ConsumerState<VitalsFormScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime _timestamp = DateTime.now();

  final _fcCtrl = TextEditingController();
  final _sistCtrl = TextEditingController();
  final _diastCtrl = TextEditingController();
  final _pamCtrl = TextEditingController();
  final _rrCtrl = TextEditingController();
  final _tempCtrl = TextEditingController();
  final _spo2Ctrl = TextEditingController();
  final _diuresisCtrl = TextEditingController();
  final _notasCtrl = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    for (final c in [
      _fcCtrl, _sistCtrl, _diastCtrl, _pamCtrl,
      _rrCtrl, _tempCtrl, _spo2Ctrl, _diuresisCtrl, _notasCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _recalcPam() {
    final s = double.tryParse(_sistCtrl.text);
    final d = double.tryParse(_diastCtrl.text);
    if (s != null && d != null) {
      setState(() => _pamCtrl.text = ((s + 2 * d) / 3).toStringAsFixed(0));
    }
  }

  Future<void> _pickDateTime() async {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    final date = await showDatePicker(
      context: context,
      initialDate: _timestamp,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      helpText: l10n.dateAndTime,
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_timestamp),
    );
    if (time == null) return;
    setState(() {
      _timestamp = DateTime(
        date.year, date.month, date.day, time.hour, time.minute,
      );
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final l10n = AppLocalizations.of(context);

    final anyFilled = [
      _fcCtrl, _sistCtrl, _diastCtrl, _rrCtrl,
      _tempCtrl, _spo2Ctrl, _diuresisCtrl,
    ].any((c) => c.text.trim().isNotEmpty);

    if (!anyFilled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.atLeastOneField)),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      final db = ref.read(appDatabaseProvider);
      if (db == null) return;

      double? pam = double.tryParse(_pamCtrl.text);
      if (pam == null) {
        final s = double.tryParse(_sistCtrl.text);
        final d = double.tryParse(_diastCtrl.text);
        if (s != null && d != null) pam = (s + 2 * d) / 3;
      }

      await db.insertarSignosVitales(
        SignosVitalesCompanion(
          pacienteId: Value(widget.pacienteId),
          timestamp: Value(_timestamp),
          frecuenciaCardiaca: Value(double.tryParse(_fcCtrl.text)),
          presionSistolica: Value(double.tryParse(_sistCtrl.text)),
          presionDiastolica: Value(double.tryParse(_diastCtrl.text)),
          presionMedia: Value(pam),
          frecuenciaRespiratoria: Value(double.tryParse(_rrCtrl.text)),
          temperatura: Value(double.tryParse(_tempCtrl.text)),
          saturacionO2: Value(double.tryParse(_spo2Ctrl.text)),
          diuresis: Value(double.tryParse(_diuresisCtrl.text)),
          notas: Value(
            _notasCtrl.text.trim().isEmpty ? null : _notasCtrl.text.trim(),
          ),
        ),
      );

      await ref.read(auditLoggerProvider)?.log(
            accion: AuditAction.create,
            entidad: 'signos_vitales',
            pacienteId: widget.pacienteId,
          );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.vitalsSaved)),
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
    final fmtDt =
        '${_timestamp.day.toString().padLeft(2, '0')}/${_timestamp.month.toString().padLeft(2, '0')}/${_timestamp.year} '
        '${_timestamp.hour.toString().padLeft(2, '0')}:${_timestamp.minute.toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.newVitalSigns),
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
                  onPressed: _save,
                  child: Text(
                    l10n.save,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
        ],
      ),
      body: Form(
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

            // FC y PA
            _SectionHeader('Hemodinámica'),
            _NumericField(
              ctrl: _fcCtrl,
              label: l10n.fieldFc,
              min: 20,
              max: 300,
              onChanged: (_) => setState(() {}),
            ),
            Row(
              children: [
                Expanded(
                  child: _NumericField(
                    ctrl: _sistCtrl,
                    label: l10n.fieldBpSystolic,
                    min: 40,
                    max: 300,
                    onChanged: (_) => _recalcPam(),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _NumericField(
                    ctrl: _diastCtrl,
                    label: l10n.fieldBpDiastolic,
                    min: 20,
                    max: 200,
                    onChanged: (_) => _recalcPam(),
                  ),
                ),
              ],
            ),
            _NumericField(
              ctrl: _pamCtrl,
              label: l10n.fieldMap,
              min: 20,
              max: 200,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),

            // Respiratorio + Temperatura + SpO2
            _SectionHeader('Respiratorio y temperatura'),
            _NumericField(
              ctrl: _rrCtrl,
              label: l10n.fieldRr,
              min: 5,
              max: 60,
              onChanged: (_) => setState(() {}),
            ),
            _NumericField(
              ctrl: _tempCtrl,
              label: l10n.fieldTemp,
              min: 30,
              max: 43,
              decimals: 1,
              onChanged: (_) => setState(() {}),
            ),
            _NumericField(
              ctrl: _spo2Ctrl,
              label: l10n.fieldSpo2,
              min: 50,
              max: 100,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),

            // Diuresis
            _SectionHeader('Renal'),
            _NumericField(
              ctrl: _diuresisCtrl,
              label: l10n.fieldDiuresis,
              min: 0,
              max: 1000,
              onChanged: (_) => setState(() {}),
            ),
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
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: InefColors.primaryDark,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _NumericField extends StatelessWidget {
  final TextEditingController ctrl;
  final String label;
  final double min;
  final double max;
  final int decimals;
  final ValueChanged<String>? onChanged;

  const _NumericField({
    required this.ctrl,
    required this.label,
    required this.min,
    required this.max,
    this.decimals = 0,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: ctrl,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          isDense: true,
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: decimals > 0),
        onChanged: onChanged,
        validator: (v) {
          if (v == null || v.trim().isEmpty) return null;
          final n = double.tryParse(v.trim().replaceAll(',', '.'));
          if (n == null || n < min || n > max) {
            return '$min – $max';
          }
          return null;
        },
      ),
    );
  }
}
