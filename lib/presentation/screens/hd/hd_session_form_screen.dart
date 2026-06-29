import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inef_uci/data/database/app_database.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/services/audit_logger.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class HdSessionFormScreen extends ConsumerStatefulWidget {
  final int pacienteId;
  const HdSessionFormScreen({super.key, required this.pacienteId});

  @override
  ConsumerState<HdSessionFormScreen> createState() =>
      _HdSessionFormScreenState();
}

class _HdSessionFormScreenState extends ConsumerState<HdSessionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _saving = false;

  // Fecha/hora
  DateTime _inicio = DateTime.now();
  DateTime? _fin;

  // Acceso vascular
  String? _tipoAcceso;
  String? _lateralidad;
  String? _tipoCateter;

  // Parámetros
  final _durProgCtrl = TextEditingController();
  final _durRealCtrl = TextEditingController();
  final _qbCtrl = TextEditingController();
  final _qdCtrl = TextEditingController();

  // Dializador
  final _dialTipoCtrl = TextEditingController();
  final _dialSupCtrl = TextEditingController();
  final _dialKufCtrl = TextEditingController();

  // Baño
  final _baNaCtrl = TextEditingController();
  final _baKCtrl = TextEditingController();
  final _baCaCtrl = TextEditingController();
  final _baHco3Ctrl = TextEditingController();
  final _baGluCtrl = TextEditingController();

  // UF
  final _ufProgCtrl = TextEditingController();
  final _ufRealCtrl = TextEditingController();

  // Anticoagulación
  String? _anticoag;
  final _hepBoloCtrl = TextEditingController();
  final _hepMantCtrl = TextEditingController();

  // Pesos
  final _pesoPreCtrl = TextEditingController();
  final _pesoPostCtrl = TextEditingController();
  final _pesoSecoCtrl = TextEditingController();

  // Eventos
  final _eventosCtrl = TextEditingController();

  bool get _esCateter => _tipoAcceso != null &&
      (_tipoAcceso!.contains('yug') ||
          _tipoAcceso!.contains('femoral') ||
          _tipoAcceso!.contains('subclavio'));

  @override
  void dispose() {
    for (final c in [
      _durProgCtrl, _durRealCtrl, _qbCtrl, _qdCtrl,
      _dialTipoCtrl, _dialSupCtrl, _dialKufCtrl,
      _baNaCtrl, _baKCtrl, _baCaCtrl, _baHco3Ctrl, _baGluCtrl,
      _ufProgCtrl, _ufRealCtrl,
      _hepBoloCtrl, _hepMantCtrl,
      _pesoPreCtrl, _pesoPostCtrl, _pesoSecoCtrl,
      _eventosCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _pickDt({required bool isStart}) async {
    if (!mounted) return;
    final initial = isStart ? _inicio : (_fin ?? DateTime.now());
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(hours: 8)),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
    );
    if (time == null) return;
    final dt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() => isStart ? _inicio = dt : _fin = dt);
  }

  double? _calcUfRate() {
    final uf = double.tryParse(_ufProgCtrl.text);
    final dur = int.tryParse(_durProgCtrl.text);
    final peso = double.tryParse(_pesoPostCtrl.text) ??
        double.tryParse(_pesoPreCtrl.text);
    if (uf == null || dur == null || peso == null || dur == 0 || peso == 0) {
      return null;
    }
    return (uf / dur * 60) / peso; // mL/kg/h
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final db = ref.read(appDatabaseProvider);
      if (db == null) return;

      await db.insertarSesionHd(
        SesionesHdCompanion(
          pacienteId: Value(widget.pacienteId),
          fechaHoraInicio: Value(_inicio),
          fechaHoraFin: Value(_fin),
          tipoAcceso: Value(_tipoAcceso!),
          lateralidadAcceso: Value(_lateralidad),
          tipoAccesoCateter: Value(_esCateter ? _tipoCateter : null),
          duracionProgramadaMin: Value(int.parse(_durProgCtrl.text)),
          duracionRealMin: Value(int.tryParse(_durRealCtrl.text)),
          qb: Value(double.parse(_qbCtrl.text)),
          qd: Value(double.parse(_qdCtrl.text)),
          dializadorTipo: Value(_dialTipoCtrl.text.trim().isEmpty
              ? null
              : _dialTipoCtrl.text.trim()),
          dializadorSuperficieM2: Value(double.tryParse(_dialSupCtrl.text)),
          dializadorKuf: Value(double.tryParse(_dialKufCtrl.text)),
          banoNa: Value(double.tryParse(_baNaCtrl.text)),
          banoK: Value(double.tryParse(_baKCtrl.text)),
          banoCa: Value(double.tryParse(_baCaCtrl.text)),
          banoHco3: Value(double.tryParse(_baHco3Ctrl.text)),
          banoGlucosa: Value(double.tryParse(_baGluCtrl.text)),
          ufTotalProgramadaMl: Value(double.parse(_ufProgCtrl.text)),
          ufTotalRealMl: Value(double.tryParse(_ufRealCtrl.text)),
          tasaUfMlKgH: Value(_calcUfRate()),
          tipoAnticoagulacion: Value(_anticoag),
          heparinaBoloPorUI: Value(double.tryParse(_hepBoloCtrl.text)),
          heparinaMantenimientoUiH: Value(double.tryParse(_hepMantCtrl.text)),
          pesoPreHdKg: Value(double.tryParse(_pesoPreCtrl.text)),
          pesoPostHdKg: Value(double.tryParse(_pesoPostCtrl.text)),
          pesoSecoObjetivoKg: Value(double.tryParse(_pesoSecoCtrl.text)),
          eventosDurante: Value(_eventosCtrl.text.trim().isEmpty
              ? null
              : _eventosCtrl.text.trim()),
        ),
      );

      await ref.read(auditLoggerProvider)?.log(
            accion: AuditAction.create,
            entidad: 'sesiones_hd',
            pacienteId: widget.pacienteId,
          );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).hdSaved)),
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

    final accessItems = [
      ('fav_radio', l10n.hdAccessFav),
      ('fav_braquio', l10n.hdAccessFavBrachio),
      ('fav_braquiobasilic', l10n.hdAccessFavBrachiobasilic),
      ('injerto', l10n.hdAccessGraft),
      ('yug', l10n.hdAccessJugular),
      ('femoral', l10n.hdAccessFemoral),
      ('subclavio', l10n.hdAccessSubclavian),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.hdNew),
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
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ── Fecha/hora ───────────────────────────────────────────────────
            _SectionHeader(l10n.fieldStartTime),
            _DtTile(
              label: l10n.fieldStartTime,
              dt: _inicio,
              onTap: () => _pickDt(isStart: true),
            ),
            _DtTile(
              label: l10n.fieldEndTime,
              dt: _fin,
              onTap: () => _pickDt(isStart: false),
            ),
            const SizedBox(height: 12),

            // ── Acceso vascular ───────────────────────────────────────────────
            _SectionHeader(l10n.fieldVascularAccess),
            DropdownButtonFormField<String>(
              initialValue: _tipoAcceso,
              isExpanded: true,
              decoration: InputDecoration(
                labelText: l10n.fieldVascularAccess,
                border: const OutlineInputBorder(),
              ),
              items: accessItems
                  .map((e) => DropdownMenuItem(value: e.$1, child: Text(e.$2)))
                  .toList(),
              onChanged: (v) => setState(() {
                _tipoAcceso = v;
                _tipoCateter = null;
              }),
              validator: (v) => v == null ? l10n.fieldRequired : null,
            ),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: _lateralidad,
                  decoration: InputDecoration(
                    labelText: l10n.fieldLaterality,
                    border: const OutlineInputBorder(),
                  ),
                  items: [
                    DropdownMenuItem(
                        value: 'izq', child: Text(l10n.lateralLeft)),
                    DropdownMenuItem(
                        value: 'der', child: Text(l10n.lateralRight)),
                  ],
                  onChanged: (v) => setState(() => _lateralidad = v),
                ),
              ),
              if (_esCateter) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _tipoCateter,
                    decoration: InputDecoration(
                      labelText: l10n.fieldCatheterType,
                      border: const OutlineInputBorder(),
                    ),
                    items: [
                      DropdownMenuItem(
                          value: 'transitorio',
                          child: Text(l10n.cathTransient)),
                      DropdownMenuItem(
                          value: 'tunelizado',
                          child: Text(l10n.cathTunneled)),
                    ],
                    onChanged: (v) => setState(() => _tipoCateter = v),
                  ),
                ),
              ],
            ]),
            const SizedBox(height: 12),

            // ── Parámetros de sesión ──────────────────────────────────────────
            _SectionHeader('Parámetros de sesión'),
            Row(children: [
              Expanded(
                child: _IntField(
                  ctrl: _durProgCtrl,
                  label: l10n.fieldPlannedDuration,
                  required: true,
                  min: 30, max: 600,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _IntField(
                  ctrl: _durRealCtrl,
                  label: l10n.fieldActualDuration,
                  min: 0, max: 600,
                ),
              ),
            ]),
            Row(children: [
              Expanded(
                child: _RealField(
                  ctrl: _qbCtrl,
                  label: l10n.fieldQb,
                  required: true,
                  min: 50, max: 600,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _RealField(
                  ctrl: _qdCtrl,
                  label: l10n.fieldQd,
                  required: true,
                  min: 100, max: 1000,
                ),
              ),
            ]),
            const SizedBox(height: 12),

            // ── Dializador ────────────────────────────────────────────────────
            _SectionHeader(l10n.fieldDialyzer),
            TextFormField(
              controller: _dialTipoCtrl,
              decoration: InputDecoration(
                labelText: l10n.fieldDialyzer,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(
                child: _RealField(
                  ctrl: _dialSupCtrl,
                  label: l10n.fieldDialyzerSurface,
                  min: 0.5, max: 3.0, decimals: 2,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _RealField(
                  ctrl: _dialKufCtrl,
                  label: l10n.fieldDialyzerKuf,
                  min: 0, max: 100,
                ),
              ),
            ]),
            const SizedBox(height: 12),

            // ── Baño de diálisis ──────────────────────────────────────────────
            _SectionHeader(l10n.fieldDialysisBath),
            Row(children: [
              Expanded(child: _RealField(ctrl: _baNaCtrl, label: l10n.fieldBathNa, min: 130, max: 160)),
              const SizedBox(width: 8),
              Expanded(child: _RealField(ctrl: _baKCtrl, label: l10n.fieldBathK, min: 0, max: 6)),
              const SizedBox(width: 8),
              Expanded(child: _RealField(ctrl: _baCaCtrl, label: l10n.fieldBathCa, min: 0, max: 4, decimals: 2)),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: _RealField(ctrl: _baHco3Ctrl, label: l10n.fieldBathHco3, min: 20, max: 45)),
              const SizedBox(width: 8),
              Expanded(child: _RealField(ctrl: _baGluCtrl, label: l10n.fieldBathGlucose, min: 0, max: 300)),
              const Expanded(child: SizedBox()),
            ]),
            const SizedBox(height: 12),

            // ── Ultrafiltración ───────────────────────────────────────────────
            _SectionHeader('Ultrafiltración'),
            Row(children: [
              Expanded(
                child: _RealField(
                  ctrl: _ufProgCtrl,
                  label: l10n.fieldUfPlanned,
                  required: true, min: 0, max: 6000,
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _RealField(
                  ctrl: _ufRealCtrl,
                  label: l10n.fieldUfActual,
                  min: 0, max: 6000,
                ),
              ),
            ]),
            if (_calcUfRate() != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  '${l10n.fieldUfRate}: ${_calcUfRate()!.toStringAsFixed(2)} mL/kg/h',
                  style: TextStyle(
                    color: _calcUfRate()! > 13.0
                        ? InefColors.critical
                        : InefColors.success,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            const SizedBox(height: 12),

            // ── Anticoagulación ───────────────────────────────────────────────
            _SectionHeader(l10n.fieldAnticoagulation),
            DropdownButtonFormField<String>(
              initialValue: _anticoag,
              decoration: InputDecoration(
                labelText: l10n.fieldAnticoagulation,
                border: const OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(
                    value: 'heparina', child: Text(l10n.anticoagHeparin)),
                DropdownMenuItem(
                    value: 'citrato', child: Text(l10n.anticoagCitrate)),
                DropdownMenuItem(
                    value: 'ninguna', child: Text(l10n.anticoagNone)),
              ],
              onChanged: (v) => setState(() => _anticoag = v),
            ),
            if (_anticoag == 'heparina') ...[
              const SizedBox(height: 10),
              Row(children: [
                Expanded(
                  child: _RealField(
                      ctrl: _hepBoloCtrl,
                      label: l10n.fieldHeparinBolus,
                      min: 0, max: 10000),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _RealField(
                      ctrl: _hepMantCtrl,
                      label: l10n.fieldHeparinMaint,
                      min: 0, max: 5000),
                ),
              ]),
            ],
            const SizedBox(height: 12),

            // ── Pesos ──────────────────────────────────────────────────────────
            _SectionHeader('Pesos'),
            Row(children: [
              Expanded(
                child: _RealField(
                  ctrl: _pesoPreCtrl,
                  label: l10n.fieldPreWeight,
                  min: 20, max: 250, decimals: 1,
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _RealField(
                  ctrl: _pesoPostCtrl,
                  label: l10n.fieldPostWeight,
                  min: 20, max: 250, decimals: 1,
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ]),
            _RealField(
              ctrl: _pesoSecoCtrl,
              label: l10n.fieldDryWeightTarget,
              min: 20, max: 250, decimals: 1,
            ),
            const SizedBox(height: 12),

            // ── Eventos ───────────────────────────────────────────────────────
            TextFormField(
              controller: _eventosCtrl,
              decoration: InputDecoration(
                labelText: l10n.fieldSessionEvents,
                border: const OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 80),
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

class _DtTile extends StatelessWidget {
  final String label;
  final DateTime? dt;
  final VoidCallback onTap;
  const _DtTile({required this.label, required this.dt, required this.onTap});

  String _fmt(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year} '
      '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          dense: true,
          leading:
              const Icon(Icons.access_time, color: InefColors.primaryDark),
          title: Text(label, style: const TextStyle(fontSize: 13)),
          subtitle: dt != null
              ? Text(_fmt(dt!),
                  style: const TextStyle(fontWeight: FontWeight.w500))
              : Text('—', style: TextStyle(color: Colors.grey[400])),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      );
}

class _IntField extends StatelessWidget {
  final TextEditingController ctrl;
  final String label;
  final bool required;
  final int min, max;
  const _IntField({
    required this.ctrl, required this.label,
    this.required = false, required this.min, required this.max,
  });
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          controller: ctrl,
          decoration: InputDecoration(
            labelText: label, border: const OutlineInputBorder(), isDense: true,
          ),
          keyboardType: TextInputType.number,
          validator: (v) {
            if (required && (v == null || v.trim().isEmpty)) {
              return AppLocalizations.of(context).fieldRequired;
            }
            if (v != null && v.trim().isNotEmpty) {
              final n = int.tryParse(v.trim());
              if (n == null || n < min || n > max) return '$min–$max';
            }
            return null;
          },
        ),
      );
}

class _RealField extends StatelessWidget {
  final TextEditingController ctrl;
  final String label;
  final bool required;
  final double min, max;
  final int decimals;
  final ValueChanged<String>? onChanged;
  const _RealField({
    required this.ctrl, required this.label,
    this.required = false, required this.min, required this.max,
    this.decimals = 1, this.onChanged,
  });
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          controller: ctrl,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label, border: const OutlineInputBorder(), isDense: true,
          ),
          keyboardType:
              TextInputType.numberWithOptions(decimal: decimals > 0),
          validator: (v) {
            if (required && (v == null || v.trim().isEmpty)) {
              return AppLocalizations.of(context).fieldRequired;
            }
            if (v != null && v.trim().isNotEmpty) {
              final n = double.tryParse(v.trim().replaceAll(',', '.'));
              if (n == null || n < min || n > max) return '$min–$max';
            }
            return null;
          },
        ),
      );
}
