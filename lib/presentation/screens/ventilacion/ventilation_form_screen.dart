import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inef_uci/data/database/app_database.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/services/audit_logger.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class VentilationFormScreen extends ConsumerStatefulWidget {
  final int pacienteId;
  const VentilationFormScreen({super.key, required this.pacienteId});

  @override
  ConsumerState<VentilationFormScreen> createState() =>
      _VentilationFormScreenState();
}

class _VentilationFormScreenState
    extends ConsumerState<VentilationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _saving = false;

  DateTime _timestamp = DateTime.now();
  String? _modo;

  // Programados
  final _fio2Ctrl = TextEditingController();
  final _peepCtrl = TextEditingController();
  final _vtCtrl = TextEditingController();
  final _pcCtrl = TextEditingController();
  final _rrSetCtrl = TextEditingController();
  final _ieCtrl = TextEditingController();
  final _psCtrl = TextEditingController();
  final _trigCtrl = TextEditingController();

  // Medidos
  final _ppicoCtrl = TextEditingController();
  final _pmesetaCtrl = TextEditingController();
  final _pmediaCtrl = TextEditingController();
  final _vtExpCtrl = TextEditingController();
  final _rrTotalCtrl = TextEditingController();
  final _volMinCtrl = TextEditingController();
  final _fugaCtrl = TextEditingController();
  final _pao2Ctrl = TextEditingController();
  final _notasCtrl = TextEditingController();

  static const _modesWithVt = {'VC-CMV', 'VC-AC', 'SIMV', 'AutoFlow'};
  static const _modesWithPc = {'PC-AC', 'PC-CMV', 'PC-APRV'};
  static const _modesWithPs = {'PSV', 'SIMV', 'CPAP'};
  static const _modesWithRr = {'VC-CMV', 'VC-AC', 'PC-AC', 'PC-CMV', 'SIMV'};

  bool get _showVt => _modo != null && _modesWithVt.contains(_modo);
  bool get _showPc => _modo != null && _modesWithPc.contains(_modo);
  bool get _showPs => _modo != null && _modesWithPs.contains(_modo);
  bool get _showRr => _modo != null && _modesWithRr.contains(_modo);

  @override
  void dispose() {
    for (final c in [
      _fio2Ctrl, _peepCtrl, _vtCtrl, _pcCtrl, _rrSetCtrl,
      _ieCtrl, _psCtrl, _trigCtrl, _ppicoCtrl, _pmesetaCtrl,
      _pmediaCtrl, _vtExpCtrl, _rrTotalCtrl, _volMinCtrl,
      _fugaCtrl, _pao2Ctrl, _notasCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _pickDt() async {
    if (!mounted) return;
    final date = await showDatePicker(
      context: context,
      initialDate: _timestamp,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(hours: 1)),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_timestamp),
    );
    if (time == null) return;
    setState(() => _timestamp =
        DateTime(date.year, date.month, date.day, time.hour, time.minute));
  }

  // Auto-cálculos
  double? get _drivingPressure {
    final pm = double.tryParse(_pmesetaCtrl.text);
    final peep = double.tryParse(_peepCtrl.text);
    if (pm == null || peep == null) return null;
    return pm - peep;
  }

  double? get _compliance {
    final dp = _drivingPressure;
    final vt = double.tryParse(_vtExpCtrl.text);
    if (dp == null || vt == null || dp <= 0) return null;
    return vt / dp;
  }

  double? get _pfRatio {
    final pao2 = double.tryParse(_pao2Ctrl.text);
    final fio2 = double.tryParse(_fio2Ctrl.text);
    if (pao2 == null || fio2 == null || fio2 <= 0) return null;
    return pao2 / fio2;
  }

  String? get _ardsBerlin {
    final pf = _pfRatio;
    if (pf == null) return null;
    if (pf >= 300) return 'no';
    if (pf >= 200) return 'leve';
    if (pf >= 100) return 'moderado';
    return 'grave';
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final db = ref.read(appDatabaseProvider);
      if (db == null) return;

      await db.insertarVentilacion(
        VentilacionSavinaCompanion(
          pacienteId: Value(widget.pacienteId),
          timestamp: Value(_timestamp),
          modo: Value(_modo!),
          fio2: Value(double.tryParse(_fio2Ctrl.text)),
          peep: Value(double.tryParse(_peepCtrl.text)),
          volumenTidal: Value(double.tryParse(_vtCtrl.text)),
          pControl: Value(double.tryParse(_pcCtrl.text)),
          frecRespProgramada: Value(double.tryParse(_rrSetCtrl.text)),
          relIE: Value(double.tryParse(_ieCtrl.text)),
          pSoporte: Value(double.tryParse(_psCtrl.text)),
          trigger: Value(double.tryParse(_trigCtrl.text)),
          pPico: Value(double.tryParse(_ppicoCtrl.text)),
          pMeseta: Value(double.tryParse(_pmesetaCtrl.text)),
          pMedia: Value(double.tryParse(_pmediaCtrl.text)),
          vtEspirado: Value(double.tryParse(_vtExpCtrl.text)),
          frecRespTotal: Value(double.tryParse(_rrTotalCtrl.text)),
          volMinuto: Value(double.tryParse(_volMinCtrl.text)),
          fuga: Value(double.tryParse(_fugaCtrl.text)),
          drivingPressure: Value(_drivingPressure),
          complianceEstatica: Value(_compliance),
          pfRatio: Value(_pfRatio),
          ardsBerlin: Value(_ardsBerlin),
          notas: Value(
              _notasCtrl.text.trim().isEmpty ? null : _notasCtrl.text.trim()),
        ),
      );

      await ref.read(auditLoggerProvider)?.log(
            accion: AuditAction.create,
            entidad: 'ventilacion_savina',
            pacienteId: widget.pacienteId,
            detalle: {'modo': _modo, 'pf_ratio': _pfRatio},
          );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).ventSaved)),
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

    final modos = [
      ('VC-CMV', l10n.ventModeVcCmv),
      ('VC-AC', l10n.ventModeVcAc),
      ('PC-AC', l10n.ventModePcAc),
      ('PC-CMV', l10n.ventModePcCmv),
      ('SIMV', l10n.ventModeSimv),
      ('PSV', l10n.ventModePsv),
      ('CPAP', l10n.ventModeCpap),
      ('AutoFlow', l10n.ventModeAutoflow),
      ('PC-APRV', l10n.ventModeAprv),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.ventNew),
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
                  onPressed: _modo != null ? _save : null,
                  child: Text(l10n.save,
                      style: const TextStyle(color: Colors.white)),
                ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ── Timestamp ────────────────────────────────────────────────────
            Card(
              child: ListTile(
                leading: const Icon(Icons.access_time,
                    color: InefColors.primaryDark),
                title: Text(l10n.dateAndTime),
                subtitle: Text(fmtDt,
                    style: const TextStyle(fontWeight: FontWeight.w500)),
                trailing: const Icon(Icons.chevron_right),
                onTap: _pickDt,
              ),
            ),
            const SizedBox(height: 12),

            // ── Modo ventilatorio ─────────────────────────────────────────────
            DropdownButtonFormField<String>(
              initialValue: _modo,
              isExpanded: true,
              decoration: InputDecoration(
                labelText: l10n.fieldVentMode,
                border: const OutlineInputBorder(),
              ),
              items: modos
                  .map((e) => DropdownMenuItem(value: e.$1, child: Text(e.$2)))
                  .toList(),
              onChanged: (v) => setState(() => _modo = v),
              validator: (v) => v == null ? l10n.fieldRequired : null,
            ),
            const SizedBox(height: 12),

            // ── Parámetros programados ────────────────────────────────────────
            _SectionHeader('Parámetros programados'),
            Row(children: [
              Expanded(
                child: _VField(
                  ctrl: _fio2Ctrl,
                  label: l10n.fieldFio2,
                  min: 0.21, max: 1.0, decimals: 2,
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _VField(
                  ctrl: _peepCtrl,
                  label: l10n.fieldPeep,
                  min: 0, max: 30,
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ]),
            if (_showVt)
              _VField(
                ctrl: _vtCtrl,
                label: l10n.fieldVt,
                min: 100, max: 1200,
              ),
            if (_showPc)
              _VField(
                ctrl: _pcCtrl,
                label: l10n.fieldPControl,
                min: 5, max: 60,
              ),
            if (_showRr)
              _VField(
                ctrl: _rrSetCtrl,
                label: l10n.fieldRrSet,
                min: 4, max: 40,
              ),
            if (_showPs)
              _VField(
                ctrl: _psCtrl,
                label: l10n.fieldPSupport,
                min: 0, max: 40,
              ),
            Row(children: [
              Expanded(
                child: _VField(
                  ctrl: _ieCtrl,
                  label: l10n.fieldIERatio,
                  min: 0.1, max: 4.0, decimals: 2,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _VField(
                  ctrl: _trigCtrl,
                  label: l10n.fieldTrigger,
                  min: 0, max: 20, decimals: 1,
                ),
              ),
            ]),
            const SizedBox(height: 12),

            // ── Parámetros medidos ────────────────────────────────────────────
            _SectionHeader('Parámetros medidos'),
            Row(children: [
              Expanded(
                child: _VField(
                  ctrl: _ppicoCtrl,
                  label: l10n.fieldPeak,
                  min: 0, max: 80,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _VField(
                  ctrl: _pmesetaCtrl,
                  label: l10n.fieldPlateau,
                  min: 0, max: 60,
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ]),
            Row(children: [
              Expanded(
                child: _VField(
                  ctrl: _pmediaCtrl,
                  label: l10n.fieldMeanAirway,
                  min: 0, max: 40,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _VField(
                  ctrl: _vtExpCtrl,
                  label: l10n.fieldVtExp,
                  min: 0, max: 1500,
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ]),
            Row(children: [
              Expanded(
                child: _VField(
                  ctrl: _rrTotalCtrl,
                  label: l10n.fieldRrTotal,
                  min: 0, max: 60,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _VField(
                  ctrl: _volMinCtrl,
                  label: l10n.fieldMinVol,
                  min: 0, max: 30, decimals: 1,
                ),
              ),
            ]),
            _VField(
              ctrl: _fugaCtrl,
              label: l10n.fieldLeak,
              min: 0, max: 100,
            ),
            const SizedBox(height: 12),

            // ── Oxigenación / ARDS ────────────────────────────────────────────
            _SectionHeader('Oxigenación'),
            _VField(
              ctrl: _pao2Ctrl,
              label: l10n.fieldPao2,
              min: 30, max: 600,
              onChanged: (_) => setState(() {}),
            ),

            // Auto-cálculos
            if (_drivingPressure != null || _compliance != null ||
                _pfRatio != null)
              _AutoCalcCard(
                dp: _drivingPressure,
                compliance: _compliance,
                pfRatio: _pfRatio,
                ardsBerlin: _ardsBerlin,
                l10n: l10n,
              ),
            const SizedBox(height: 12),

            // ── Notas ──────────────────────────────────────────────────────────
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

// ─── Auto-calc card ───────────────────────────────────────────────────────────

class _AutoCalcCard extends StatelessWidget {
  final double? dp, compliance, pfRatio;
  final String? ardsBerlin;
  final AppLocalizations l10n;
  const _AutoCalcCard({
    required this.dp,
    required this.compliance,
    required this.pfRatio,
    required this.ardsBerlin,
    required this.l10n,
  });

  Color _ardsColor(String? ards) {
    switch (ards) {
      case 'leve':
        return InefColors.warning;
      case 'moderado':
        return Colors.orange.shade800;
      case 'grave':
        return InefColors.critical;
      default:
        return InefColors.success;
    }
  }

  String _ardsLabel(String? ards, AppLocalizations l10n) {
    switch (ards) {
      case 'leve':
        return l10n.ardsMild;
      case 'moderado':
        return l10n.ardsModerate;
      case 'grave':
        return l10n.ardsSevere;
      default:
        return l10n.ardsNone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: InefColors.primaryDark.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border:
            Border.all(color: InefColors.primaryDark.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Calculado automáticamente',
            style: TextStyle(
              fontSize: 11,
              color: InefColors.primaryMedium,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 12,
            runSpacing: 4,
            children: [
              if (dp != null)
                _CalcChip(l10n.fieldDrivingPressure,
                    '${dp!.toStringAsFixed(1)} cmH₂O',
                    alert: dp! > 15),
              if (compliance != null)
                _CalcChip(l10n.fieldCompliance,
                    '${compliance!.toStringAsFixed(1)} mL/cmH₂O'),
              if (pfRatio != null)
                _CalcChip(l10n.fieldPfRatio,
                    pfRatio!.toStringAsFixed(0),
                    alert: pfRatio! < 300),
              if (ardsBerlin != null)
                _CalcChip(
                  'ARDS Berlin',
                  _ardsLabel(ardsBerlin, l10n),
                  color: _ardsColor(ardsBerlin),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CalcChip extends StatelessWidget {
  final String label, value;
  final bool alert;
  final Color? color;
  const _CalcChip(this.label, this.value,
      {this.alert = false, this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? (alert ? InefColors.critical : InefColors.primaryDark);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: c.withValues(alpha: 0.3)),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label: ',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontFamily:
                    Theme.of(context).textTheme.bodySmall?.fontFamily,
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: c,
                fontFamily:
                    Theme.of(context).textTheme.bodySmall?.fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Helpers ─────────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);
  @override
  Widget build(BuildContext context) => Padding(
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

class _VField extends StatelessWidget {
  final TextEditingController ctrl;
  final String label;
  final double min, max;
  final int decimals;
  final ValueChanged<String>? onChanged;
  const _VField({
    required this.ctrl,
    required this.label,
    required this.min,
    required this.max,
    this.decimals = 0,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          controller: ctrl,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          keyboardType:
              TextInputType.numberWithOptions(decimal: decimals > 0),
          validator: (v) {
            if (v == null || v.trim().isEmpty) return null;
            final n =
                double.tryParse(v.trim().replaceAll(',', '.'));
            if (n == null || n < min || n > max) return '$min–$max';
            return null;
          },
        ),
      );
}
